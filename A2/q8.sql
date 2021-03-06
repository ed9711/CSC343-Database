create view elecs as
	select e1.id, e1.e_date as start_date, e2.id as nextid, e2.e_date as next_date
	from election e1, country, election e2
	where e1.country_id = country.id and country.name = 'Germany' 
		and (e2.previous_parliament_election_id = e1.id or e2.previous_ep_election_id = e1.id)
	order by e1.e_date desc;
	
create view cab as
	select cabinet.id, cabinet.country_id, elecs.id as election_id, elecs.start_date, elecs.next_date
	from elecs, cabinet, country
	where cabinet.country_id = country.id and country.name = 'Germany' and cabinet.start_date < elecs.next_date 
		and cabinet.start_date >= elecs.start_date
	order by elecs.id;
	
	
create view pol as
	select p1.description, p2.description
	from politician_president p1, politician_president p2
	where p1.id = '148' and p1.id <> p2.id;
