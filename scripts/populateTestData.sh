#!/usr/bin/env bash
echo "---------------------------------------------------------------------"
echo "Starting script to populate test data.."
echo "---------------------------------------------------------------------"
echo

CWD="${0%/*}"

if [[ "$CWD" =~ ^(.*)\.sh$ ]];
then
    CWD="."
fi

echo "Loading env vars..."
source $CWD/env.sh

echo
echo "---------------------------------------------------------------------"
echo " Creating TestData for $FSPList"
echo "---------------------------------------------------------------------"
echo " Prerequisites for Central-Ledger:"
echo "    1. Ensure you run 'npm run migrate'"
echo "    2. The below requests only work for the 'ADMIN' API"

for FSP in "${FSPList[@]}"
do
  echo ''
  echo "*********************************************************************"
  echo ''
  echo
  echo "Creating participants '$FSP'"
  echo "---------------------------------------------------------------------"
  CURL="curl -i -X POST \
    http://$CENTRAL_LEDGER_HOST/admin/participants \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"name\": \"$FSP\",
    \"currency\":\"USD\"
  }'"
  echo "$CURL"
  sh -c "$CURL"

  echo
  echo "Setting limits and initial position for '$FSP'"
  echo "---------------------------------------------------------------------"
  CURL="curl -i -X POST \
    http://$CENTRAL_LEDGER_HOST/admin/participants/$FSP/initialPositionAndLimits \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"currency\": \"USD\",
    \"limit\": {
      \"type\": \"NET_DEBIT_CAP\",
      \"value\": $DEFAULT_NET_DEBIT_CAP
    },
    \"initialPosition\": 0
  }'"
  echo "$CURL"
  sh -c "$CURL"

  echo
  echo "Retrieving limits for '$FSP'"
  echo "---------------------------------------------------------------------"
  curl -X GET \
    http://$CENTRAL_LEDGER_HOST/admin/participants/$FSP/limits \
    -H 'Cache-Control: no-cache'

done

echo
