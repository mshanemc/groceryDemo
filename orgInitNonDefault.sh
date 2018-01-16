#!/bin/sh
echo 'Creating a scratch org'
sfdx force:org:create -f config/project-scratch-def.json -d 1 -a grocerySpinoff

echo 'Pushing source to the scratch org'
sfdx force:source:push -u grocerySpinoff

sfdx force:data:tree:import -p data/pickupOrderPlan.json -u grocerySpinoff
sfdx force:data:tree:import -f data/Task.json -u grocerySpinoff
sfdx force:data:tree:import -f data/Event.json -u grocerySpinoff

# sfdx force:user:permset:assign -n TrialAdmin
sfdx force:org:open -u grocerySpinoff
