#!/bin/bash

# Check if CUPS web server is up at localhost:631
URL="http://localhost:631"
SEARCHTEXT="CUPS"

# Get HTTP status and page content
HTTPSTATUS=$(curl -s -o /tmp/cupscontent.txt -w "%{http_code}" $URL)
PAGECONTENT=$(cat /tmp/cupscontent.txt 2>/dev/null)

# Check if server is up (200 OK and contains expected text)
if [ "$HTTPSTATUS" = "200" ] && echo "$PAGECONTENT" | grep -q "$SEARCHTEXT"; then
    echo "CUPS server is UP"
    echo "- HTTP 200 OK"
    echo "- Content verified"
else
    echo "CUPS server is DOWN"
    echo
    
    # Check if the OS server is up (single ping)
    if ping -c 1 localhost > /dev/null 2>&1; then
        echo "OS server is up (Single Ping)"
    else
        echo "Need to boot server"
        exit 1
    fi
    
    # If server is booted but webcheck fails, restart cups
    echo "Server is booted, but the webcheck fails:"
    echo "Use a remote command to restart the cups system."
    
    sudo systemctl restart cups
    
    if [ $? -eq 0 ]; then
        echo "CUPS restart command executed successfully"
        sleep 2
        
        # Re-check
        HTTPSTATUSRECHECK=$(curl -s -o /tmp/cupscontentrecheck.txt -w "%{http_code}" $URL)
        PAGECONTENTRECHECK=$(cat /tmp/cupscontentrecheck.txt 2>/dev/null)
        
        if [ "$HTTPSTATUSRECHECK" = "200" ] && echo "$PAGECONTENTRECHECK" | grep -q "$SEARCHTEXT"; then
            echo
            echo "SUCCESS: CUPS server is now UP"
            echo "- CUPS restart successful"
            echo "- HTTP 200 OK"
            echo "- Content verified"
        else
            echo
            echo "ERROR: CUPS server still DOWN"
            echo "- Manual intervention required"
        fi
    else
        echo "Failed to restart CUPS"
    fi
fi

# Cleanup
rm -f /tmp/cupscontent.txt /tmp/cupscontentrecheck.txt
