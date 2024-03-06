	SELECT * FROM project.shark_tank_data;

/* total episodes */
select count(distinct epno) as total_episodes from project.shark_tank_data;

/*total pitches*/
select count(epno) as total_pitches from project.shark_tank_data; 

/*pitches funded*/
select amount_invested_lakhs , case when amount_invested_lakhs>0 
then 1 else 0 end as successful_pitches from project.shark_tank_data ;
select count(amount_invested_lakhs) as successful_pitches from project.shark_tank_data
where amount_invested_lakhs>0;

/*success percentage*/
select  (sum(a.successful_pitches)/count(*)) * 100 as successful_pitch_percentage from (
select amount_invested_lakhs , case when amount_invested_lakhs>0 
then 1 else 0 end as successful_pitches from project.shark_tank_data) a;

/*total males and females*/
select sum(male) as total_male from project.shark_tank_data;
select sum(female) as total_female from project.shark_tank_data;

/*pitches without males*/
select * from project.shark_tank_data
where male=0;
select count(male) as only_females from project.shark_tank_data
where male=0; 

/*pitches without females*/
select * from project.shark_tank_data
where female=0;
select count(female) as only_males from project.shark_tank_data
where female=0;

/*gender ratio*/
select sum(male)/sum(female) as gender_ratio from project.shark_tank_data;

/*total amount invested*/
select sum(amount_invested_lakhs) as total_amount_invested from project.shark_tank_data;

/*average equity taken*/
select avg(`Equity_Taken%`) as average_equity_taken from project.shark_tank_data;

/*highest deal*/
select max(amount_invested_lakhs) as highest_deal_taken from project.shark_tank_data;

/*highest equity taken*/
select max(`Equity_Taken%`) as highest_equity_taken from project.shark_tank_data;

/*pitches with at least one women*/
select count(female) as atleast_women from project.shark_tank_data where female>0;
select count(female) as atleast_women_successful from project.shark_tank_data where female>0 and amount_invested_lakhs>0;

/*team members*/
select avg(team_members) as average_team_members from project.shark_tank_data;
select max(team_members) as maximum_team from project.shark_tank_data;

/*amount invested per deal*/
select avg(amount_invested_lakhs) as amount_invested_per_deal from project.shark_tank_data where deal != 'no deal';

/*average age*/
select avg_age, count(avg_age) as avg_age from project.shark_tank_data group by avg_age order by avg_age desc;

/*locations*/
select location, count(location) as locations_pitch from project.shark_tank_data group by location order by locations_pitch desc;
select location, count(location) as location_max_pitch from project.shark_tank_data group by location order by location_max_pitch desc limit 1;

/*sectors*/
select sector, count(sector) as sector_pitches from project.shark_tank_data group by sector order by sector_pitches desc ; 
select sector, count(sector) as max_sector from project.shark_tank_data group by sector order by max_sector desc limit 1; 

/*partners*/
select partners, count(partners) as partner_deal from project.shark_tank_data 
where partners != '-' group by partners order by partner_deal desc ;

/*Ashneer details*/
select 'Ashneer' as keyy, count(ashneer_amount_invested) from project.shark_tank_data;

select 'Ashneer' as keyy, count(ashneer_amount_invested) from project.shark_tank_data where ashneer_amount_invested!=0;

select 'Ashneer' as keyy, sum(c.ashneer_amount_invested), avg(c.ashneer_amount_invested) from (
select * from project.shark_tank_data where ashneer_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Ashneer' as keyy, count(ashneer_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Ashneer' as keyy, count(ashneer_amount_invested) total_deals from project.shark_tank_data 
where ashneer_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Ashneer' as keyy, sum(c.ashneer_amount_invested) total_amount_invested, avg(c.`Ashneer_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Ashneer_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;

/*Namita details*/
select 'Namita' as keyy, count(namita_amount_invested) from project.shark_tank_data;

select 'Namita' as keyy, count(namita_amount_invested) from project.shark_tank_data where namita_amount_invested!=0;

select 'Namita' as keyy, sum(c.namita_amount_invested), avg(c.namita_amount_invested) from (
select * from project.shark_tank_data where namita_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Namita' as keyy, count(namita_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Namita' as keyy, count(namita_amount_invested) total_deals from project.shark_tank_data 
where namita_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Namita' as keyy, sum(c.namita_amount_invested) total_amount_invested, avg(c.`Namita_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Namita_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;

/*Anupam details*/
select 'Anupam' as keyy, count(anupam_amount_invested) from project.shark_tank_data;

select 'Anupam' as keyy, count(anupam_amount_invested) from project.shark_tank_data where anupam_amount_invested!=0;

select 'Anupam' as keyy, sum(c.anupam_amount_invested), avg(c.anupam_amount_invested) from (
select * from project.shark_tank_data where anupam_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Anupam' as keyy, count(anupam_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Anupam' as keyy, count(anupam_amount_invested) total_deals from project.shark_tank_data 
where anupam_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Anupam' as keyy, sum(c.anupam_amount_invested) total_amount_invested, avg(c.`Anupam_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Anupam_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;

/*Vineeta details*/
select 'Vineeta' as keyy, count(vineeta_amount_invested) from project.shark_tank_data;

select 'Vineeta' as keyy, count(vineeta_amount_invested) from project.shark_tank_data where vineeta_amount_invested!=0;

select 'Vineeta' as keyy, sum(c.vineeta_amount_invested), avg(c.vineeta_amount_invested) from (
select * from project.shark_tank_data where vineeta_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Vineeta' as keyy, count(vineeta_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Vineeta' as keyy, count(vineeta_amount_invested) total_deals from project.shark_tank_data 
where vineeta_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Vineeta' as keyy, sum(c.vineeta_amount_invested) total_amount_invested, avg(c.`Vineeta_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Vineeta_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;

/*Aman details*/
select 'Aman' as keyy, count(aman_amount_invested) from project.shark_tank_data;

select 'Aman' as keyy, count(aman_amount_invested) from project.shark_tank_data where aman_amount_invested!=0;

select 'Aman' as keyy, sum(c.aman_amount_invested), avg(c.aman_amount_invested) from (
select * from project.shark_tank_data where aman_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Aman' as keyy, count(aman_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Aman' as keyy, count(aman_amount_invested) total_deals from project.shark_tank_data 
where aman_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Aman' as keyy, sum(c.aman_amount_invested) total_amount_invested, avg(c.`Aman_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Aman_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;

/* Peyush details*/
select 'Peyush' as keyy, count(peyush_amount_invested) from project.shark_tank_data;

select 'Peyush' as keyy, count(peyush_amount_invested) from project.shark_tank_data where peyush_amount_invested!=0;

select 'Peyush' as keyy, sum(c.peyush_amount_invested), avg(c.peyush_amount_invested) from (
select * from project.shark_tank_data where peyush_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Peyush' as keyy, count(peyush_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Peyush' as keyy, count(peyush_amount_invested) total_deals from project.shark_tank_data 
where peyush_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Peyush' as keyy, sum(c.peyush_amount_invested) total_amount_invested, avg(c.`Peyush_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Peyush_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;

/* Ghazal details*/
select 'Ghazal' as keyy, count(ghazal_amount_invested) from project.shark_tank_data;

select 'Ghazal' as keyy, count(ghazal_amount_invested) from project.shark_tank_data where ghazal_amount_invested!=0;

select 'Ghazal' as keyy, sum(c.ghazal_amount_invested), avg(c.ghazal_amount_invested) from (
select * from project.shark_tank_data where ghazal_amount_invested!=0) c;

select m.keyy,m.total_deal_present, m.total_deals, n.total_amount_invested, n.avg_equity_taken from

(select a.keyy, a.total_deal_present, b.total_deals from(
select 'Ghazal' as keyy, count(ghazal_amount_invested) total_deal_present from project.shark_tank_data) a

inner join(
select 'Ghazal' as keyy, count(ghazal_amount_invested) total_deals from project.shark_tank_data 
where ghazal_amount_invested!=0) b

on a.keyy = b.keyy) m

inner join

(select 'Ghazal' as keyy, sum(c.ghazal_amount_invested) total_amount_invested, avg(c.`Ghazal_Equity_Taken%`) avg_equity_taken
from (select * from project.shark_tank_data where `Ghazal_Equity_Taken%`!=0) c) n
on m.keyy = n.keyy ;


