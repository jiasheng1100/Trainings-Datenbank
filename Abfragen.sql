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
