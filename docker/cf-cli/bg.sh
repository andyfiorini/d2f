#!/bin/bash -ex

cf api --skip-ssl-validation $CF_API_ENDPOINT
cf login -u $CF_USER -p $CF_PASSWORD -o $CF_ORG -s $CF_SPACE

DEPLOYED_APP=$(cf apps | grep $APP_NAME\* | cut -d' ' -f1)

DEPLOYED_APP_INSTANCES=$(cf curl /v2/apps | jq -r --arg DEPLOYED_APP $DEPLOYED_APP \
  '.resources[] | select(.entity.name == $DEPLOYED_APP) | .entity.instances')

cf push "$APP_NAME-$BUILD_NUMBER" -i 1 -m $APP_MEMORY \
  -n "$APP_NAME-$BUILD_NUMBER" -d $CF_INTERNAL_APPS_DOMAIN \
  -p $ARTIFACT_PATH $PUSH_OPTIONS


cf start "$APP_NAME-$BUILD_NUMBER"

echo "Performing zero-downtime cutover to $APP_NAME-$BUILD_NUMBER"
cf map-route "$APP_NAME-$BUILD_NUMBER" $CF_EXTERNAL_APPS_DOMAIN -n $EXTERNAL_APP_HOSTNAME
