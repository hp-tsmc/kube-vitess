#!/bin/bash
alias ee='echo success'
alias vtc="${PWD}/azure-dep/vitess/bin/vtctlclient -server=10.107.153.153:15999 -logtostderr"
emp_schema=`cat ${PWD}/azure-dep/vitess/vschema.json`