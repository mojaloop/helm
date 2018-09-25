#!/usr/bin/env bash
export KAFKA_ID=kafkaperftest
export MOCKSERVER_ID=mockserver
export DB_ID=mysql
export SLEEP_FACTOR_IN_SECONDS=5
export DBUSER=central_ledger
export DBPASS=password
export DBNAME=central_ledger
export DB_SLEEPTIME=15
export MESSAGES_BATCH_SIZE=1000
export SCRIPT_DIR=scripts
export FSPList=("dfsp1" "dfsp2" "dfsp3" "dfsp4")
export DEFAULT_NET_DEBIT_CAP=1000000
export CENTRAL_LEDGER_HOST=perf1-central-ledger.mojaloop.live
