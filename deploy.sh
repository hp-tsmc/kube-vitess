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

# This can be cleaner with for loop and cut
function update_nginx_config(){
    global_vtgate=`minikube kubectl -- get service | grep azure-vtgate | awk '{print $1}'`
    global_vtctld=`minikube kubectl -- get service | grep azure-vtctld | awk '{print $1}'`
    zone1_vtgate=`minikube kubectl -- get service | grep azure-zone1-vtgate | awk '{print $1}'`   
    zone2_vtgate=`minikube kubectl -- get service | grep azure-zone2-vtgate | awk '{print $1}'`
    echo "${global_vtgate}"
    echo "${global_vtctld}"
    echo "${zone1_vtgate}"
    echo "${zone2_vtgate}"
    sed -i "s/azure-vtgate.*:3306/${global_vtgate}:3306/g" azure-dep/nginx/config/nginx.conf
    sed -i "s/azure-vtgate.*:15000/${global_vtgate}:15000/g" azure-dep/nginx/config/nginx.conf
    sed -i "s/azure-vtctld.*:15999/${global_vtctld}:15999/g" azure-dep/nginx/config/nginx.conf
    sed -i "s/azure-vtctld.*:15000/${global_vtctld}:15000/g" azure-dep/nginx/config/nginx.conf
    sed -i "s/azure-zone1-vtgate.*:3306/${zone1_vtgate}:3306/g" azure-dep/nginx/config/nginx.conf
    sed -i "s/azure-zone2-vtgate.*:3306/${zone2_vtgate}:3306/g" azure-dep/nginx/config/nginx.conf
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
        update-nginx-config)
           echo "Replacing names in nginx.conf"
           update_nginx_config
           echo "Done"
        *)
            echo "Following commands are available:"
            echo "recreate-config"
            echo "recreate-nginx"
            ;;
    esac
}

main $@
