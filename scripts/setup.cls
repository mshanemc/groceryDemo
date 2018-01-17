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