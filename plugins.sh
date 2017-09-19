PASSWORD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
CRUMB=$(curl -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)' --user admin:$PASSWORD)
curl -H $CRUMB -X POST -d '<jenkins><install plugin="workflow-aggregator@2.5" /></jenkins>' --header 'Content-Type: text/xml' http://localhost:8080/pluginManager/installNecessaryPlugins --user admin:$PASSWORD
curl -H $CRUMB -X POST -d '<jenkins><install plugin="git@3.5.1" /></jenkins>' --header 'Content-Type: text/xml' http://localhost:8080/pluginManager/installNecessaryPlugins --user admin:$PASSWORD
