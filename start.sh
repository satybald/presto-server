#!/bin/bash

echo "Starting PRESTO:$PRESTO_VERSION"

echo "Sync templates"
./cfSync.py

/opt/presto/bin/launcher run