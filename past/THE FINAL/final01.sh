#!/bin/bash

# Variables
URL="https://www.w3schools.com"
SEARCH_TEXT="W3Schools"

# Function to check the website
check_site() {
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    PAGE_CONTENT=$(curl -s "$URL")

    if [[ "$HTTP_STATUS" == "200" && "$PAGE_CONTENT" == *"$SEARCH_TEXT"* ]]; then
        echo "$URL is UP - Status: $HTTP_STATUS"
        echo "Found expected text: $SEARCH_TEXT"
    else
        echo "$URL is DOWN or returning unexpected content"
        echo "Status: $HTTP_STATUS"
    fi
}

# Run the function
check_site
