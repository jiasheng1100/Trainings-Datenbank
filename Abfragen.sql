--Show all trainings by person 1
--display the dates and names of trainings that person 1 did
select aufzeichnung.datum, training.name
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
where aufzeichnung.besitztvon=01;

--Show all trainings by person 2
--display the dates and names of trainings that person 2 did
select aufzeichnung.datum, training.name
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
where aufzeichnung.besitztvon=02;

--3D-Diagram: show the number and duration of trainings per month
--display the count of number and duration of trainings by person 1 per month
select date_trunc('month', datum)
as Monat,
count(*)
as Anzahl, 
sum(Dauer)
as Dauer
from aufzeichnung
where besitztvon=01
and extract(year from datum) = 2014
group by date_trunc('month', datum);

-- Balkendiagramm: Anzahl der Trainings pro Monat
select date_trunc('month', datum)
as Monat,
count(*)
from aufzeichnung
where besitztvon=01
and extract(year from datum) = 2014
group by date_trunc('month', datum);

-- Tortendiagramm: Anzahl der Trainings pro Monat
select cast(date_trunc('month', datum) as Text)
as Monat,
count(*)
from aufzeichnung
where besitztvon=01
and extract(year from datum) = 2014
group by date_trunc('month', datum);

--Tortendiagramm: Anzahl der Trainings jeder Art
select art, count(*)
from aufzeichnung
where besitztvon=01
and extract(year from datum) = 2014
group by art;

--pie chart: count of each training by person 1
--display the count of each training that person 1 did in a pie chart
select training.name, count(trainieren.*)
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
where aufzeichnung.besitztvon=01
group by(training.id);

--Balkendiagramm: Vergleich der Anzahl der gemachten Trainings
select person.name, count(*)
from aufzeichnung
join person on aufzeichnung.besitztvon = person.id
group by person.name;

---table: show all poseidon trainings, ordered by time of completion
--display the person, dates and time of completion of all the poseidon trainings-
select person.name, training.name, aufzeichnung.datum
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
join person on aufzeichnung.besitztvon = person.id
where training.id=20

--table: show all situpmax training
--display the person, dates and count of all the situpmax trainings
select person.name, training.name, aufzeichnung.datum, trainieren.anzahl
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
join person on aufzeichnung.besitztvon = person.id
where training.id=18

--table: show all poseidon trainings, ordered by time of completion
--display the person, dates and time of completion of all poseidon trainings
select person.name
as person, 
training.name
as training, 
aufzeichnung.datum,
to_char(aufzeichnung.dauer,'MI:SS')
as dauer
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
join person on aufzeichnung.besitztvon = person.id
where training.id=20
order by (aufzeichnung.dauer);

--other ideas: compare the performanance data by person's age and gender
--can only be realized with more data in the data bank'

