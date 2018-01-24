//null profiles are those system users we don't want to mess with

list<user> users = [select id, score__c, Firstname, lastname, profile.Name from user where profile.Name != null];

integer max = 10000;
for (user u:users){
	if (u.firstname == 'User' && u.lastname == 'User'){
		u.firstname = 'Shane';
		u.lastname = 'McLaughlin';
		u.score__c = Math.round(Math.random()*max);
	} else if (u.firstname == 'Jodi' || u.firstname == 'Bandar' || u.firstname == 'Rahul'){
		u.score__c = Math.round(Math.random()*max);
	}
}
update users;

list<event> events = [select id, StartDateTime, EndDateTime from Event order by StartDateTime];
for (event e:events){
	date original = date.newinstance(e.StartDateTime.year(), e.StartDateTime.month(), e.StartDateTime.day());
	integer offset = original.daysBetween(System.today());
	e.StartDateTime = e.StartDateTime.addDays(offset);
	e.EndDateTime = e.EndDateTime.addDays(offset);
}
update events;

list<task> tasks = [select id, ActivityDate from task];
for (task t:tasks){
	t.ActivityDate  = system.today();
}
update tasks;
