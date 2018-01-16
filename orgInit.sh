#!/bin/sh

echo 'Creating a scratch org'
sfdx force:org:create -s -f config/project-scratch-def.json -d 1

echo 'Pushing source to the scratch org'
sfdx force:source:push

# sfdx force:user:permset:assign -n TrialAdmin
sfdx force:org:open

sfdx force:data:tree:import -p data/pickupOrderPlan.json
sfdx force:data:tree:import -f data/Task.json
sfdx force:data:tree:import -f data/Event.json

