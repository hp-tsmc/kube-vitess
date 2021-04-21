#!/bin/bash


function recreate_config(){
    echo "Recreate nginx-config"
    minikube kubectl -- delete configmap nginx-config
    minikube kubectl -- create configmap nginx-config --from-file=config/nginx.conf
}

function recreate_nginx(){
    echo "Recreate nginx"
    minikube kubectl -- delete -f azure-dep/nginx/nginx.yaml 
    sleep 5
    minikube kubectl -- apply -f azure-dep/nginx/nginx.yaml 
}

function deploy_nginx(){
    echo "Deploy NGINX"
    minikube kubectl -- create configmap nginx-config --from-file=azure-dep/nginx/config/nginx.conf
    minikube kubectl -- apply -f azure-dep/nginx/nginx.yaml 
    minikube kubectl -- apply -f azure-dep/nginx/service.yaml
}

function deploy_operator(){
    echo "Deploy NGINX"
    minikube kubectl -- apply -f operator.yaml
}

function main(){
    case $1 in

        test)
            echo "Hello"
            ;;
        deploy-operator)
            deploy_operator
            ;;
        deploy-nginx)
            deploy_nginx
            ;;
        recreate-config)
            recreate_config
            ;;

        recreate-nginx)
            recreate_nginx
            ;;

        recreate-all)
            echo "Recreate All"
            recreate_config
            recreate_nginx
            echo "Done"
            ;;

        *)
            echo "Following commands are available:"
            echo "recreate-config"
            echo "recreate-nginx"
            ;;
    esac
}

main $@