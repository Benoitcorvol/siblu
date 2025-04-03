#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Required environment variables
REQUIRED_VARS=(
  "FIREBASE_API_KEY"
  "FIREBASE_APP_ID"
  "FIREBASE_PROJECT_ID"
  "FIREBASE_MESSAGING_SENDER_ID"
  "MONITORING_API_KEY"
)

# Check if .env file exists
if [ ! -f .env ]; then
  echo -e "${RED}Error: .env file not found${NC}"
  echo "Please copy .env.example to .env and fill in the values"
  exit 1
fi

# Source the .env file
source .env

# Validate each required variable
MISSING_VARS=0
for var in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    echo -e "${RED}Error: $var is not set${NC}"
    MISSING_VARS=1
  fi
done

if [ $MISSING_VARS -eq 1 ]; then
  echo -e "${RED}Missing required environment variables${NC}"
  exit 1
fi

echo -e "${GREEN}All required environment variables are set${NC}"
exit 0