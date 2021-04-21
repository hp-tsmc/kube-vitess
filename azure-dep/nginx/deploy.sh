#!/bin/bash


function recreate_config(){
    echo "Recreate nginx-config"
    minikube kubectl -- delete configmap nginx-config
    minikube kubectl -- create configmap nginx-config --from-file=config/nginx.conf
}

function recreate_nginx(){
    echo "Recreate nginx"
    minikube kubectl -- delete -f nginx.yaml 
    sleep 5
    minikube kubectl -- apply -f nginx.yaml 
}

function main(){
    case $1 in

        test)
            echo "Hello"
            ;;

        recreate-config)
            recreate_config
            ;;

        recreate-nginx)
            recreate_nginx
            ;;

        recreate-all)
            recreate_config
            recreate_nginx
            echo "Recreate All"
            ;;

        *)
            echo "Following commands are available:"
            echo "recreate-config"
            echo "recreate-nginx"
            ;;
    esac
}

main $@