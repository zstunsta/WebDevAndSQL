-- Parse::SQL::Dia      version 0.25                              
-- Documentation        http://search.cpan.org/dist/Parse-Dia-SQL/
-- Environment          Perl 5.016003, C:\Perl\bin\perl.exe       
-- Architecture         MSWin32-x86-multi-thread                  
-- Target Database      postgres                                  
-- Input file           gewa_odonates.dia                         
-- Generated at         Wed Jan 15 12:55:40 2014                  
-- Typemap for postgres not found in input file                   

-- get_constraints_drop 
--alter table tbl_gewaodinventory drop constraint InventoryHasSpecies ;
--alter table tbl_gewaevents drop constraint LocationsHaveEvents ;
--alter table tbl_gewaodinventory drop constraint EventsHaveInventory ;

-- get_permissions_drop 

-- get_view_drop

-- get_schema_drop
--drop table tbl_gewalocations;
--drop table tbl_gewaevents;
--drop table tbl_gewaodinventory;
--drop table tbl_gewaodspecies;

-- get_smallpackage_pre_sql 

-- get_schema_create
create table tbl_gewalocations (
   x_coord    numeric (15,2)         ,
   y_coord    numeric (15,2)         ,
   locationid varchar (10)   not null,
   parkcode   varchar (4)            ,
   constraint pk_tbl_gewalocations primary key (locationid)
)   ;
create table tbl_gewaevents (
   eventid    varchar (50)  not null,
   locationid varchar (10)          ,
   date       date                  ,
   totaltime  integer               ,
   notes      varchar (255)         ,
   cloudcover integer               ,
   hightemp   integer               ,
   wind       integer               ,
   constraint pk_tbl_gewaevents primary key (eventid)
)   ;
create table tbl_gewaodinventory (
   key          integer       not null,
   new_eventid  varchar (50)          ,
   species      varchar (75)          ,
   eventid      varchar (50)          ,
   habitatcode  varchar (10)          ,
   numberadults integer               ,
   notes        varchar (255)         ,
   constraint pk_tbl_gewaodinventory primary key (key)
)   ;
create table tbl_gewaodspecies (
   scientificname varchar (75) not null,
   commonname     varchar (75)         ,
   family         varchar (50)         ,
   genus          varchar (50)         ,
   species        varchar (50)         ,
   constraint pk_tbl_gewaodspecies primary key (scientificname)
)   ;

-- get_view_create

-- get_permissions_create

-- get_inserts

-- get_smallpackage_post_sql

-- get_associations_create
alter table tbl_gewaodinventory add constraint InventoryHasSpecies 
    foreign key (species)
    references tbl_gewaodspecies (scientificname) ;
alter table tbl_gewaevents add constraint LocationsHaveEvents 
    foreign key (locationid)
    references tbl_gewalocations (locationid) ;
alter table tbl_gewaodinventory add constraint EventsHaveInventory 
    foreign key (eventid)
    references tbl_gewaevents (eventid) ;

--COPY tbl_gewalocations FROM 'c:/server class/gewa/odonates/tbl_Locations.txt' DELIMITERS ',' CSV; 
--COPY tbl_gewaodspecies FROM 'c:/server class/gewa/odonates/tbl_OD_Species.txt' DELIMITERS ',' CSV; 
--COPY tbl_gewaevents FROM 'c:/server class/gewa/odonates/tbl_Events.txt' DELIMITERS ',' CSV;
--COPY tbl_gewaodinventory FROM 'c:/server class/gewa/odonates/tbl_OD_InventoryData.txt' DELIMITERS ',' CSV; 