# Workspace directory
cd /var/lib/jenkins/workspace/$JOB_NAME

# Copy id_sa file & known host in case of private dependency
cp /var/lib/jenkins/.ssh/id_rsa /var/lib/jenkins/.ssh/known_hosts .

# Copy env file

cp /var/lib/jenkins/dev/zreya/filebeat.yml /var/lib/jenkins/workspace/$JOB_NAME/filebeat.yml


#copying *.knolskape.io
cp /var/lib/jenkins/knolio/* .


printf "\033[34m Image Building Starts..... \033[0m\n"

docker build -t devsimsacr.azurecr.io/dev-zreya:dev-zreya-${BUILD_NUMBER} --build-arg new_relic_key="573e9ea97246c4f843913996092ca6484191216d" --build-arg new_relic_appname="Zreya-Dev" .

docker push devsimsacr.azurecr.io/dev-zreya:dev-zreya-${BUILD_NUMBER}

printf "\033[34m Image Pushed to Registry. \033[0m\n"

