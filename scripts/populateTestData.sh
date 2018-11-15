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
  echo "Set callback URIs for '${FSP1}' "
  echo "---------------------------------------------------------------------"
  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP1}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
    \"value\": \"${FSP1_URL_PREFIX}://${FSP1_HOST}:${FSP1_PORT}${FSP1_BASE_URL}/transfers\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP1}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
    \"value\": \"${FSP1_URL_PREFIX}://${FSP1_HOST}:${FSP1_PORT}${FSP1_BASE_URL}/transfers/{{transferId}}\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP1}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
    \"value\": \"${FSP1_URL_PREFIX}://${FSP1_HOST}:${FSP1_PORT}${FSP1_BASE_URL}/transfers/{{transferId}}/error\"
  }'"

  echo
  echo "Set callback URIs for '${FSP2}' "
  echo "---------------------------------------------------------------------"
  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP2}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
    \"value\": \"${FSP2_URL_PREFIX}://${FSP2_HOST}:${FSP2_PORT}${FSP2_BASE_URL}/transfers\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP2}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
    \"value\": \"${FSP2_URL_PREFIX}://${FSP2_HOST}:${FSP2_PORT}${FSP2_BASE_URL}/transfers/{{transferId}}\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP2}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
    \"value\": \"${FSP2_URL_PREFIX}://${FSP2_HOST}:${FSP2_PORT}${FSP2_BASE_URL}/transfers/{{transferId}}/error\"
  }'"

  echo
    echo "Set callback URIs for '${FSP3}' "
    echo "---------------------------------------------------------------------"
    sh -c "curl -X POST \
      http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP3}/endpoints \
      -H 'Cache-Control: no-cache' \
      -H 'Content-Type: application/json' \
      -d '{
      \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
      \"value\": \"${FSP3_URL_PREFIX}://${FSP3_HOST}:${FSP3_PORT}${FSP3_BASE_URL}/transfers\"
    }'"

    sh -c "curl -X POST \
      http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP3}/endpoints \
      -H 'Cache-Control: no-cache' \
      -H 'Content-Type: application/json' \
      -d '{
      \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
      \"value\": \"${FSP3_URL_PREFIX}://${FSP3_HOST}:${FSP3_PORT}${FSP3_BASE_URL}/transfers/{{transferId}}\"
    }'"

    sh -c "curl -X POST \
      http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP3}/endpoints \
      -H 'Cache-Control: no-cache' \
      -H 'Content-Type: application/json' \
      -d '{
      \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
      \"value\": \"${FSP3_URL_PREFIX}://${FSP3_HOST}:${FSP3_PORT}${FSP3_BASE_URL}/transfers/{{transferId}}/error\"
    }'"

    echo
    echo "Set callback URIs for '${FSP4}' "
    echo "---------------------------------------------------------------------"
    sh -c "curl -X POST \
      http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP4}/endpoints \
      -H 'Cache-Control: no-cache' \
      -H 'Content-Type: application/json' \
      -d '{
      \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
      \"value\": \"${FSP4_URL_PREFIX}://${FSP4_HOST}:${FSP4_PORT}${FSP4_BASE_URL}/transfers\"
    }'"

    sh -c "curl -X POST \
      http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP4}/endpoints \
      -H 'Cache-Control: no-cache' \
      -H 'Content-Type: application/json' \
      -d '{
      \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
      \"value\": \"${FSP4_URL_PREFIX}://${FSP4_HOST}:${FSP4_PORT}${FSP4_BASE_URL}/transfers/{{transferId}}\"
    }'"

    sh -c "curl -X POST \
      http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP4}/endpoints \
      -H 'Cache-Control: no-cache' \
      -H 'Content-Type: application/json' \
      -d '{
      \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
      \"value\": \"${FSP4_URL_PREFIX}://${FSP4_HOST}:${FSP4_PORT}${FSP4_BASE_URL}/transfers/{{transferId}}/error\"
    }'"

  echo
  echo "Set callback URIs for '${FSP5}' "
  echo "---------------------------------------------------------------------"
  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP5}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
    \"value\": \"${MOCK_FSP_URL_PREFIX}://${MOCK_FSP_HOST}:${MOCK_FSP_PORT}${MOCK_FSP_BASE_URL}/transfers\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP5}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
    \"value\": \"${MOCK_FSP_URL_PREFIX}://${MOCK_FSP_HOST}:${MOCK_FSP_PORT}${MOCK_FSP_BASE_URL}/transfers/{{transferId}}\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP5}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
    \"value\": \"${MOCK_FSP_URL_PREFIX}://${MOCK_FSP_HOST}:${MOCK_FSP_PORT}${MOCK_FSP_BASE_URL}/transfers/{{transferId}}/error\"
  }'"

  echo
  echo "Set callback URIs for '${FSP6}' "
  echo "---------------------------------------------------------------------"
  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP6}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
    \"value\": \"${MOCK_FSP_URL_PREFIX}://${MOCK_FSP_HOST}:${MOCK_FSP_PORT}${MOCK_FSP_BASE_URL}/transfers\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP6}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
    \"value\": \"${MOCK_FSP_URL_PREFIX}://${MOCK_FSP_HOST}:${MOCK_FSP_PORT}${MOCK_FSP_BASE_URL}/transfers/{{transferId}}\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP6}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
    \"value\": \"${MOCK_FSP_URL_PREFIX}://${MOCK_FSP_HOST}:${MOCK_FSP_PORT}${MOCK_FSP_BASE_URL}/transfers/{{transferId}}/error\"
  }'"

  echo
  echo "Set callback URIs for '${FSP7}' "
  echo "---------------------------------------------------------------------"
  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP7}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
    \"value\": \"${FSP7_URL_PREFIX}://${FSP7_HOST}:${FSP7_PORT}${FSP7_BASE_URL}/transfers\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP7}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
    \"value\": \"${FSP7_URL_PREFIX}://${FSP7_HOST}:${FSP7_PORT}${FSP7_BASE_URL}/transfers/{{transferId}}\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP7}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
    \"value\": \"${FSP7_URL_PREFIX}://${FSP7_HOST}:${FSP7_PORT}${FSP7_BASE_URL}/transfers/{{transferId}}/error\"
  }'"

  echo
  echo "Set callback URIs for '${FSP8}' "
  echo "---------------------------------------------------------------------"
  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP8}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_POST\",
    \"value\": \"${FSP8_URL_PREFIX}://${FSP8_HOST}:${FSP8_PORT}${FSP8_BASE_URL}/transfers\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP8}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_PUT\",
    \"value\": \"${FSP8_URL_PREFIX}://${FSP8_HOST}:${FSP8_PORT}${FSP8_BASE_URL}/transfers/{{transferId}}\"
  }'"

  sh -c "curl -X POST \
    http://${CENTRAL_LEDGER_HOST}/admin/participants/${FSP8}/endpoints \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -d '{
    \"type\": \"FSPIOP_CALLBACK_URL_TRANSFER_ERROR\",
    \"value\": \"${FSP8_URL_PREFIX}://${FSP8_HOST}:${FSP8_PORT}${FSP8_BASE_URL}/transfers/{{transferId}}/error\"
  }'"


echo
