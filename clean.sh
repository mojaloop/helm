#!/bin/bash

usage() { 
    echo "Script to clean Helm deployments";
    echo "Usage: `basename $0` options -r <release-name> (-e) (-d)";
    echo "-r <release-name>: set helm release name -required"
    echo "-e: execute helm command"
    echo "-d: enable debug flags for helm"
    echo "-h: display usage"
    echo ""
    }

# set an initial values
EXEC=false
DEBUG=false

# extract options and their arguments into variables.
while getopts ":r:edh" arg; do
     case $arg in
        r)
            RELEASE=$OPTARG >&2
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
            exit 1
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

if $DEBUG;
then
    OPT_ARGS=" --debug --dry-run "
fi;

CMD="helm del --purge $OPT_ARGS $RELEASE"
echo "Helm cmd: $CMD"
if $EXEC;
then
    echo "executing command";
    $CMD
fi;
