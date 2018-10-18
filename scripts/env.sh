#!/usr/bin/env bash
export KAFKA_ID=kafkaperftest
export MOCKSERVER_ID=mockserver
export DB_ID=mysql
export SLEEP_FACTOR_IN_SECONDS=5
export DBUSER=central_ledger
export DBPASS=oyMxgZChuu
export DBNAME=central_ledger
export DB_SLEEPTIME=15
export MESSAGES_BATCH_SIZE=1000
export SCRIPT_DIR=scripts
# export FSPList=("dfps1" "dfsp2")
# export FSPList=("mockfsp1" "mockfsp2")
export FSPList=("payerfsp" "payeefsp" "dfsp1" "dfsp2" "dfsp3" "dfsp4" "mockfsp1" "mockfsp2")
export DEFAULT_NET_DEBIT_CAP=10000000
export CENTRAL_LEDGER_HOST=perf1-central-ledger.mojaloop.live

export FSP1=dfsp1
export FSP1_HOST=ec2-35-178-158-3.eu-west-2.compute.amazonaws.com
export FSP1_PORT=8080
export FSP1_URL_PREFIX=http
export FSP1_BASE_URL=

export FSP2=dfsp2
export FSP2_HOST=ec2-35-178-158-3.eu-west-2.compute.amazonaws.com
export FSP2_PORT=8080
export FSP2_URL_PREFIX=http
export FSP2_BASE_URL=

export FSP3=dfsp3
export FSP3_HOST=ec2-52-56-183-65.eu-west-2.compute.amazonaws.com
export FSP3_PORT=8080
export FSP3_URL_PREFIX=http
export FSP3_BASE_URL=

export FSP4=dfsp4
export FSP4_HOST=ec2-52-56-183-65.eu-west-2.compute.amazonaws.com
export FSP4_PORT=8080
export FSP4_URL_PREFIX=http
export FSP4_BASE_URL=

export FSP5=mockfsp1
export FSP6=mockfsp2
export MOCK_FSP_HOST=mockserver.mockserver
export MOCK_FSP_PORT=1080
export MOCK_FSP_URL_PREFIX=http
export MOCK_FSP_BASE_URL=

export FSP7=payerfsp
export FSP7_HOST=35.178.4.32
export FSP7_PORT=8444
export FSP7_URL_PREFIX=https
export FSP7_BASE_URL=payerfsp

export FSP8=payeefsp
export FSP8_HOST=35.178.4.32
export FSP8_PORT=8444
export FSP8_URL_PREFIX=https
export FSP8_BASE_URL=payeefsp
