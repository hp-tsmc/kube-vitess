#!/bin/bash
alias ee='echo success'
alias vtc="${PWD}/azure-dep/vitess/bin/vtctlclient -server=192.168.5.134:15999 -logtostderr"
alias k='minikube kubectl --'
emp_schema=`cat ${PWD}/azure-dep/vitess/vschema.json`
