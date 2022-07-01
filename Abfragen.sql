--Abfrage einzelne Tabelle
--Zeigen alle Datum, an denen Person1 Trainiert hat
select datum
from aufzeichnung
where besitztvon=01
order by dauer;

--Abfrage über 3 Tabellen mit JOIN und DISTINCT
--zeigen die Namen aller Trainings, die Person1 gemacht hat
select distinct training.name
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
where aufzeichnung.besitztvon=01;

--Anzahl und Gesamtdauer der Trainings pro Monat
select count(*), sum(Dauer)
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

--Tortendiagramm: Prozent aller Trainings
select training.name, count(trainieren.*)
from training
join trainieren on training.id = trainieren.training
join aufzeichnung on trainieren.aufzeichnung = aufzeichnung.id
where aufzeichnung.besitztvon=01
group by(training.id);


