#!/bin/bash

usage() { 
    echo "Script to deploy Central via Helm";
    echo "Usage: `basename $0` options -r <release-name> (-n <namespace>) (-o <options-file>) (-e) (-d)"; 
    echo "-r <release-name>: set helm release name - required"
    echo "-n <namespace>: kubernetes target namespace for deployment"
    echo "-o <options-file>: helm variable option files"
    echo "-e: execute helm command"
    echo "-d: enable debug flags for helm"
    echo "-h: display usage"
    echo ""
    }

# set an initial values
NAMESPACE='default'
OPT_ARGS=''
CHART='./central'
EXEC=false
DEBUG=false

# extract options and their arguments into variables.
while getopts ":n:r:o:edh" arg; do
     case $arg in
        n)
            NAMESPACE=$OPTARG >&2
            ;;
        r)
            RELEASE=$OPTARG >&2
            ;;
        o)
            OPTIONS=$OPTARG >&2
            ;;
        e)
            EXEC=true >&2
            ;;
        d)
            DEBUG=true >&2
            ;;
        h)
            usage;
            exit 0;
            ;;
        \?)
            usage;
            echo "Invalid option: -$OPTARG" >&2;
            exit 1; 
            break
            ;;
    esac
done

if [ -z "$RELEASE" ];
then
    usage;
    echo "Missing option: -r" >&2; 
    exit 1
fi;

if [ ! -z "$OPTIONS" ];
then
    OPT_ARGS=" -f $OPTIONS "
fi;

if $DEBUG;
then
    OPT_ARGS=$OPT_ARGS" --debug --dry-run "
fi;

CMD="helm install --namespace=$NAMESPACE --name=$RELEASE $OPT_ARGS $CHART"
echo "Helm cmd: $CMD"
if $EXEC;
then
    echo "executing command";
    $CMD
fi;
