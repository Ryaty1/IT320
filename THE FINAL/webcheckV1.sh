#!/bin/bash

URL="http://34.236.216.87"
SERVER_IP="34.236.216.87"
SEARCH_TEXT="Hello from my EC2 web server"

web_status=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
page_content=$(curl -s "$URL")

if [[ "$web_status" == "200" && "$page_content" == *"$SEARCH_TEXT"* ]]; then
    echo "Website is UP. Status: $web_status"
    echo "Found expected text: $SEARCH_TEXT"
else
    echo "Website is DOWN or returning unexpected content."
    echo "HTTP Status: $web_status"

    if ping -c 1 -W 2 "$SERVER_IP" >/dev/null 2>&1; then
        echo "Server is UP, but webserver/content has a problem."
    else
        echo "Server is DOWN or unreachable (ping failed)."
    fi
fi
