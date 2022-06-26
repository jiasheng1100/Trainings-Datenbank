drop table if exists person cascade;
create table person(
    id serial primary key,
    name varchar(100) not null,
    geschlecht char not null,
    geburtsjahr date not null,
    check(geschlecht in ('w', 'm'))
);

drop table if exists training cascade;
create table training(
    id serial primary key,
    name varchar(100) not null
);

drop table if exists uebung cascade;
create table uebung(
    name varchar(100) primary key
);

drop table if exists geraet cascade;
create table geraet(
    name varchar(100) primary key
);

drop table if exists aufzeichnung cascade;
create table aufzeichnung(
    id serial primary key,
    datum date not null,
    besitztVon int not null references person (id) on delete cascade on update cascade,
    dauer time,
    art varchar(50),
    check (art in ('kraft', 'ausdauer', 'mobilitaet', 'spiel', 'koordination'))
);

drop table if exists trainieren cascade;
create table trainieren(
    aufzeichnung int references aufzeichnung (id) on delete cascade on update cascade,
    training int references training (id) on delete cascade on update cascade,
    primary key(aufzeichnung, training),
    anzahl decimal(6, 2) not null,
    dauer time,
    check (anzahl > 0)
);

drop table if exists ueben cascade;
create table ueben(
    training int references training (id) on delete cascade on update cascade,
    uebung varchar(100) references uebung (name) on delete cascade on update cascade,
    primary key(training, uebung),
    anzahl decimal(8, 2) not null,
    gewicht decimal(6, 2),
    distanz decimal(6, 2),
    dauer time,
    geraet varchar(100) references geraet(name) on delete cascade on update cascade,
    check (anzahl > 0)
);

