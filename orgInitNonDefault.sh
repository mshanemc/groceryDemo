#!/bin/sh
echo 'Creating a scratch org'
sfdx msm:org:create -f config/project-scratch-def.json -d 1 -a grocerySpinoff -u shane -o grocery.demo

echo 'Pushing source to the scratch org'
sfdx force:source:push -u grocerySpinoff

sfdx force:data:tree:import -p data/pickupOrderPlan.json -u grocerySpinoff
sfdx force:data:tree:import -f data/Task.json -u grocerySpinoff
sfdx force:data:tree:import -f data/Event.json -u grocerySpinoff
sfdx msm:user:password:set -g User -l User -p mobile123 -u grocerySpinoff

echo 'installing some packages in the background'
# package for task components
sfdx force:package:install -i 04t1a000000VVbFAAW -u grocerySpinoff
# package for e-signature
sfdx force:package:install -i 04t24000000kaar -u grocerySpinoff

sfdx force:org:open -u grocerySpinoff

sfdx force:user:create -f config/userDef/bandar.json -u grocerySpinoff
sfdx force:user:create -f config/userDef/jodi.json -u grocerySpinoff
sfdx force:user:create -f config/userDef/rahul.json -u grocerySpinoff

sfdx msm:user:photo -f assets/bandar.jpeg -l El-Eita -u grocerySpinoff
sfdx msm:user:photo -f assets/jodi.jpeg -l Innerfield -u grocerySpinoff
sfdx msm:user:photo -f assets/rahul.jpeg -l Aswathy -u grocerySpinoff

sfdx force:apex:execute -f scripts/setup.cls -u grocerySpinoff
sfdx msm:user:photo -f assets/shane.jpeg -l McLaughlin -u grocerySpinoff