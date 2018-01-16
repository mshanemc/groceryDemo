// grocery orders
select Customer__r.firstname, Customer__r.lastname, Customer__r.email, Customer__r.phone, (select name, Unit_Cost__c, Quantity__c, Fulfilled__c from Pickup_Items__r) from Pickup_Order__c

sfdx force:data:tree:export -q "select Pickup_Time__c, (select name, Unit_Cost__c, Quantity__c, Fulfilled__c from Pickup_Items__r) from Pickup_Order__c" -p -d data

// tasks
sfdx force:data:tree:export -q "select subject, ActivityDate, priority, status from task" -d data

// events
sfdx force:data:tree:export -q "select ActivityDate, ActivityDateTime, Description, EndDateTime, Location, StartDateTime, Subject from Event" -d data

//contacts
sfdx force:data:tree:export -q "select firstname, lastname, email, phone from contact" -d data
