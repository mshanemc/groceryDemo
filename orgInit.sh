#!/bin/sh
echo 'Creating a scratch org'
sfdx force:org:create -s -f config/project-scratch-def.json -d 1 -a mobileWebinar

echo 'Pushing source to the scratch org'
sfdx force:source:push

sfdx force:user:permset:assign -n grocery

sfdx force:data:tree:import -p data/pickupOrderPlan.json
sfdx force:data:tree:import -f data/Task.json
sfdx force:data:tree:import -f data/Event.json
sfdx msm:user:password:set -g User -l User -p mobile123

echo 'installing some packages in the background'
# package for e-signature
sfdx force:package:install -i 04t24000000kaar
#utilitypack
sfdx force:package:install -i 04t28000000b99D
#events
sfdx force:package:install -i 04t28000000yBl5

sfdx force:org:open

sfdx force:user:create -f config/userDef/bandar.json
sfdx force:user:create -f config/userDef/jodi.json
sfdx force:user:create -f config/userDef/rahul.json

sfdx msm:user:photo -f assets/bandar.jpeg -l El-Eita
sfdx msm:user:photo -f assets/jodi.jpg -l Innerfield
sfdx msm:user:photo -f assets/rahul.jpeg -l Awasthy

sfdx force:apex:execute -f scripts/setup.cls
sfdx msm:user:photo -f assets/shane.jpeg -l McLaughlin
