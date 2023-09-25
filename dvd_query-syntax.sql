ALTER DATABASE postgres RENAME TO "dvd_rental-Matrix-130";
--1. How many actors are there with the last name Whalberg?
select*
from actor 
where last_name = 'Wahlberg';
--output = 2

--2. How many payments were made between 3.99 and 5.99?
select*
from payment;

select amount(payment)
from payment 
where amount between 3.99 and 5.99;
--output = 5607

--3. What film does the store have the most of? (search in inventory)
select title, film_id
from film
where film_id in (select film_id from inventory group by film_id having count(film_id)>7);
--outpt = Academy Dinosaur	1
--Apache Divine	31
--Beverly Outlaw	69
--Bingo Talented	73
--Boogie Amelie	86
--Bound Cheaper	91
--Bucket Brotherhood	103
--Butterfly Chocolat	109
--Cat Coneheads	127
--Confidential Interview	174
--Crossroads Casualties	193
--Cupboard Sinners	199
--Curtain Videotape	200
--Dancing Fever	206
--Deer Virginian	220
--Dinosaur Secretary	231
--Dogma Family	239
--Dynamite Tarzan	266
--Expendable Stallion	295
--Family Sweet	301
--Forward Temple	331
--Frost Head	341
--Garden Island	350
--Giant Troopers	356
--Gilmore Boiled	358
--Gleaming Jawbreaker	361
--Goodfellas Salute	369
--Greatest North	378
--Grit Clockwork	382
--Harry Idaho	403
--Heavyweights Beast	412
--Hobbit Alien	418
--Horror Reign	434
--Hustler Party	444
--Innocent Usual	460
--Invasion Cyclone	468
--Juggler Hardly	489
--Kiss Glory	500
--Rush Goodfellas	753
--Loathing Legally	525
--Lose Inch	531
--Married Go	559
--Metropolis Coma	572
--Mockingbird Hollywood	586
--Moon Bunch	595
--Muscle Bright	609
--Network Peak	621
--Operation Operation	638
--Pity Bound	683
--Primary Glass	697
--Pulp Beverly	702
--Ridgemont Submarine	730
--Rocketeer Mother	738
--Roses Treasure	745
--Rugrats Shakespeare	748
--Saturday Lambs	764
--Scalawag Duck	767
--Seabiscuit Punk	773
--Shock Cabin	789
--Spy Mile	835
--Sting Personal	846
--Storm Happiness	849
--Streetcar Intentions	856
--Swarm Gold	870
--Sweethearts Suspects	873
--Telemark Heartbreakers	880
--Titans Jerk	893
--Torque Bound	897
--Trip Newton	911
--Virginian Pluto	945
--Wife Turn	973
--Zorro Ark	1000

--4. How many customers have the last name 'William'?
select*
from customer
where last_name = 'William';
--ouput = 0

--5. What store employee (get the id) sold the most rentals?
select count(staff_id)
from rental
group by staff_id;
--output = staff_id1 - 8040, staff_id2 - 8004

--6. How many different district names are there?
select distinct district
from store, address;
--output = 378

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id)
from film_actor 
group by film_id 
order by count desc;
--output = film_id - 508

--8. From store_id 1, how many customers have a last name ending with 'es'?
select last_name
from customer
where last_name like '__%es' AND store_id = 1;
--output = 13