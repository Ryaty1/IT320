#!/bin/bash

SERVER_IP="98.80.221.81"
URL="http://${SERVER_IP}"
EXPECTED_TEXT="It works"
SSH_KEY="/Users/kimchhayheng/Desktop/Spring 2025/IT 320/IT320.pem"
SSH_USER="ec2-user"

echo "========================================"
echo "WebCheck Script - Starting checks..."
echo "Server: $SERVER_IP"
echo "URL: $URL"
echo "========================================"

HTTP_STATUS=$(curl -s -o /tmp/webpage_content.txt -w "%{http_code}" "$URL")
PAGE_CONTENT=$(cat /tmp/webpage_content.txt 2>/dev/null)

echo ""
echo "Checking 200 OK status..."
if [ "$HTTP_STATUS" == "200" ]; then
    echo "[✓] HTTP Status: 200 OK"
else
    echo "[✗] HTTP Status: $HTTP_STATUS (Expected: 200)"
fi

echo ""
echo "Checking for expected text..."
if echo "$PAGE_CONTENT" | grep -q "$EXPECTED_TEXT"; then
    echo "[✓] Text '$EXPECTED_TEXT' found in page"
else
    echo "[✗] Text '$EXPECTED_TEXT' NOT found in page"
fi

echo ""
echo "========================================"

if [ "$HTTP_STATUS" == "200" ] && echo "$PAGE_CONTENT" | grep -q "$EXPECTED_TEXT"; then
    echo "RESULT: Website is UP ✓"
    echo "  - HTTP 200 OK"
    echo "  - Content verified"
    echo "  - All systems operational"
else
    echo "RESULT: Website is DOWN ✗"
    echo ""
    
    echo "Attempting to diagnose issue..."
    echo "Checking server connectivity via SSH..."
    
    ssh -i "$SSH_KEY" -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes "${SSH_USER}@${SERVER_IP}" "exit" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "[✓] Server is REACHABLE (SSH successful)"
        echo ""
        echo "Server is up but webpage is down"
        echo "Attempting to restart Apache web server..."
        echo ""
        
        ssh -i "$SSH_KEY" -o StrictHostKeyChecking=no -o ConnectTimeout=10 "${SSH_USER}@${SERVER_IP}" "sudo systemctl restart httpd" 2>/dev/null
        
        if [ $? -eq 0 ]; then
            echo "[✓] Apache restart command executed successfully"
            echo "Waiting for service to start..."
            sleep 3
            
            echo "Re-checking website status..."
            HTTP_STATUS_RECHECK=$(curl -s -o /tmp/webpage_recheck.txt -w "%{http_code}" "$URL")
            PAGE_CONTENT_RECHECK=$(cat /tmp/webpage_recheck.txt 2>/dev/null)
            
            if [ "$HTTP_STATUS_RECHECK" == "200" ] && echo "$PAGE_CONTENT_RECHECK" | grep -q "$EXPECTED_TEXT"; then
                echo ""
                echo "========================================"
                echo "SUCCESS: Website is now UP ✓"
                echo "  - Apache restart successful"
                echo "  - HTTP 200 OK"
                echo "  - Content verified"
            else
                echo ""
                echo "========================================"
                echo "ERROR: Website still DOWN ✗"
                echo "  - Apache restarted but issue persists"
                echo "  - HTTP Status: $HTTP_STATUS_RECHECK"
                echo "  - Manual intervention required"
            fi
        else
            echo "[✗] Failed to restart Apache remotely"
            echo "  - Check SSH connection"
            echo "  - Verify key file permissions"
            echo "  - Check SSH key path: $SSH_KEY"
        fi
    else
        echo "[✗] Server is DOWN (SSH failed)"
        echo "  - Cannot reach server at $SERVER_IP"
        echo "  - Server may be stopped or network issue"
        echo "  - Cannot attempt remote fixes"
    fi
fi

echo "========================================"
echo "WebCheck Script - Complete"
echo "========================================"

rm -f /tmp/webpage_content.txt /tmp/webpage_recheck.txt
