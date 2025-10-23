Add configmap for nginx:

kubectl create configmap nginx-config --from-file=./default.conf -n neon-test