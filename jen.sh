echo "JAVA_ARGS=\"-Djenkins.install.runSetupWizard=false\"" >> /etc/default/jenkins
sed -i -e 's/JENKINS_USER=$NAME/JENKINS_USER="root"/g' /etc/default/jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword
service jenkins restart
