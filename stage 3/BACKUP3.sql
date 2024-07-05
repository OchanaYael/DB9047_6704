prompt PL/SQL Developer import file
prompt Created on יום שישי 05 יולי 2024 by חני סקורי
set feedback off
set define off
prompt Creating AMBULANS...
create table AMBULANS
(
  locaation    VARCHAR2(30) not null,
  ambulance_id INTEGER not null,
  ambulancenum INTEGER not null,
  tipe         VARCHAR2(30) not null,
  status       VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AMBULANS
  add primary key (AMBULANCE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating VOLUNTEER...
create table VOLUNTEER
(
  volunteer_id VARCHAR2(20) not null,
  naame        VARCHAR2(35) not null,
  phonnum      INTEGER not null,
  address      VARCHAR2(60) not null,
  dateofbirth  DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VOLUNTEER
  add primary key (VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PARAMEDIC...
create table PARAMEDIC
(
  medical_degree VARCHAR2(30) not null,
  seniority      INTEGER not null,
  volunteer_id   VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARAMEDIC
  add primary key (VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARAMEDIC
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating SHIFT...
create table SHIFT
(
  shift_id_    INTEGER not null,
  daate        DATE not null,
  starttime    VARCHAR2(5) not null,
  endtime      VARCHAR2(5) not null,
  volunteer_id VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFT
  add primary key (SHIFT_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SHIFT
  add foreign key (VOLUNTEER_ID)
  references PARAMEDIC (VOLUNTEER_ID);

prompt Creating EVENT...
create table EVENT
(
  event_id     INTEGER not null,
  deescription VARCHAR2(60) not null,
  locaation    VARCHAR2(30) not null,
  date_time    DATE not null,
  shift_id_    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add primary key (EVENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EVENT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);

prompt Creating AMBUTOEVENT...
create table AMBUTOEVENT
(
  ambulance_id INTEGER not null,
  event_id     INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AMBUTOEVENT
  add primary key (AMBULANCE_ID, EVENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AMBUTOEVENT
  add foreign key (AMBULANCE_ID)
  references AMBULANS (AMBULANCE_ID);
alter table AMBUTOEVENT
  add foreign key (EVENT_ID)
  references EVENT (EVENT_ID);

prompt Creating DRIVER...
create table DRIVER
(
  licensenum   INTEGER not null,
  volunteer_id VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVER
  add primary key (VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVER
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating DRIVERINSHIFT...
create table DRIVERINSHIFT
(
  volunteer_id VARCHAR2(20) not null,
  shift_id_    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVERINSHIFT
  add primary key (VOLUNTEER_ID, SHIFT_ID_)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVERINSHIFT
  add foreign key (VOLUNTEER_ID)
  references DRIVER (VOLUNTEER_ID);
alter table DRIVERINSHIFT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);

prompt Creating DRIVERTOAMBU...
create table DRIVERTOAMBU
(
  volunteer_id VARCHAR2(20) not null,
  ambulance_id INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVERTOAMBU
  add primary key (VOLUNTEER_ID, AMBULANCE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVERTOAMBU
  add foreign key (VOLUNTEER_ID)
  references DRIVER (VOLUNTEER_ID);
alter table DRIVERTOAMBU
  add foreign key (AMBULANCE_ID)
  references AMBULANS (AMBULANCE_ID);

prompt Creating MEDIC...
create table MEDIC
(
  seniority    INTEGER not null,
  volunteer_id VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEDIC
  add primary key (VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MEDIC
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating MADICINSHIFT...
create table MADICINSHIFT
(
  shift_id_    INTEGER not null,
  volunteer_id VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MADICINSHIFT
  add primary key (SHIFT_ID_, VOLUNTEER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MADICINSHIFT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);
alter table MADICINSHIFT
  add foreign key (VOLUNTEER_ID)
  references MEDIC (VOLUNTEER_ID);

prompt Disabling triggers for AMBULANS...
alter table AMBULANS disable all triggers;
prompt Disabling triggers for VOLUNTEER...
alter table VOLUNTEER disable all triggers;
prompt Disabling triggers for PARAMEDIC...
alter table PARAMEDIC disable all triggers;
prompt Disabling triggers for SHIFT...
alter table SHIFT disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable all triggers;
prompt Disabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable all triggers;
prompt Disabling triggers for MEDIC...
alter table MEDIC disable all triggers;
prompt Disabling triggers for MADICINSHIFT...
alter table MADICINSHIFT disable all triggers;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C008884;
prompt Disabling foreign key constraints for SHIFT...
alter table SHIFT disable constraint SYS_C008904;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint SYS_C008911;
prompt Disabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT disable constraint SYS_C008915;
alter table AMBUTOEVENT disable constraint SYS_C008916;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C008888;
prompt Disabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable constraint SYS_C008925;
alter table DRIVERINSHIFT disable constraint SYS_C008926;
prompt Disabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable constraint SYS_C008896;
alter table DRIVERTOAMBU disable constraint SYS_C008897;
prompt Disabling foreign key constraints for MEDIC...
alter table MEDIC disable constraint SYS_C008892;
prompt Disabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT disable constraint SYS_C008920;
alter table MADICINSHIFT disable constraint SYS_C008921;
prompt Deleting MADICINSHIFT...
delete from MADICINSHIFT;
commit;
prompt Deleting MEDIC...
delete from MEDIC;
commit;
prompt Deleting DRIVERTOAMBU...
delete from DRIVERTOAMBU;
commit;
prompt Deleting DRIVERINSHIFT...
delete from DRIVERINSHIFT;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
commit;
prompt Deleting AMBUTOEVENT...
delete from AMBUTOEVENT;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Deleting SHIFT...
delete from SHIFT;
commit;
prompt Deleting PARAMEDIC...
delete from PARAMEDIC;
commit;
prompt Deleting VOLUNTEER...
delete from VOLUNTEER;
commit;
prompt Deleting AMBULANS...
delete from AMBULANS;
commit;
prompt Loading AMBULANS...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tel Aviv', 1, 101, 'TypeA', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Jerusalem', 2, 102, 'TypeB', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Haifa', 3, 103, 'TypeC', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Beersheba', 4, 104, 'TypeD', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rishon LeZion', 5, 105, 'TypeA', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Petah Tikva', 6, 106, 'TypeB', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ashdod', 7, 107, 'TypeC', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Netanya', 8, 108, 'TypeD', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Holon', 9, 109, 'TypeA', 'Available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bnei Brak', 10, 110, 'TypeB', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gifu', 11111, 111, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Manchester', 11112, 112, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('West Lafayette', 11113, 113, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Berwyn', 11114, 114, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Courbevoie', 11115, 115, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bruxelles', 11116, 116, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Green bay', 11117, 117, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Reisterstown', 11118, 118, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Key Biscayne', 11119, 119, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('South Hadley', 11120, 120, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thessaloniki', 11121, 121, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Boucherville', 11122, 122, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bologna', 11123, 123, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Framingham', 11124, 124, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Los Alamos', 11125, 125, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rorschach', 11126, 126, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('High Wycombe', 11127, 127, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lbeck', 11128, 128, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toyama', 11129, 129, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Golden', 11130, 130, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pasadena', 11131, 131, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hong Kong', 11132, 132, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Los Angeles', 11133, 133, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kuopio', 11134, 134, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oak park', 11135, 135, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Claymont', 11136, 136, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nagasaki', 11137, 137, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Adamstown', 11138, 138, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Billund', 11139, 139, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oosterhout', 11140, 140, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Durban', 11141, 141, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Echirolles', 11142, 142, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Coburg', 11143, 143, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Le chesnay', 11144, 144, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Jose', 11145, 145, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Moorestown', 11146, 146, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gattico', 11147, 147, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mechelen', 11148, 148, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yogyakarta', 11149, 149, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sidney', 11150, 150, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Johannesburg', 11151, 151, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edenbridge', 11152, 152, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Slmea', 11153, 153, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mason', 11154, 154, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Saudarkrokur', 11155, 155, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stellenbosch', 11156, 156, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmingham', 11157, 157, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Koppl', 11158, 158, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Helsingborg', 11159, 159, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warszawa', 11160, 160, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lyon', 11161, 161, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hines', 11162, 162, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ben-Gurion', 11163, 163, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barbengo', 11164, 164, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laguna Bbeach', 11165, 165, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Enschede', 11166, 166, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chirignago', 11167, 167, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ingelheim', 11168, 168, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Utsunomiya', 11169, 169, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kozani', 11170, 170, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lexington', 11171, 171, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('The Woodlands', 11172, 172, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fornacette', 11173, 173, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bingham Farms', 11174, 174, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Arlington', 11175, 175, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stafford', 11176, 176, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Somerset', 11177, 177, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rockville', 11178, 178, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Syracuse', 11179, 179, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Alcobendas', 11180, 180, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Eden prairie', 11181, 181, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dresden', 11182, 182, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chorzףw', 11183, 183, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Richmond Hill', 11184, 184, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cesena', 11185, 185, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maarssen', 11186, 186, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Glasgow', 11187, 187, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kצln', 11188, 188, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Boucherville', 11189, 189, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Angers', 11190, 190, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Milsons Point', 11191, 191, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Saitama', 11192, 192, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Durham', 11193, 193, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tucson', 11194, 194, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heiligenhaus', 11195, 195, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Manchester', 11196, 196, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waalwijk', 11197, 197, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Miyazaki', 11198, 198, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ipswich', 11199, 199, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mclean', 11200, 200, 'motorcycle', 'available');
commit;
prompt 100 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herdecke', 11201, 201, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Farnham', 11202, 202, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tilst', 11203, 203, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Goteborg', 11204, 204, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hermitage', 11205, 205, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Eindhoven', 11206, 206, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Biella', 11207, 207, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heubach', 11208, 208, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vanderbijlpark', 11209, 209, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fukuoka', 11210, 210, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Annandale', 11211, 211, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yavne', 11212, 212, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Osaka', 11213, 213, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Taoyuan', 11214, 214, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa Clarita', 11215, 215, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11216, 216, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ringwood', 11217, 217, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Changwon-si', 11218, 218, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Madrid', 11219, 219, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yogyakarta', 11220, 220, 'motorcycle', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Austin', 11221, 221, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Reston', 11222, 222, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bruxelles', 11223, 223, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lake Forest', 11224, 224, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Banbury', 11225, 225, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marburg', 11226, 226, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hהssleholm', 11227, 227, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Royston', 11228, 228, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Monterrey', 11229, 229, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bradenton', 11230, 230, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Longueuil', 11231, 231, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ponta grossa', 11232, 232, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('durham', 11233, 233, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sao caetano do ', 11234, 234, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa rita sapu', 11235, 235, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charleston', 11236, 236, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charlotte', 11237, 237, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tottori', 11238, 238, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pointe-claire', 11239, 239, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sursee', 11240, 240, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Huntington', 11241, 241, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pusan-city', 11242, 242, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dallas', 11243, 243, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Berlin-Adlersho', 11244, 244, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sapporo', 11245, 245, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valencia', 11246, 246, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kagoshima', 11247, 247, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kagoshima', 11248, 248, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Braintree', 11249, 249, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Golden', 11250, 250, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stavanger', 11251, 251, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Or-yehuda', 11252, 252, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Niles', 11253, 253, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Copenhagen', 11254, 254, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herdecke', 11255, 255, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hyderabad', 11256, 256, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lubbock', 11257, 257, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Aniטres', 11258, 258, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brno', 11259, 259, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bristol', 11260, 260, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Magstadt', 11261, 261, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pearland', 11262, 262, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Storrington', 11263, 263, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Baarn', 11264, 264, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Essen', 11265, 265, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ashdod', 11266, 266, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Szazhalombatta', 11267, 267, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Ramon', 11268, 268, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Westfield', 11269, 269, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Amarillo', 11270, 270, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Greenville', 11271, 271, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Casselberry', 11272, 272, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mount Laurel', 11273, 273, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stockholm', 11274, 274, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vienna', 11275, 275, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Baarn', 11276, 276, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Colombo', 11277, 277, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11278, 278, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lexington', 11279, 279, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Daejeon', 11280, 280, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Madrid', 11281, 281, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warsaw', 11282, 282, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bonn', 11283, 283, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gifu', 11284, 284, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Winnipeg', 11285, 285, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nicosia', 11286, 286, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fuchstal-asch', 11287, 287, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wuerzburg', 11288, 288, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ferraz  vasconc', 11289, 289, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lefkosa', 11290, 290, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cobham', 11291, 291, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Clark', 11292, 292, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bracknell', 11293, 293, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Biella', 11294, 294, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Swannanoa', 11295, 295, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Frederiksberg', 11296, 296, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('League city', 11297, 297, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Venice', 11298, 298, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Potsdam', 11299, 299, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Holderbank', 11300, 300, 'Van', 'available');
commit;
prompt 200 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Jun-nam', 11301, 301, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yokohama', 11302, 302, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edmonton', 11303, 303, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thessaloniki', 11304, 304, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Courbevoie', 11305, 305, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Newnan', 11306, 306, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Annandale', 11307, 307, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Orange', 11308, 308, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Timonium', 11309, 309, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lima', 11310, 310, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmensdorf', 11311, 311, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('L''union', 11312, 312, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Raleigh', 11313, 313, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toledo', 11314, 314, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Leeds', 11315, 315, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ebersberg', 11316, 316, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Coventry', 11317, 317, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tampa', 11318, 318, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ciudad del Este', 11319, 319, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vallauris', 11320, 320, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Atlanta', 11321, 321, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Caguas', 11322, 322, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Colorado Spring', 11323, 323, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Aurora', 11324, 324, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brugherio', 11325, 325, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wellington', 11326, 326, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stony Point', 11327, 327, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valencia', 11328, 328, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Frankfurt', 11329, 329, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heiligenhaus', 11330, 330, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Huntsville', 11331, 331, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Olivette', 11332, 332, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Monterrey', 11333, 333, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Johor Bahru', 11334, 334, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yomgok-dong', 11335, 335, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pulheim-brauwei', 11336, 336, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rosario', 11337, 337, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Budapest', 11338, 338, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yavne', 11339, 339, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Middleburg Heig', 11340, 340, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marlboro', 11341, 341, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lenexa', 11342, 342, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hayward', 11343, 343, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Schlieren', 11344, 344, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Alleroed', 11345, 345, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brussel', 11346, 346, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oulu', 11347, 347, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tbilisi', 11348, 348, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Malmצ', 11349, 349, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Goteborg', 11350, 350, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Blue bell', 11351, 351, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hayward', 11352, 352, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bern', 11353, 353, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Long Island Cit', 11354, 354, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Itu', 11355, 355, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mainz-kastel', 11356, 356, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oldham', 11357, 357, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ilmenau', 11358, 358, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Leeds', 11359, 359, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Parsippany', 11360, 360, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Farnham', 11361, 361, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bremen', 11362, 362, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nuernberg', 11363, 363, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kaiserslautern', 11364, 364, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Irati', 11365, 365, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Turku', 11366, 366, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Athens', 11367, 367, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hהssleholm', 11368, 368, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Heiligenhaus', 11369, 369, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rome', 11370, 370, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Green bay', 11371, 371, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bern', 11372, 372, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Orange', 11373, 373, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Magstadt', 11374, 374, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sulzbach', 11375, 375, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Archbold', 11376, 376, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Middletown', 11377, 377, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gaza', 11378, 378, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Niigata', 11379, 379, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santorso', 11380, 380, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Koeln', 11381, 381, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herndon', 11382, 382, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Zrich', 11383, 383, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mumbai', 11384, 384, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stocksbridge', 11385, 385, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Longview', 11386, 386, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Libertyville', 11387, 387, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laredo', 11388, 388, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paramus', 11389, 389, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Media', 11390, 390, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Reno', 11391, 391, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tadley', 11392, 392, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Washington', 11393, 393, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lucca', 11394, 394, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Duluth', 11395, 395, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hounslow', 11396, 396, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marburg', 11397, 397, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Shoreline', 11398, 398, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Vaduz', 11399, 399, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chambersburg', 11400, 400, 'Van', 'available');
commit;
prompt 300 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Antwerpen', 11401, 401, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rtp', 11402, 402, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pirmasens', 11403, 403, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Amsterdam', 11404, 404, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brisbane', 11405, 405, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Northampton', 11406, 406, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stony Point', 11407, 407, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barbengo', 11408, 408, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Royersford', 11409, 409, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Herford', 11410, 410, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toulouse', 11411, 411, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Port Macquarie', 11412, 412, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lund', 11413, 413, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Araras', 11414, 414, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kanata', 11415, 415, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Yamagata', 11416, 416, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charleston', 11417, 417, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bekescsaba', 11418, 418, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Solikamsk', 11419, 419, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oulu', 11420, 420, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brisbane', 11421, 421, 'Van', 'assigned');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hackensack', 11422, 422, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tokyo', 11423, 423, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hiroshima', 11424, 424, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chinnor', 11425, 425, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('League city', 11426, 426, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('North Wales', 11427, 427, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hjallerup', 11428, 428, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Olsztyn', 11429, 429, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pensacola', 11430, 430, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Anchorage', 11431, 431, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wehrheim', 11432, 432, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Uden', 11433, 433, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pulheim-brauwei', 11434, 434, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brasםlia', 11435, 435, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kaiserslautern', 11436, 436, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Odense', 11437, 437, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('New boston', 11438, 438, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warley', 11439, 439, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rio Rancho', 11440, 440, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wetzlar', 11441, 441, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lima', 11442, 442, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chicago', 11443, 443, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fountain Hills', 11444, 444, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bay Shore', 11445, 445, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maarssen', 11446, 446, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Green bay', 11447, 447, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Forest Park', 11448, 448, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brugherio', 11449, 449, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Petach-Tikva', 11450, 450, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Geneve', 11451, 451, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rochester', 11452, 452, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Taipei', 11453, 453, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pusan', 11454, 454, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mendoza', 11455, 455, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bangalore', 11456, 456, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paisley', 11457, 457, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mechelen', 11458, 458, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Akita', 11459, 459, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tartu', 11460, 460, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Framingham', 11461, 461, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Zrich', 11462, 462, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rotterdam', 11463, 463, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laredo', 11464, 464, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Crete', 11465, 465, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11466, 466, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('South Jordan', 11467, 467, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Glen Cove', 11468, 468, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maidstone', 11469, 469, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Salt Lake City', 11470, 470, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('North Point', 11471, 471, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bad Camberg', 11472, 472, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Palma de Mallor', 11473, 473, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Carlsbad', 11474, 474, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('London', 11475, 475, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Belgrad', 11476, 476, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thame', 11477, 477, 'motorcycle', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cottbus', 11478, 478, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Staten Island', 11479, 479, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Palo Alto', 11480, 480, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gersthofen', 11481, 481, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sale', 11482, 482, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gהvle', 11483, 483, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Perth', 11484, 484, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Belgrad', 11485, 485, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kungki', 11486, 486, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Clark', 11487, 487, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tulsa', 11488, 488, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Southend on Sea', 11489, 489, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tilst', 11490, 490, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Antonio', 11491, 491, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hercules', 11492, 492, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ramat Gan', 11493, 493, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gaithersburg', 11494, 494, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fredericia', 11495, 495, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bradenton', 11496, 496, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Solikamsk', 11497, 497, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Harrisburg', 11498, 498, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bartlesville', 11499, 499, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Arlington', 11500, 500, 'Van', 'notavailable');
commit;
prompt 400 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('El Segundo', 11501, 501, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mablethorpe', 11502, 502, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ramat Gan', 11503, 503, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('N. ft. Myers', 11504, 504, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ramat Gan', 11505, 505, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Amsterdam', 11506, 506, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Friedrichshafe', 11507, 507, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Odense', 11508, 508, 'Van', 'Unavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ribeirao preto', 11509, 509, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Coldmeece', 11510, 510, 'Van', 'available');
commit;
prompt 410 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('1', 'John Doe', 1234567890, '123 Herzl St, Tel Aviv', to_date('01-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('2', 'Jane Smith', 2345678901, '456 Ben Yehuda St, Jerusalem', to_date('02-02-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('3', 'Emily Jones', 3456789012, '789 Hanassi St, Haifa', to_date('03-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('4', 'Michael Brown', 4567890123, '101 David Ben Gurion Blvd, Beersheba', to_date('04-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('5', 'Sarah Davis', 5678901234, '202 Rothschild Blvd, Rishon LeZion', to_date('05-05-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('6', 'David Wilson', 6789012345, '303 Jabotinsky St, Petah Tikva', to_date('06-06-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('7', 'Laura Martinez', 7890123456, '404 Bialik St, Ashdod', to_date('07-07-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('8', 'James Garcia', 8901234567, '505 Herzl St, Netanya', to_date('08-08-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('9', 'Emma Anderson', 9012345678, '606 Weizmann St, Holon', to_date('09-09-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('10', 'Daniel Taylor', 1234567809, '707 Jabotinsky St, Bnei Brak', to_date('10-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11111', 'KurtFisher', 4972396788, '41 Franks Ave', to_date('07-05-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11112', 'ChazzDayne', 8763362161, '881 Brandt Street', to_date('04-05-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11113', 'AntonioVicious', 8515778176, '82 Garner Drive', to_date('12-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11114', 'IlleanaEnglund', 6755578227, '11 Douglas Road', to_date('01-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11115', 'DenisCollette', 7632578449, '66 Calgary Road', to_date('05-03-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11116', 'RobertCoburn', 3653938363, '62 Alpharetta Road', to_date('19-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11117', 'AntonioMacNeil', 5467244281, '2 Hatfield Street', to_date('11-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11118', 'KidMorton', 1158721895, '82 Syracuse Ave', to_date('01-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11119', 'TemueraBroza', 8469688441, '97 Embeth Street', to_date('20-01-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11120', 'NilsGano', 3826123758, '35 Spector Road', to_date('28-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11121', 'GilbertRonstadt', 3214577468, '92 Holly Road', to_date('02-12-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11122', 'JeroenShandling', 2152391251, '14 Imbruglia Street', to_date('26-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11123', 'KaseyGreene', 6729879512, '12nd Street', to_date('29-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11124', 'TramaineBerkeley', 6468629339, '92 Lorraine Drive', to_date('16-08-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11125', 'RoscoeBeckinsale', 9425549363, '47 Hawn Drive', to_date('15-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11126', 'BarryMichael', 8766891857, '75 Mandrell Street', to_date('21-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11127', 'OssieLennox', 3993667811, '53 Jackson', to_date('19-02-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11128', 'JuniorSoul', 6766172186, '25 Donovan Street', to_date('07-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11129', 'MosNelson', 3655386595, '45 Judd Blvd', to_date('20-04-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11130', 'CevinJackman', 1153428164, '63 Sandoval Drive', to_date('10-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11131', 'VincentFichtner', 8541314722, '345 Schlieren', to_date('11-06-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11132', 'ChaleeSampson', 5473322267, '72 Malcolm Drive', to_date('25-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11133', 'CeCeDiCaprio', 9369769488, '86 Aykroyd', to_date('02-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11134', 'JoshuaRossellini', 9845931291, '42 Chazz Road', to_date('21-03-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11135', 'Bobbyde Lancie', 8572624826, '82 Lindley', to_date('28-04-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11136', 'TiaChan', 7275696323, '99 Beckinsale Road', to_date('28-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11137', 'DonalAbraham', 7935533854, '61 Griffith', to_date('17-01-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11138', 'PatriciaDiBiasio', 2516673514, '13rd Street', to_date('09-05-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11139', 'DebbieHackman', 1163639298, '5 Cloris Drive', to_date('20-10-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11140', 'KingLerner', 6894829446, '45 Randal Street', to_date('30-12-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11141', 'WaymanCreek', 2489353759, '92nd Street', to_date('26-05-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11142', 'SydneyHanks', 7273543563, '21 Orange Road', to_date('31-01-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11143', 'NilsPaul', 2946561221, '37 Monterey Road', to_date('26-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11144', 'PragaD''Onofrio', 9684852994, '90 Steven Road', to_date('24-02-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11145', 'WaymanGriffin', 9627287343, '45 Cheshire Street', to_date('13-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11146', 'ShannynSalonga', 1687378646, '31 Morgan Ave', to_date('16-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11147', 'JaneaneSchwarzenegge', 2714346883, '61st Street', to_date('06-02-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11148', 'AngieMartin', 3446959319, '42nd Street', to_date('22-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11149', 'LoreenaKadison', 2145286218, '37 McClinton Drive', to_date('10-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11150', 'ThoraViterelli', 4413772679, '76 Stocksbridge Drive', to_date('02-06-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11151', 'MariePayne', 6449436267, '64 Treviso Blvd', to_date('05-06-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11152', 'OlgaCara', 8326941235, '77 Butler Ave', to_date('01-08-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11153', 'SeannDuvall', 2157393779, '242 Anderson Drive', to_date('03-10-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11154', 'DiamondGordon', 8822363394, '121 Gin Street', to_date('10-06-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11155', 'JoeyCrimson', 4348623846, '78 Bernex Ave', to_date('21-11-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11156', 'KatieHolly', 8292278113, '710 Todd Street', to_date('26-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11157', 'HilaryChecker', 6441542643, '889 Pordenone Street', to_date('15-07-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11158', 'WayneFaithfull', 3788482575, '63 Mira Blvd', to_date('19-06-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11159', 'RonNielsen', 3244547162, '58 Stigers', to_date('12-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11160', 'JoseBarkin', 6789684185, '18 Ronstadt Street', to_date('19-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11161', 'LaurieCoverdale', 7552524153, '978 Balin Street', to_date('13-06-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11162', 'ChazzSchock', 1556341177, '37 Slmea Ave', to_date('16-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11163', 'RichieGetty', 5596996384, '94 Crimson Road', to_date('14-09-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11164', 'KennethBarrymore', 5221294875, '62 Candy Road', to_date('06-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11165', 'NicoleMcGregor', 7418381995, '63 Freiburg Road', to_date('28-09-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11166', 'DanielMcDiarmid', 8165617832, '196 Glover Street', to_date('25-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11167', 'MeredithHerrmann', 8225557193, '24 Gliwice Road', to_date('25-12-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11168', 'JuliaWaite', 4239354138, '80 Stanley Street', to_date('03-12-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11169', 'HowardGarr', 7149142836, '28 Biehn Street', to_date('04-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11170', 'BenicioRowlands', 8367869263, '21st Street', to_date('18-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11171', 'ThinLange', 9769361812, '96 Xander Street', to_date('12-08-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11172', 'JayEdmunds', 5845211542, '63 Meyer', to_date('01-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11173', 'PattyBalin', 9597913681, '57 Fox Drive', to_date('27-12-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11174', 'ColeyNunn', 3598785369, '10 Claymont Ave', to_date('20-07-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11175', 'TanyaDerringer', 6679817771, '42nd Street', to_date('25-04-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11176', 'ChadRankin', 7177665352, '52 Fisher Road', to_date('13-11-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11177', 'ArturoLuPone', 5938352517, '21st Street', to_date('19-12-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11178', 'LanceDownie', 7218147989, '93 Irons Street', to_date('10-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11179', 'ToshiroPalminteri', 5213982158, '57 Witt Road', to_date('31-08-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11180', 'RipRizzo', 6352383651, '50 Washington Road', to_date('27-12-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11181', 'EdPride', 4316819482, '1 Elizabeth Road', to_date('05-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11182', 'NikkaJessee', 9671472531, '100 Melvin Ave', to_date('08-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11183', 'ElisabethStormare', 4151719476, '53 Spector Street', to_date('20-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11184', 'RobWainwright', 8877363564, '52 Forest Road', to_date('18-07-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11185', 'VingHenstridge', 5412876567, '73rd Street', to_date('28-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11186', 'MarkTodd', 2783662721, '31 Hayes Road', to_date('30-01-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11187', 'FayeDonovan', 5139293981, '54 Everett Drive', to_date('28-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11188', 'RoyKoyana', 9837565658, '7 Shelton Ave', to_date('11-12-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11189', 'ChubbyLangella', 4917515341, '1 Shocked Road', to_date('13-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11190', 'Ming-NaRapaport', 8224699672, '51 Johnson Drive', to_date('25-06-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11191', 'GatesHeron', 7421569554, '13 Steagall Road', to_date('08-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11192', 'NanciConroy', 6527669129, '430 Gertner Street', to_date('29-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11193', 'HarryMitra', 9772537568, '27 Blanchett Drive', to_date('12-02-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11194', 'JudiSanchez', 6671487736, '97 Elias Street', to_date('20-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11195', 'Francesvon Sydow', 5599137813, '25 Cardiff Street', to_date('04-12-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11196', 'BlairShannon', 2624541394, '48 Oxford Blvd', to_date('09-09-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11197', 'GiancarloFord', 3118379162, '42nd Street', to_date('20-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11198', 'JefferyNielsen', 3474758151, '48 Palin Road', to_date('11-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11199', 'SallySoul', 8153733483, '12 Marburg Drive', to_date('23-12-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11200', 'RuthUggams', 1422564138, '38 Kevn', to_date('24-10-1998', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11201', 'AngieNegbaur', 3145175935, '52nd Street', to_date('25-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11202', 'AnnaTucker', 8646698362, '30 Holland Blvd', to_date('02-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11203', 'Jonny LeeBarkin', 6885122299, '20 Reynolds Blvd', to_date('13-04-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11204', 'WillieGray', 9149624945, '602 Stevie Drive', to_date('21-12-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11205', 'LoreenaSaucedo', 8944449574, '220 Purley Road', to_date('20-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11206', 'DustinSossamon', 3978734723, '41 Duisburg', to_date('17-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11207', 'EdieHynde', 8832438715, '17 Freddy', to_date('08-10-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11208', 'AlexRomijn-Stamos', 8951674731, '54 Wetzlar Street', to_date('12-06-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11209', 'HalleSteiger', 3854158734, '79 Helen Street', to_date('07-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11210', 'GarryRodriguez', 2215849864, '62nd Street', to_date('21-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11211', 'PhilipRomijn-Stamos', 6288647927, '33 Murray Ave', to_date('18-09-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11212', 'HeatherSanta Rosa', 5265991299, '390 Mraz Drive', to_date('12-04-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11213', 'JoannaGilliam', 1852182232, '25 Drogenbos', to_date('01-01-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11214', 'RobertaGill', 5786942243, '95 Nivola', to_date('19-08-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11215', 'FredericSwank', 8154659574, '48 LuPone', to_date('11-03-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11216', 'SteveBrando', 7899861691, '40 Loggia Road', to_date('08-02-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11217', 'GiancarloWright', 7411985774, '61st Street', to_date('19-08-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11218', 'JaimeCrouch', 6493982889, '59 de Lancie Street', to_date('17-09-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11219', 'PowersTurner', 9783348128, '89 Lauren', to_date('05-12-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11220', 'TimSchwimmer', 5882133165, '31 Spencer', to_date('31-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11221', 'ChetWeiland', 8515112286, '988 Boone Street', to_date('17-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11222', 'KeanuCochran', 7629882319, '19 Helen Street', to_date('18-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11223', 'NikkaMcCabe', 5893866678, '45 Watson Road', to_date('13-03-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11224', 'BretMould', 8429541885, '93rd Street', to_date('13-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11225', 'SonaBreslin', 1547642358, '31 Carlisle Road', to_date('12-11-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11226', 'OliverVan Damme', 1437687231, '21 Coltrane Street', to_date('09-01-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11227', 'EarlBuffalo', 1712948545, '83 Reubens Blvd', to_date('13-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11228', 'ReginaRoth', 2361174256, '941 Maxwell', to_date('06-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11229', 'TreyPleasure', 6838476722, '42 Nivola Blvd', to_date('21-08-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11230', 'GarySaucedo', 6198818941, '65 Avenged Blvd', to_date('18-01-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11231', 'CurtisJudd', 9635435429, '44 Wilmington Blvd', to_date('24-11-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11232', 'MerrileeVaughan', 6724966681, '5 Balk Street', to_date('14-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11233', 'DanPhillips', 4917727476, '93rd Street', to_date('15-10-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11234', 'LorettaDel Toro', 3427822471, '921 Edmunds Road', to_date('28-09-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11235', 'WesleyLee', 7655636619, '75 Murphy Road', to_date('29-08-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11236', 'HarveyCassidy', 9896611115, '13rd Street', to_date('07-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11237', 'PattyImperioli', 7916147822, '56 Fender Street', to_date('08-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11238', 'Mary BethMelvin', 4284795986, '68 Chely Road', to_date('13-10-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11239', 'CurtisShaw', 9846113411, '553 South Jordan Road', to_date('10-08-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11240', 'SuziHoliday', 3112242554, '95 San Jose Blvd', to_date('19-06-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11241', 'HoraceBeck', 4463698952, '45 Cleese Road', to_date('17-11-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11242', 'BrendaKristofferson', 1276694876, '53 Donelly Road', to_date('13-06-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11243', 'TemueraMargulies', 5354375995, '7 Bogguss', to_date('27-06-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11244', 'NigelHorton', 6763739473, '66 Place Road', to_date('05-06-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11245', 'VendettaBurton', 7871727777, '56 Juno Beach Drive', to_date('09-10-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11246', 'JillShandling', 4273217477, '53 Ruth Street', to_date('10-04-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11247', 'BuddyOszajca', 4145464524, '64 Bosco Road', to_date('01-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11248', 'DaveyHagerty', 1598395588, '8 Dooley Road', to_date('02-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11249', 'SeanMellencamp', 7682295877, '530 Baldwin Road', to_date('11-01-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11250', 'CaseyMacDonald', 5413751229, '192 Rockwell Ave', to_date('30-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11251', 'QuentinDiBiasio', 5998625929, '6 Imbruglia Ave', to_date('25-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11252', 'DylanQuinlan', 2136157745, '91 Ebersdorf', to_date('05-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11253', 'GaryBiehn', 2273667171, '15 Noumea Street', to_date('08-11-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11254', 'MykeltiChapman', 1655332134, '866 Aida Road', to_date('13-07-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11255', 'LaurenSalonga', 5559313273, '88 Lenny Street', to_date('18-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11256', 'JenaConnick', 2134639812, '42nd Street', to_date('28-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11257', 'HarveyBlaine', 9165396336, '21 Heald Street', to_date('05-12-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11258', 'DorryCrow', 2182541729, '761 Reeves Street', to_date('15-01-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11259', 'CarlosZellweger', 9125884925, '23rd Street', to_date('07-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11260', 'HarrisBaez', 1127838666, '29 Bellevue Street', to_date('10-08-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11261', 'ClayMohr', 5831955934, '48 Herne Drive', to_date('04-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11262', 'PabloMoraz', 4752186163, '57 Terrence Street', to_date('06-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11263', 'AndreaTillis', 8495142328, '13rd Street', to_date('13-04-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11264', 'TomCampbell', 1835936389, '77 Fukui Street', to_date('07-04-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11265', 'AlanOszajca', 6268471276, '19 Spader Road', to_date('21-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11266', 'SallyGiannini', 7586384938, '58 Richie Street', to_date('06-06-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11267', 'JulietteLucas', 7427444783, '99 DiCaprio Street', to_date('31-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11268', 'LionelPleasence', 2962777679, '20 Luzern Blvd', to_date('07-06-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11269', 'LilaQuatro', 7492925166, '951 Shearer Road', to_date('24-07-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11270', 'OlgaBurton', 2757625777, '33 Edenbridge Road', to_date('10-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11271', 'MinniePeterson', 3383564254, '99 Bolzano Road', to_date('13-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11272', 'AlecPerry', 6283355638, '64 Bellevue Road', to_date('02-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11273', 'ArmandDerringer', 5422191886, '96 Hershey Street', to_date('19-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11274', 'Jonny LeeScaggs', 8173944586, '98 Parish Blvd', to_date('20-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11275', 'MillaSpiner', 7631796737, '36 Murdock Drive', to_date('26-11-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11276', 'TaylorSample', 3819965465, '46 Neneh Street', to_date('24-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11277', 'ForestVannelli', 5523459959, '50 Hugo Street', to_date('20-06-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11278', 'ChubbyMalkovich', 3144761185, '53 Scarlett Road', to_date('01-10-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11279', 'Ianvon Sydow', 5394219349, '92 Pamela Blvd', to_date('12-08-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11280', 'JefferyCarter', 1358799943, '18 Leimen Blvd', to_date('16-06-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11281', 'BelindaPosener', 1268256254, '66 Patricia Road', to_date('02-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11282', 'JonathanCaldwell', 8759176478, '17 Fred Street', to_date('16-08-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11283', 'GabrielleBonneville', 2575731157, '207 Woods Street', to_date('09-10-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11284', 'ToriFarrell', 5382514257, '94 Dalley Blvd', to_date('12-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11285', 'NinaEnglish', 2465582118, '91 Rains Road', to_date('24-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11286', 'RichardMcNarland', 7871984855, '56 Tempest Street', to_date('20-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11287', 'LeonardoBaker', 4877558791, '28 Buffalo Road', to_date('02-11-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11288', 'PragaConnery', 9297455533, '737 Herne Drive', to_date('03-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11289', 'VernSecada', 3146893443, '56 Jody Ave', to_date('05-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11290', 'DarLawrence', 7789186592, '571 Brittany Road', to_date('04-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11291', 'AdamSnider', 3756432823, '18 Trey Drive', to_date('27-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11292', 'PeterIngram', 6957362885, '659 Reisterstown Drive', to_date('31-12-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11293', 'LarenzJeffreys', 1947764149, '73rd Street', to_date('09-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11294', 'RichHedaya', 3232933299, '29 Birch Road', to_date('27-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11295', 'NeilRispoli', 7258232966, '3 L''union Drive', to_date('12-06-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11296', 'LatinBogguss', 8115399958, '31st Street', to_date('07-08-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11297', 'DonnaReid', 5919799314, '49 Davidson', to_date('18-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11298', 'GenaLineback', 8463578662, '12nd Street', to_date('19-02-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11299', 'AnthonyMcGovern', 1716749966, '38 McCready Drive', to_date('19-06-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11300', 'EthanAli', 8422729418, '24 Paul Road', to_date('25-03-1982', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11301', 'SpencerScorsese', 4429662495, '73 Jake Street', to_date('02-07-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11302', 'RemySchock', 5295472773, '49 Rocklin Blvd', to_date('28-06-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11303', 'CaseyColman', 1282561492, '95 Garfunkel Street', to_date('21-10-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11304', 'RichRemar', 3943557299, '41st Street', to_date('23-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11305', 'CrystalRonstadt', 9874326721, '41 Red Blvd', to_date('16-12-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11306', 'BernardMaxwell', 2841929475, '78 Baez Drive', to_date('31-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11307', 'AndraeMcDowall', 8148251636, '30 Fort McMurray Drive', to_date('07-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11308', 'MickeyRush', 6475298477, '60 Zappacosta Road', to_date('09-09-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11309', 'LionelGambon', 9672279979, '14 Lynne Drive', to_date('13-04-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11310', 'LennyGary', 8769446872, '85 Kasey Street', to_date('08-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11311', 'DermotRaye', 9228465537, '84 Victoria Drive', to_date('27-02-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11312', 'MerrillRucker', 6313354222, '64 West Chester Road', to_date('17-08-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11313', 'MelanieLucien', 4596661568, '79 Sarasota Drive', to_date('04-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11314', 'MartinPesci', 7257274139, '98 Fort Lewis Road', to_date('10-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11315', 'TalvinMahoney', 5889276856, '71st Street', to_date('31-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11316', 'DorryScaggs', 3236671988, '76 Toyama Blvd', to_date('19-08-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11317', 'LorenKravitz', 1858254545, '429 Adams Road', to_date('02-11-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11318', 'ThinWarren', 4881941892, '786 Mint Street', to_date('10-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11319', 'DonnaTilly', 6486443168, '83rd Street', to_date('07-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11320', 'GaryDonovan', 7184959493, '68 Houma Road', to_date('29-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11321', 'OlympiaThurman', 6462441761, '69 Barkin Drive', to_date('25-03-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11322', 'GeenaHaynes', 4142545916, '656 Matthau Road', to_date('19-04-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11323', 'LeonBaranski', 2584643514, '15 Firth Street', to_date('17-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11324', 'KirstenTyson', 1389634842, '35 Lisbon Road', to_date('12-08-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11325', 'PaulNapolitano', 5927326367, '100 Teng Street', to_date('29-09-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11326', 'AlfieHartnett', 7276235186, '4 Wainwright Ave', to_date('20-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11327', 'StockardBuckingham', 7313873469, '84 Tate', to_date('08-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11328', 'Carrie-AnneShort', 4295854935, '65 England Ave', to_date('12-11-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11329', 'JaniceDeGraw', 8795658114, '75 Elizabeth Street', to_date('10-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11330', 'EmilyMinogue', 7584396887, '122 Steve Drive', to_date('14-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11331', 'LeoCraig', 9662113697, '80 Bernard Ave', to_date('09-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11332', 'VernFender', 9422414774, '63rd Street', to_date('17-05-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11333', 'JulietteShelton', 7628275462, '150 Yorn Street', to_date('26-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11334', 'ReneGilliam', 7638975449, '32 April Road', to_date('24-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11335', 'RandallCraven', 7441618887, '1000 Buckingham Street', to_date('31-07-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11336', 'BrothersKirshner', 6295164596, '524 Todd Drive', to_date('20-10-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11337', 'BernieClarkson', 3837463883, '52 Ramat Gan Road', to_date('08-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11338', 'KevnBachman', 9582484263, '73 Conners Road', to_date('06-11-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11339', 'KurtwoodDysart', 9267278434, '19 Murray Drive', to_date('10-08-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11340', 'GilbertTucker', 9387649936, '80 Page', to_date('26-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11341', 'EmmQuaid', 9677322483, '64 Delafield Drive', to_date('16-10-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11342', 'SalKlugh', 9761975322, '9 Connery Street', to_date('10-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11343', 'EttaFlatts', 7641363399, '11st Street', to_date('05-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11344', 'PetulaCronin', 5234197161, '35 Lang Ave', to_date('08-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11345', 'ElizaHerrmann', 1617273648, '36 Christina Blvd', to_date('16-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11346', 'DaryleYoung', 3624784872, '70 Newton Road', to_date('27-05-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11347', 'RobbyWarden', 9491922254, '54 Sellers Street', to_date('10-01-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11348', 'NikkiBeals', 1117489983, '84 Seatle Ave', to_date('20-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11349', 'RoddyHead', 5712217264, '315 Burr Ridge Street', to_date('27-04-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11350', 'SolomonOates', 8386812531, '100 Balin Street', to_date('28-07-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11351', 'ElizaJohnson', 2685736379, '16 Folds Road', to_date('22-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11352', 'TalMacy', 3544888469, '98 Portman', to_date('21-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11353', 'BettySteenburgen', 2283725973, '71 Reinhold Ave', to_date('06-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11354', 'RosieZahn', 1486716479, '53 Reykjavik Drive', to_date('11-05-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11355', 'RhysDavidson', 6777199336, '33 Maria Street', to_date('06-09-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11356', 'SylvesterRhymes', 9216556444, '53 Nigel Street', to_date('28-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11357', 'HoraceTankard', 5895411356, '30 Costner Drive', to_date('12-12-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11358', 'ErnestJones', 3821348847, '59 Rachael Ave', to_date('07-01-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11359', 'FrankGugino', 6566182953, '40 Andre', to_date('08-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11360', 'AimeeSweeney', 6371142676, '95 Parm Drive', to_date('26-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11361', 'DonnaLarter', 2236113959, '65 Huntington Blvd', to_date('30-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11362', 'GuyFeore', 9433588399, '22 Slater Drive', to_date('18-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11363', 'DelbertJanssen', 6547587977, '16 Westport Street', to_date('07-04-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11364', 'SelmaBurstyn', 2617453522, '83 Malone Road', to_date('06-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11365', 'ChadTwilley', 1343883818, '419 Loring', to_date('07-11-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11366', 'LionelWinter', 6266373276, '52nd Street', to_date('07-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11367', 'GwynethBlack', 4954499392, '448 Chirignago Blvd', to_date('21-05-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11368', 'WaymanHolm', 8873135368, '57 Wiest Blvd', to_date('16-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11369', 'SimonBorgnine', 2518299446, '8 Nakai Street', to_date('30-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11370', 'PenelopeKeener', 1283241868, '10 Miller Ave', to_date('10-08-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11371', 'RowanLovitz', 1646818973, '26 Colon Street', to_date('22-10-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11372', 'KyleAmos', 4723753131, '11st Street', to_date('01-02-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11373', 'KimHartnett', 1341181679, '43 Rio Rancho Ave', to_date('08-05-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11374', 'AnitaBedelia', 6577572478, '61 North Yorkshire', to_date('01-07-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11375', 'HazelSchwimmer', 8898562559, '53 Himmelman Road', to_date('08-03-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11376', 'MikiRippy', 6183324834, '10 Abbotsford Blvd', to_date('27-04-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11377', 'DavyGrier', 3624266257, '35 Leon Drive', to_date('24-08-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11378', 'ChristmasOsbourne', 6948672823, '34 Ali', to_date('17-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11379', 'JavonDerringer', 8343176162, '994 Christopher Road', to_date('27-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11380', 'RobertConnery', 4467125994, '981 Huntsville Blvd', to_date('08-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11381', 'DeanShearer', 8323552885, '82 Conners Street', to_date('13-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11382', 'ChantיDarren', 7594335184, '11st Street', to_date('19-07-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11383', 'BebeFarrell', 6631199796, '63rd Street', to_date('22-09-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11384', 'CubaViterelli', 2555647394, '45 Geena Drive', to_date('27-11-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11385', 'CledusMcCracken', 9592564444, '21 Cromwell', to_date('07-08-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11386', 'AshleyLaBelle', 6246117872, '183 Sepulveda Road', to_date('28-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11387', 'CleaKeeslar', 6381596652, '89 Hjallerup', to_date('09-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11388', 'NikkiLoring', 5586112378, '51 Renee', to_date('25-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11389', 'HopeStevens', 5996151147, '245 Rain Drive', to_date('06-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11390', 'NatalieKattan', 8638579942, '17 Vince Ave', to_date('16-10-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11391', 'AniPitney', 1454122348, '973 Bush Blvd', to_date('18-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11392', 'EdieLaurie', 8621868229, '62nd Street', to_date('29-01-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11393', 'CledusUggams', 8355595454, '89 Redwood City', to_date('03-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11394', 'VinceNuman', 7225378417, '50 Numan Street', to_date('16-12-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11395', 'SamanthaDepp', 5386415138, '12 Bobby Street', to_date('08-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11396', 'OmarFavreau', 2819951976, '904 Bloomington Street', to_date('17-12-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11397', 'MarkTobolowsky', 2127858724, '33 Warwick Road', to_date('14-12-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11398', 'TiaPollack', 2777239137, '41 Mahood Street', to_date('16-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11399', 'TimMcDonnell', 1343344755, '882 Moriarty Road', to_date('30-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11400', 'HiltonPressly', 2961522612, '81 Aimee Street', to_date('21-12-1998', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11401', 'SydneyLoggia', 1487971931, '65 Hudson', to_date('10-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11402', 'TerenceWinwood', 4342499797, '67 Zeta-Jones Road', to_date('02-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11403', 'RutgerArjona', 1877526428, '736 Johansen Road', to_date('13-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11404', 'OwenTucker', 5897674828, '79 Liev Blvd', to_date('10-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11405', 'DelroyDuschel', 3945638395, '59 Def Road', to_date('11-06-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11406', 'JonHoliday', 3237539611, '97 Chinlund Road', to_date('21-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11407', 'RowanFichtner', 6789626866, '55 Kumamoto Road', to_date('20-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11408', 'MikoMcDowell', 7946729991, '41 Pelvic Drive', to_date('29-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11409', 'IceLofgren', 8431278188, '891 Bruce Street', to_date('16-11-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11410', 'DermotSedgwick', 5392224173, '9 Philip Street', to_date('30-10-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11411', 'SonnyDunaway', 2912167172, '10 Hagar', to_date('05-11-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11412', 'OlgaFarrell', 5289636899, '91st Street', to_date('30-05-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11413', 'AidanPatton', 7333757547, '75 Leoni Drive', to_date('04-04-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11414', 'EmilyDonovan', 6632242137, '956 Oakenfold Drive', to_date('09-06-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11415', 'AniWhitley', 4124678598, '386 Bradford Street', to_date('06-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11416', 'BobbiRedgrave', 2853479799, '91 Queen Road', to_date('21-07-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11417', 'MosWitherspoon', 2524577564, '40 Vega Drive', to_date('27-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11418', 'LindaLynne', 7521772895, '51 Leon Road', to_date('25-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11419', 'CarrieManning', 2677816988, '75 Shaw Ave', to_date('26-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11420', 'KaronPlummer', 9266478921, '30 Dortmund Street', to_date('26-07-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11421', 'Carrie-AnneClarkson', 5526615162, '18 Root Street', to_date('27-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11422', 'DarArmstrong', 9641483722, '862 Santa Clarat Road', to_date('06-02-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11423', 'CarlKweller', 3997715137, '72 Chirignago Road', to_date('03-11-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11424', 'JonathanFurtado', 3551457455, '58 Gold Street', to_date('16-04-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11425', 'AliciaEngland', 4271722983, '30 Cedar Rapids Blvd', to_date('07-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11426', 'ChadMurray', 2356816447, '97 Mifune Road', to_date('10-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11427', 'PamButler', 4899799229, '9 Swarthmore Road', to_date('28-01-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11428', 'JuniorHirsch', 5818439775, '27 Torn Street', to_date('20-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11429', 'GoranFlemyng', 1184997153, '63 Kirkwood Road', to_date('19-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11430', 'FatsEvans', 4661462873, '87 Cuenca Street', to_date('06-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11431', 'DesmondO''Hara', 7996274963, '63rd Street', to_date('13-12-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11432', 'SallySatriani', 8373227794, '37 Milsons Point Ave', to_date('26-02-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11433', 'ShelbyClinton', 5946632286, '55 Neuwirth Drive', to_date('18-06-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11434', 'BrendanSingletary', 4969159622, '29 Apple Ave', to_date('13-11-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11435', 'DrewLemmon', 1934448168, '11 Neuchגtel Road', to_date('06-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11436', 'RitchieBeckinsale', 9714543366, '99 Lane Street', to_date('03-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11437', 'KirkFisher', 8169113127, '126 Trey Blvd', to_date('24-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11438', 'KimMorrison', 5998961519, '100 Jordan Drive', to_date('14-10-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11439', 'Ming-NaCallow', 4773346726, '661 Phifer Street', to_date('28-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11440', 'RonnyWeller', 6622778654, '63 Caine Drive', to_date('31-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11441', 'EdgarMcDowall', 3484764671, '324 Cross Ave', to_date('27-11-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11442', 'ZooeyWells', 5292974226, '37 Indianapolis Drive', to_date('23-09-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11443', 'SeannBreslin', 2278386237, '37 Mira Drive', to_date('27-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11444', 'RutgerRapaport', 2285594435, '18 Kristin Street', to_date('16-07-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11445', 'DariusPryce', 4189962718, '80 Frampton Blvd', to_date('21-08-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11446', 'MirandaHeslov', 8664792159, '93rd Street', to_date('29-04-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11447', 'CleaLillard', 9937994467, '48 Gelsenkirchen', to_date('11-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11448', 'TeriRoy Parnell', 9779186136, '365 Patillo', to_date('02-02-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11449', 'RhettHanks', 9731472489, '85 Hudson Street', to_date('09-08-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11450', 'CyndiDunst', 8679243227, '36 Fishburne Street', to_date('20-09-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11451', 'AlanRibisi', 6779135849, '72nd Street', to_date('15-06-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11452', 'CampbellWard', 5827116141, '73 Charlottesville Road', to_date('25-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11453', 'DavisDetmer', 9788369319, '77 Rhett Drive', to_date('03-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11454', 'NoraVisnjic', 3926562483, '68 Collette Street', to_date('01-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11455', 'SallyFrancis', 2756693523, '32 Peet Drive', to_date('06-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11456', 'MickyNegbaur', 1468887249, '96 Sherman Blvd', to_date('23-09-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11457', 'KieferDavid', 9581762796, '44 Isaac Street', to_date('12-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11458', 'LaraMonk', 1551868771, '28 Canberra', to_date('11-07-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11459', 'OzzyMars', 7178546868, '8 Nancy Drive', to_date('06-09-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11460', 'RonLucas', 9431525531, '48 Horizon Street', to_date('22-11-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11461', 'SherylParker', 3958122732, '99 Assante Ave', to_date('07-02-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11462', 'ChaleeJay', 6843538673, '535 Andy Street', to_date('17-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11463', 'LisaDeLuise', 8985496791, '40 El Dorado Hills', to_date('20-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11464', 'RuebenHerrmann', 4385165991, '39 Diffie Street', to_date('07-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11465', 'DennisGarr', 6255942223, '48 Banderas Street', to_date('19-04-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11466', 'CevinDeschanel', 1464576795, '23 Murdock Street', to_date('01-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11467', 'DebraGosdin', 9497798716, '57 Melrose Road', to_date('14-12-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11468', 'MarlonStudi', 7394463752, '23 Fiona Road', to_date('07-07-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11469', 'HeathStallone', 4422893739, '13 Callow Road', to_date('26-09-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11470', 'JaneaneApplegate', 3223484456, '201 Bonnie Road', to_date('27-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11471', 'SamTripplehorn', 3832436414, '45 Cromwell Road', to_date('18-03-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11472', 'NickySingh', 5827792647, '942 Frankfurt am Main Street', to_date('27-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11473', 'ElvisWeaving', 1586734145, '57 Willie Road', to_date('20-01-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11474', 'RosarioNivola', 8323556233, '20 Wheel Road', to_date('18-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11475', 'BrianDamon', 9378135397, '58 Santa Cruz Blvd', to_date('23-12-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11476', 'CarlosQuinn', 8779345262, '923 Haslam Drive', to_date('03-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11477', 'BuffyMidler', 9288236744, '14 Jolie Road', to_date('18-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11478', 'HikaruPiven', 9985311633, '68 Woods Road', to_date('29-12-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11479', 'MykeltiGlenn', 3678391211, '50 Lucy Blvd', to_date('05-05-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11480', 'LeonardoKidman', 5329819731, '42nd Street', to_date('25-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11481', 'MinnieVanian', 3972943959, '90 Bacharach Street', to_date('21-03-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11482', 'RickyCollie', 2621288396, '30 Stone Street', to_date('29-01-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11483', 'JoanDillane', 3431264313, '98 Lewin Drive', to_date('21-03-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11484', 'RemyLerner', 4355549267, '93 Elvis Road', to_date('10-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11485', 'RitaSteenburgen', 5249466113, '37 Cornell Road', to_date('20-08-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11486', 'GuyRauhofer', 2453767318, '83 Brooks Ave', to_date('12-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11487', 'MillieDushku', 2198356837, '96 Wichita', to_date('17-09-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11488', 'JoelyColtrane', 9131126553, '87 Brock Road', to_date('10-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11489', 'HeatherBasinger', 2782163832, '124 Rhett Drive', to_date('18-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11490', 'MarlonWopat', 3646924699, '197 Rundgren Street', to_date('11-09-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11491', 'HexHead', 8853984959, '95 Guy Drive', to_date('09-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11492', 'SylvesterFerrer', 5859215994, '58 Brendan Road', to_date('13-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11493', 'CarlosDiehl', 2591691236, '68 Arnold Street', to_date('19-02-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11494', 'JudgeHagerty', 9542915567, '69 Sander Road', to_date('08-12-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11495', 'DanielBerry', 3852144255, '8 Gandolfini Road', to_date('20-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11496', 'EmmaTomlin', 5986292993, '90 Affleck Street', to_date('14-04-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11497', 'TomMacy', 4191231536, '87 Rhett Road', to_date('25-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11498', 'MikiIngram', 4935644356, '4 Taipei Street', to_date('13-04-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11499', 'JacksonHerrmann', 3349294234, '57 Nik Drive', to_date('03-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11500', 'EmmaStreep', 1535352449, '92 Broderick Road', to_date('21-05-1992', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11501', 'JesseBarnett', 9874779884, '684 Bruxelles Drive', to_date('19-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11502', 'HaroldBanderas', 8476693764, '3 Nuernberg Road', to_date('11-06-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11503', 'AdinaBenet', 9673263494, '40 Balin Street', to_date('15-08-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11504', 'DarGarofalo', 8556286819, '59 Moreno Street', to_date('22-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11505', 'RussellRyder', 2255854576, '168 Liu Road', to_date('10-04-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11506', 'JeffVai', 2455654458, '95 Herndon Road', to_date('30-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11507', 'KimberlyGarner', 3474639121, '67 McGowan Ave', to_date('05-02-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11508', 'ColmBragg', 4952148794, '55 Jessica Street', to_date('21-11-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11509', 'LennyLaPaglia', 8773424341, '65 Colon Street', to_date('18-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values ('11510', 'BuddyBrandt', 7198876241, '52 Rooker Street', to_date('14-02-1985', 'dd-mm-yyyy'));
commit;
prompt 410 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '1');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '2');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 3, '3');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ben-Gurion University', 2, '4');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Bar-Ilan University', 1, '5');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Weizmann Institute', 6, '6');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Haifa University', 7, '7');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 8, '8');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('IDC Herzliya', 9, '9');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Open University', 10, '10');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11304');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 3, '11219');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11456');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11374');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11500');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11475');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11315');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11298');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11450');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11142');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11488');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11377');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11382');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11263');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11445');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11387');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11496');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11270');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11356');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11295');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11154');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11391');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11128');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11365');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11148');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11187');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11453');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11208');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11186');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11415');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11307');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11328');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11250');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11318');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11361');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11203');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11189');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11205');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11230');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11354');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11308');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11255');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 8, '11269');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, '11144');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11169');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11413');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11185');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11152');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11396');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11449');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 8, '11267');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11431');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11392');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11455');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11223');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11246');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11283');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11184');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11228');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, '11224');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11206');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11277');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, '11322');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11490');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11151');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11378');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11289');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11398');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11188');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11155');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11285');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11119');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11207');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11118');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11478');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 8, '11416');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11198');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11274');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11172');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11411');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11409');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11191');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11168');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11296');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11350');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11117');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 7, '11262');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11138');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11197');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, '11271');
commit;
prompt 100 records committed...
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11492');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11417');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, '11491');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11179');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11335');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11323');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11439');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11257');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11268');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11200');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11233');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11438');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11357');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11432');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11380');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11420');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11214');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11181');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, '11306');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11162');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11422');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11174');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11147');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11178');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11332');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11469');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11366');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, '11349');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11170');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, '11114');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, '11434');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11182');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 1, '11221');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11199');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11333');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11400');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11489');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, '11479');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 3, '11121');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, '11265');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, '11216');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, '11451');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11190');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, '11111');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 9, '11484');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11165');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 4, '11428');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, '11343');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11421');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, '11338');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 2, '11348');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, '11309');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 6, '11281');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11345');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, '11139');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, '11344');
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, '11401');
commit;
prompt 157 records loaded
prompt Loading SHIFT...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (1, to_date('01-01-2024', 'dd-mm-yyyy'), '08:00', '16:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (2, to_date('01-02-2024', 'dd-mm-yyyy'), '08:00', '16:00', '2');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (3, to_date('01-03-2024', 'dd-mm-yyyy'), '08:00', '16:00', '3');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (4, to_date('01-04-2024', 'dd-mm-yyyy'), '08:00', '16:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (5, to_date('01-05-2024', 'dd-mm-yyyy'), '08:00', '16:00', '5');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (6, to_date('01-06-2024', 'dd-mm-yyyy'), '08:00', '16:00', '6');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (7, to_date('01-07-2024', 'dd-mm-yyyy'), '08:00', '16:00', '7');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (8, to_date('01-08-2024', 'dd-mm-yyyy'), '08:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (9, to_date('01-09-2024', 'dd-mm-yyyy'), '08:00', '16:00', '9');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (10, to_date('01-10-2024', 'dd-mm-yyyy'), '08:00', '16:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11, to_date('20-06-2024', 'dd-mm-yyyy'), '08:00', '14:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (12, to_date('20-06-2024', 'dd-mm-yyyy'), '08:00', '14:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (13, to_date('22-06-2024', 'dd-mm-yyyy'), '08:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11111, to_date('16-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11112, to_date('17-01-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11113, to_date('24-06-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11114, to_date('01-08-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11115, to_date('15-01-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11116, to_date('02-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11456');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11117, to_date('08-11-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11118, to_date('20-06-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11119, to_date('03-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11490');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11120, to_date('01-02-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11224');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11121, to_date('04-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11122, to_date('29-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', '2');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11123, to_date('21-05-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11124, to_date('05-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11125, to_date('29-01-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11126, to_date('18-04-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11306');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11127, to_date('12-01-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11128, to_date('05-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11129, to_date('31-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11318');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11130, to_date('26-10-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11179');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11131, to_date('23-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11132, to_date('08-02-2020', 'dd-mm-yyyy'), '12:00', '16:00', '6');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11133, to_date('03-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11134, to_date('28-11-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11135, to_date('04-08-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11270');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11136, to_date('28-11-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11155');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11137, to_date('11-11-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11453');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11138, to_date('25-02-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11188');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11139, to_date('28-06-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11140, to_date('26-04-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11262');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11141, to_date('26-04-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11268');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11142, to_date('11-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11143, to_date('19-02-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11172');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11144, to_date('03-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11445');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11145, to_date('26-07-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11146, to_date('30-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11147, to_date('26-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11469');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11148, to_date('30-12-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11450');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11149, to_date('08-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11150, to_date('02-02-2021', 'dd-mm-yyyy'), '12:00', '18:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11151, to_date('08-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11181');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11152, to_date('07-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11153, to_date('21-12-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11154, to_date('29-04-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11155, to_date('10-08-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11401');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11156, to_date('20-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11157, to_date('03-11-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11158, to_date('11-08-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11216');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11159, to_date('25-04-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11160, to_date('17-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11345');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11161, to_date('04-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11488');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11162, to_date('05-03-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11163, to_date('13-06-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11165');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11164, to_date('13-10-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11165, to_date('26-11-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11315');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11166, to_date('27-10-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11167, to_date('28-02-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11168, to_date('03-02-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11118');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11169, to_date('01-05-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11422');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11170, to_date('26-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11335');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11171, to_date('09-05-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11172, to_date('22-01-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11173, to_date('23-05-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11496');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11174, to_date('08-11-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11175, to_date('06-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11176, to_date('23-04-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11500');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11177, to_date('26-02-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11178, to_date('01-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11179, to_date('20-01-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11500');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11180, to_date('22-02-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11323');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11181, to_date('22-10-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11332');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11182, to_date('27-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11183, to_date('21-11-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11184, to_date('27-04-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11185, to_date('07-06-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11400');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11186, to_date('13-03-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11335');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11187, to_date('08-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11188, to_date('11-10-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11270');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11189, to_date('20-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11332');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11190, to_date('27-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11191, to_date('13-05-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11142');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11192, to_date('26-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11380');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11193, to_date('02-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11365');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11194, to_date('11-10-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11144');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11195, to_date('05-02-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11345');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11196, to_date('06-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11230');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11197, to_date('28-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11345');
commit;
prompt 100 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11198, to_date('27-02-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11199, to_date('28-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11200, to_date('20-11-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11201, to_date('09-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11188');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11202, to_date('05-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11296');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11203, to_date('23-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11469');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11204, to_date('22-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11200');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11205, to_date('26-07-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11206, to_date('22-01-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11296');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11207, to_date('24-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11208, to_date('05-03-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11450');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11209, to_date('19-03-2023', 'dd-mm-yyyy'), '08:00', '18:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11210, to_date('26-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', '3');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11211, to_date('14-09-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11356');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11212, to_date('01-05-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11213, to_date('10-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11214, to_date('20-05-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11262');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11215, to_date('02-02-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11216, to_date('21-09-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11217, to_date('08-11-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11119');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11218, to_date('01-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11219, to_date('03-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11181');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11220, to_date('29-10-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11285');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11221, to_date('06-09-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11222, to_date('20-08-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11223, to_date('24-02-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11392');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11224, to_date('21-01-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11225, to_date('14-07-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11422');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11226, to_date('03-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11449');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11227, to_date('27-12-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11434');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11228, to_date('09-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11179');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11229, to_date('28-08-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11398');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11230, to_date('22-05-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11265');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11231, to_date('21-04-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11269');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11232, to_date('06-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '2');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11233, to_date('01-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11181');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11234, to_date('14-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11235, to_date('25-01-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11236, to_date('11-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11237, to_date('22-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11238, to_date('10-04-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11335');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11239, to_date('01-10-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11322');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11240, to_date('27-06-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11491');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11241, to_date('17-09-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11242, to_date('29-02-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11178');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11243, to_date('26-01-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11244, to_date('08-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11378');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11245, to_date('18-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11246, to_date('27-12-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11190');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11247, to_date('03-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '7');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11248, to_date('09-12-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11197');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11249, to_date('17-03-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11479');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11250, to_date('11-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11400');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11251, to_date('15-04-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11199');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11252, to_date('01-04-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11155');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11253, to_date('10-09-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11254, to_date('14-04-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11255, to_date('25-08-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11256, to_date('23-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11257, to_date('28-09-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11258, to_date('02-08-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11377');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11259, to_date('28-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11121');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11260, to_date('07-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11261, to_date('13-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11269');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11262, to_date('26-12-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11269');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11263, to_date('25-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11264, to_date('10-03-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11265, to_date('22-06-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11266, to_date('11-03-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11267, to_date('11-11-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11345');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11268, to_date('09-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11431');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11269, to_date('01-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11224');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11270, to_date('22-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11271, to_date('18-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11272, to_date('19-09-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11273, to_date('14-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11162');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11274, to_date('03-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11203');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11275, to_date('15-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11276, to_date('08-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11488');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11277, to_date('09-05-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11278, to_date('11-03-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11396');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11279, to_date('08-11-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11306');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11280, to_date('11-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11154');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11281, to_date('17-06-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11216');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11282, to_date('04-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11413');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11283, to_date('31-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11496');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11284, to_date('07-07-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11206');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11285, to_date('24-09-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11286, to_date('26-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11117');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11287, to_date('26-10-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11323');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11288, to_date('21-05-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11268');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11289, to_date('05-05-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11290, to_date('24-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11186');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11291, to_date('04-05-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11338');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11292, to_date('23-03-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11293, to_date('05-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11294, to_date('01-06-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11295, to_date('31-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11296, to_date('20-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11206');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11297, to_date('31-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11417');
commit;
prompt 200 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11298, to_date('12-12-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11299, to_date('26-07-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11300, to_date('04-06-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11214');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11301, to_date('17-05-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11302, to_date('16-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11303, to_date('01-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11304, to_date('02-05-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11305, to_date('26-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11306, to_date('26-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11490');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11307, to_date('01-11-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11139');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11308, to_date('19-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11281');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11309, to_date('29-07-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11374');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11310, to_date('20-06-2023', 'dd-mm-yyyy'), '08:00', '16:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11311, to_date('10-05-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11416');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11312, to_date('12-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11313, to_date('01-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11216');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11314, to_date('28-04-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11315, to_date('10-12-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11304');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11316, to_date('03-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11317, to_date('04-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11184');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11318, to_date('14-03-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11319, to_date('20-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11214');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11320, to_date('30-12-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11434');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11321, to_date('20-04-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11431');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11322, to_date('29-12-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11155');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11323, to_date('27-09-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11378');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11324, to_date('09-02-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11325, to_date('19-07-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11361');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11326, to_date('24-02-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11398');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11327, to_date('24-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11391');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11328, to_date('26-07-2022', 'dd-mm-yyyy'), '08:00', '16:00', '6');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11329, to_date('17-09-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11330, to_date('08-06-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11391');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11331, to_date('26-02-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11332, to_date('16-09-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11178');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11333, to_date('19-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11334, to_date('10-09-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11190');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11335, to_date('02-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11336, to_date('22-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11191');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11337, to_date('14-07-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11338, to_date('25-07-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11416');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11339, to_date('04-03-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11491');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11340, to_date('29-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11341, to_date('05-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11148');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11342, to_date('11-04-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11343, to_date('25-03-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11323');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11344, to_date('04-03-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11345, to_date('18-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11490');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11346, to_date('09-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11347, to_date('01-11-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11184');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11348, to_date('14-06-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11409');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11349, to_date('29-09-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11170');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11350, to_date('28-05-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11351, to_date('23-01-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11366');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11352, to_date('13-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11353, to_date('04-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11354, to_date('04-11-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11121');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11355, to_date('02-04-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11356, to_date('22-08-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11357, to_date('16-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11358, to_date('26-08-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11208');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11359, to_date('24-09-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11360, to_date('16-06-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11189');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11361, to_date('31-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11362, to_date('17-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11363, to_date('06-08-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11374');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11364, to_date('04-07-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11207');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11365, to_date('02-11-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11274');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11366, to_date('25-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11147');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11367, to_date('08-06-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11368, to_date('07-08-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11117');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11369, to_date('23-06-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11308');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11370, to_date('20-05-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11274');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11371, to_date('06-02-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11417');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11372, to_date('26-03-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11373, to_date('18-11-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11274');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11374, to_date('02-02-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11268');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11375, to_date('10-06-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11376, to_date('05-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11377, to_date('25-04-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11172');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11378, to_date('29-10-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11379, to_date('23-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11380, to_date('22-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11438');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11381, to_date('28-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11203');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11382, to_date('23-09-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11138');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11383, to_date('28-01-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11246');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11384, to_date('15-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11385, to_date('08-03-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11386, to_date('30-09-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11357');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11387, to_date('03-11-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11377');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11388, to_date('15-04-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11396');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11389, to_date('14-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11283');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11390, to_date('24-05-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11391, to_date('23-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11428');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11392, to_date('08-10-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11270');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11393, to_date('29-03-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11380');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11394, to_date('01-07-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11114');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11395, to_date('09-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11151');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11396, to_date('16-04-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11333');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11397, to_date('14-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '4');
commit;
prompt 300 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11398, to_date('17-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11399, to_date('07-11-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11400, to_date('09-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11401, to_date('15-09-2023', 'dd-mm-yyyy'), '12:00', '16:00', '8');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11402, to_date('29-06-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11403, to_date('05-08-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11453');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11404, to_date('29-06-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11405, to_date('28-11-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11406, to_date('17-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11407, to_date('18-12-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11417');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11408, to_date('01-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11148');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11409, to_date('09-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11410, to_date('17-03-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11354');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11411, to_date('06-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11169');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11412, to_date('20-05-2022', 'dd-mm-yyyy'), '08:00', '16:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11413, to_date('20-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11144');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11414, to_date('25-08-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11434');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11415, to_date('21-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11186');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11416, to_date('27-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11139');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11417, to_date('14-01-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11418, to_date('05-03-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11322');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11419, to_date('24-06-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11154');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11420, to_date('09-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11422');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11421, to_date('01-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11479');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11422, to_date('04-11-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11423, to_date('08-07-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11424, to_date('23-12-2022', 'dd-mm-yyyy'), '12:00', '18:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11425, to_date('29-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11206');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11426, to_date('03-01-2020', 'dd-mm-yyyy'), '12:00', '16:00', '10');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11427, to_date('27-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11456');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11428, to_date('10-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11478');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11429, to_date('13-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11277');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11430, to_date('05-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11357');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11431, to_date('21-04-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11432, to_date('13-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11315');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11433, to_date('08-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11309');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11434, to_date('11-05-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11435, to_date('13-08-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11289');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11436, to_date('25-01-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11380');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11437, to_date('22-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11500');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11438, to_date('09-08-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11415');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11439, to_date('06-10-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11413');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11440, to_date('15-08-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11186');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11441, to_date('22-02-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11356');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11442, to_date('18-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11443, to_date('28-05-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11492');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11444, to_date('23-11-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11185');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11445, to_date('22-02-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11152');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11446, to_date('16-08-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11451');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11447, to_date('20-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '3');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11448, to_date('05-01-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11174');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11449, to_date('18-02-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11420');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11450, to_date('07-08-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11265');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11451, to_date('17-02-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11452, to_date('23-10-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11187');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11453, to_date('29-07-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11128');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11454, to_date('21-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11318');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11455, to_date('25-01-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11392');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11456, to_date('18-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11198');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11457, to_date('22-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11343');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11458, to_date('15-02-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11411');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11459, to_date('18-09-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11197');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11460, to_date('05-09-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11178');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11461, to_date('17-10-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11263');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11462, to_date('12-07-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11463, to_date('04-10-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11357');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11464, to_date('11-08-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11117');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11465, to_date('19-11-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11154');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11466, to_date('15-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '7');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11467, to_date('21-02-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11468, to_date('07-06-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11197');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11469, to_date('20-07-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11174');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11470, to_date('31-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11168');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11471, to_date('22-10-2021', 'dd-mm-yyyy'), '08:00', '18:00', '11230');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11472, to_date('03-09-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11417');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11473, to_date('22-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11474, to_date('24-07-2022', 'dd-mm-yyyy'), '12:00', '16:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11475, to_date('15-06-2020', 'dd-mm-yyyy'), '12:00', '16:00', '4');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11476, to_date('23-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11208');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11477, to_date('26-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', '11455');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11478, to_date('16-02-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11221');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11479, to_date('16-04-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11265');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11480, to_date('04-04-2021', 'dd-mm-yyyy'), '12:00', '16:00', '11271');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11481, to_date('07-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11489');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11482, to_date('26-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11456');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11483, to_date('08-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11199');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11484, to_date('15-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11478');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11485, to_date('23-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11283');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11486, to_date('29-09-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11348');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11487, to_date('07-05-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11205');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11488, to_date('12-12-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11382');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11489, to_date('26-08-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11344');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11490, to_date('28-04-2020', 'dd-mm-yyyy'), '12:00', '18:00', '11469');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11491, to_date('01-04-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11306');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11492, to_date('23-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11214');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11493, to_date('17-06-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11228');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11494, to_date('22-09-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11350');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11495, to_date('09-03-2021', 'dd-mm-yyyy'), '12:00', '18:00', '11283');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11496, to_date('21-05-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11488');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11497, to_date('10-10-2023', 'dd-mm-yyyy'), '12:00', '16:00', '11432');
commit;
prompt 400 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11498, to_date('31-03-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11499, to_date('18-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11255');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11500, to_date('21-01-2020', 'dd-mm-yyyy'), '08:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11501, to_date('06-02-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11255');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11502, to_date('08-10-2023', 'dd-mm-yyyy'), '08:00', '18:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11503, to_date('25-01-2020', 'dd-mm-yyyy'), '08:00', '16:00', '11224');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11504, to_date('16-04-2020', 'dd-mm-yyyy'), '12:00', '16:00', '11179');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11505, to_date('29-10-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11484');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11506, to_date('23-06-2023', 'dd-mm-yyyy'), '08:00', '16:00', '11281');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11507, to_date('19-09-2023', 'dd-mm-yyyy'), '12:00', '18:00', '11307');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11508, to_date('09-05-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11182');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11509, to_date('18-12-2022', 'dd-mm-yyyy'), '12:00', '16:00', '11475');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11510, to_date('18-08-2022', 'dd-mm-yyyy'), '08:00', '18:00', '11257');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11511, to_date('27-11-2021', 'dd-mm-yyyy'), '08:00', '16:00', '1');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11512, to_date('05-04-2022', 'dd-mm-yyyy'), '08:00', '16:00', '11165');
insert into SHIFT (shift_id_, daate, starttime, endtime, volunteer_id)
values (11513, to_date('29-05-2021', 'dd-mm-yyyy'), '08:00', '16:00', '11308');
commit;
prompt 416 records loaded
prompt Loading EVENT...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (1, 'Birth', 'Tel Aviv', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (2, 'Burn', 'Jerusalem', to_date('01-02-2024', 'dd-mm-yyyy'), 2);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (3, 'Shooting Attack', 'Haifa', to_date('01-03-2024', 'dd-mm-yyyy'), 3);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (4, 'Car Accident', 'Beersheba', to_date('01-04-2024', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (5, 'Heart Attack', 'Rishon LeZion', to_date('01-05-2024', 'dd-mm-yyyy'), 5);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (6, 'Stroke', 'Petah Tikva', to_date('01-06-2024', 'dd-mm-yyyy'), 6);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (7, 'Drowning', 'Ashdod', to_date('01-07-2024', 'dd-mm-yyyy'), 7);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (8, 'Electrocution', 'Netanya', to_date('01-08-2024', 'dd-mm-yyyy'), 8);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (9, 'Fall Injury', 'Holon', to_date('01-09-2024', 'dd-mm-yyyy'), 9);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (10, 'Poisoning', 'Bnei Brak', to_date('01-10-2024', 'dd-mm-yyyy'), 10);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11111, 'Shooting Attack', 'Biella', to_date('12-08-2020', 'dd-mm-yyyy'), 11143);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11112, 'Burn', 'Maidstone', to_date('22-11-2020', 'dd-mm-yyyy'), 11266);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11113, 'Burn', 'Recife', to_date('11-07-2023', 'dd-mm-yyyy'), 11200);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11114, 'Birth', 'Charlottesville', to_date('28-01-2020', 'dd-mm-yyyy'), 11378);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11115, 'Fall Injury', 'Lisbon', to_date('17-06-2023', 'dd-mm-yyyy'), 11243);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11116, 'Car Accident', 'Malmצ', to_date('10-12-2023', 'dd-mm-yyyy'), 11);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11117, 'Birth', 'Dinslaken', to_date('19-03-2021', 'dd-mm-yyyy'), 11500);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11118, 'Car Accident', 'Tallahassee', to_date('13-10-2023', 'dd-mm-yyyy'), 11346);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11119, 'Poisoning', 'Dortmund', to_date('28-04-2023', 'dd-mm-yyyy'), 11286);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11120, 'Fall Injury', 'Juazeiro', to_date('17-05-2023', 'dd-mm-yyyy'), 11305);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11121, 'Fall Injury', 'Singapore', to_date('18-09-2023', 'dd-mm-yyyy'), 11357);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11122, 'Birth', 'Foster City', to_date('10-10-2021', 'dd-mm-yyyy'), 11317);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11123, 'Poisoning', 'Media', to_date('09-09-2022', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11124, 'Shooting Attack', 'Colorado Springs', to_date('11-03-2020', 'dd-mm-yyyy'), 11150);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11125, 'Shooting Attack', 'The Woodlands', to_date('07-07-2020', 'dd-mm-yyyy'), 11187);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11126, 'Fall Injury', 'Hanover', to_date('06-12-2020', 'dd-mm-yyyy'), 11208);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11127, 'Birth', 'Kanazawa', to_date('20-08-2021', 'dd-mm-yyyy'), 11392);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11128, 'Car Accident', 'Di Savigliano', to_date('14-09-2020', 'dd-mm-yyyy'), 11237);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11129, 'Birth', 'Bloomington', to_date('18-10-2020', 'dd-mm-yyyy'), 11358);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11130, 'Fall Injury', 'Ramat Gan', to_date('29-12-2022', 'dd-mm-yyyy'), 11425);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11131, 'Burn', 'Sao caetano do sul', to_date('20-06-2023', 'dd-mm-yyyy'), 11469);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11132, 'Burn', 'Holderbank', to_date('05-03-2021', 'dd-mm-yyyy'), 11271);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11133, 'Birth', 'Vallauris', to_date('24-06-2021', 'dd-mm-yyyy'), 12);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11134, 'Birth', 'Marietta', to_date('06-05-2021', 'dd-mm-yyyy'), 11420);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11135, 'Fall Injury', 'Kuraby', to_date('02-09-2023', 'dd-mm-yyyy'), 11432);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11136, 'Shooting Attack', 'Johor Bahru', to_date('09-12-2021', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11137, 'Poisoning', 'Naestved', to_date('14-06-2021', 'dd-mm-yyyy'), 11334);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11138, 'Fall Injury', 'Portland', to_date('28-11-2020', 'dd-mm-yyyy'), 11262);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11139, 'Shooting Attack', 'Pacific Grove', to_date('02-12-2023', 'dd-mm-yyyy'), 11195);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11140, 'Car Accident', 'Darmstadt', to_date('11-12-2022', 'dd-mm-yyyy'), 11246);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11141, 'Poisoning', 'Rockland', to_date('26-12-2023', 'dd-mm-yyyy'), 11430);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11142, 'Poisoning', 'Boulogne', to_date('13-08-2021', 'dd-mm-yyyy'), 11364);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11143, 'Fall Injury', 'Wehrheim', to_date('15-04-2020', 'dd-mm-yyyy'), 11141);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11144, 'Car Accident', 'Bethesda', to_date('17-08-2022', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11145, 'Fall Injury', 'Courbevoie', to_date('28-04-2023', 'dd-mm-yyyy'), 11308);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11146, 'Fall Injury', 'Berlin-Adlershof', to_date('12-10-2022', 'dd-mm-yyyy'), 11159);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11147, 'Birth', 'Elche', to_date('01-09-2021', 'dd-mm-yyyy'), 11389);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11148, 'Shooting Attack', 'Chambery', to_date('19-08-2021', 'dd-mm-yyyy'), 11410);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11149, 'Shooting Attack', 'Corona', to_date('18-07-2020', 'dd-mm-yyyy'), 11286);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11150, 'Shooting Attack', 'Olympia', to_date('11-11-2021', 'dd-mm-yyyy'), 11135);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11151, 'Birth', 'Cerritos', to_date('22-11-2020', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11152, 'Poisoning', 'Spring City', to_date('28-01-2021', 'dd-mm-yyyy'), 11135);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11153, 'Birth', 'Knoxville', to_date('10-03-2020', 'dd-mm-yyyy'), 11434);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11154, 'Poisoning', 'Sundsvall', to_date('14-09-2022', 'dd-mm-yyyy'), 11124);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11155, 'Fall Injury', 'Istanbul', to_date('19-09-2021', 'dd-mm-yyyy'), 11262);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11156, 'Poisoning', 'Oxford', to_date('01-11-2022', 'dd-mm-yyyy'), 11427);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11157, 'Poisoning', 'Hochwald', to_date('02-06-2022', 'dd-mm-yyyy'), 11470);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11158, 'Burn', 'Warsaw', to_date('25-02-2020', 'dd-mm-yyyy'), 11343);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11159, 'Car Accident', 'Irkutsk', to_date('23-11-2020', 'dd-mm-yyyy'), 11387);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11160, 'Fall Injury', 'Mount Laurel', to_date('09-02-2020', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11161, 'Birth', 'Foster City', to_date('03-06-2021', 'dd-mm-yyyy'), 11134);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11162, 'Birth', 'Bristol', to_date('06-02-2020', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11163, 'Fall Injury', 'Hines', to_date('01-11-2023', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11164, 'Burn', 'Pearland', to_date('05-09-2023', 'dd-mm-yyyy'), 11387);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11165, 'Shooting Attack', 'Mantova', to_date('11-10-2022', 'dd-mm-yyyy'), 11239);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11166, 'Shooting Attack', 'Blue bell', to_date('16-01-2020', 'dd-mm-yyyy'), 11349);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11167, 'Burn', 'Manaus', to_date('10-10-2022', 'dd-mm-yyyy'), 11408);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11168, 'Birth', 'Koppl', to_date('23-06-2021', 'dd-mm-yyyy'), 11247);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11169, 'Fall Injury', 'Carson City', to_date('19-04-2022', 'dd-mm-yyyy'), 11314);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11170, 'Poisoning', 'Vancouver', to_date('27-04-2020', 'dd-mm-yyyy'), 11131);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11171, 'Poisoning', 'Casselberry', to_date('25-01-2020', 'dd-mm-yyyy'), 11242);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11172, 'Fall Injury', 'Osaka', to_date('21-09-2023', 'dd-mm-yyyy'), 11224);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11173, 'Fall Injury', 'Moorestown', to_date('06-03-2021', 'dd-mm-yyyy'), 11246);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11174, 'Car Accident', 'Salzburg', to_date('07-07-2021', 'dd-mm-yyyy'), 11255);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11175, 'Fall Injury', 'Gothenburg', to_date('19-09-2020', 'dd-mm-yyyy'), 11199);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11176, 'Poisoning', 'Matsuyama', to_date('17-01-2023', 'dd-mm-yyyy'), 11363);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11177, 'Shooting Attack', 'Clark', to_date('08-10-2022', 'dd-mm-yyyy'), 11240);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11178, 'Poisoning', 'Americana', to_date('24-05-2020', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11179, 'Fall Injury', 'Olympia', to_date('08-07-2021', 'dd-mm-yyyy'), 11399);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11180, 'Shooting Attack', 'Macclesfield', to_date('13-01-2021', 'dd-mm-yyyy'), 11268);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11181, 'Fall Injury', 'Genטve', to_date('12-11-2021', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11182, 'Shooting Attack', 'Wrzburg', to_date('03-02-2023', 'dd-mm-yyyy'), 11269);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11183, 'Fall Injury', 'Grapevine', to_date('01-03-2020', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11184, 'Car Accident', 'Long Island City', to_date('15-03-2023', 'dd-mm-yyyy'), 11428);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11185, 'Car Accident', 'Regina', to_date('17-01-2020', 'dd-mm-yyyy'), 11116);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11186, 'Poisoning', 'Padova', to_date('12-04-2022', 'dd-mm-yyyy'), 11489);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11187, 'Fall Injury', 'Mainz-kastel', to_date('07-07-2020', 'dd-mm-yyyy'), 11373);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11188, 'Poisoning', 'Redwood Shores', to_date('02-05-2021', 'dd-mm-yyyy'), 11133);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11189, 'Car Accident', 'Cuenca', to_date('29-11-2022', 'dd-mm-yyyy'), 11165);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11190, 'Burn', 'Biel', to_date('24-10-2021', 'dd-mm-yyyy'), 11452);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11191, 'Birth', 'O''fallon', to_date('27-04-2020', 'dd-mm-yyyy'), 11111);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11192, 'Fall Injury', 'Sao caetano do sul', to_date('17-05-2023', 'dd-mm-yyyy'), 11198);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11193, 'Shooting Attack', 'North Yorkshire', to_date('03-06-2021', 'dd-mm-yyyy'), 11117);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11194, 'Fall Injury', 'Cherepovets', to_date('16-04-2021', 'dd-mm-yyyy'), 11449);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11195, 'Fall Injury', 'Fukui', to_date('10-06-2021', 'dd-mm-yyyy'), 11182);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11196, 'Fall Injury', 'Streamwood', to_date('19-02-2020', 'dd-mm-yyyy'), 11361);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11197, 'Birth', 'Buffalo Grove', to_date('25-12-2021', 'dd-mm-yyyy'), 11208);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11198, 'Birth', 'Oyten', to_date('25-04-2022', 'dd-mm-yyyy'), 11446);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11199, 'Fall Injury', 'Caguas', to_date('14-12-2022', 'dd-mm-yyyy'), 11432);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11200, 'Birth', 'East Peoria', to_date('15-04-2023', 'dd-mm-yyyy'), 11395);
commit;
prompt 100 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11201, 'Burn', 'Protvino', to_date('27-08-2020', 'dd-mm-yyyy'), 11474);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11202, 'Fall Injury', 'Southampton', to_date('17-05-2020', 'dd-mm-yyyy'), 11224);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11203, 'Fall Injury', 'California', to_date('30-08-2020', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11204, 'Fall Injury', 'Uden', to_date('12-10-2021', 'dd-mm-yyyy'), 11336);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11205, 'Fall Injury', 'Trieste', to_date('19-07-2020', 'dd-mm-yyyy'), 11234);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11206, 'Burn', 'Fort McMurray', to_date('12-06-2020', 'dd-mm-yyyy'), 11370);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11207, 'Shooting Attack', 'Lippetal', to_date('12-01-2020', 'dd-mm-yyyy'), 11228);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11208, 'Poisoning', 'Algermissen', to_date('29-11-2023', 'dd-mm-yyyy'), 2);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11209, 'Birth', 'Fairbanks', to_date('06-03-2022', 'dd-mm-yyyy'), 11292);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11210, 'Fall Injury', 'Zuerich', to_date('13-05-2020', 'dd-mm-yyyy'), 11374);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11211, 'Birth', 'Chapeco', to_date('14-01-2021', 'dd-mm-yyyy'), 11429);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11212, 'Shooting Attack', 'Peine', to_date('18-03-2022', 'dd-mm-yyyy'), 11272);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11213, 'Shooting Attack', 'Goiania', to_date('24-04-2020', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11214, 'Car Accident', 'Cypress', to_date('23-05-2022', 'dd-mm-yyyy'), 11394);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11215, 'Shooting Attack', 'Hayward', to_date('29-12-2023', 'dd-mm-yyyy'), 11477);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11216, 'Car Accident', 'Raleigh', to_date('19-11-2021', 'dd-mm-yyyy'), 11270);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11217, 'Fall Injury', 'Takapuna', to_date('12-07-2021', 'dd-mm-yyyy'), 11389);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11218, 'Birth', 'Fornacette', to_date('25-05-2022', 'dd-mm-yyyy'), 13);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11219, 'Fall Injury', 'Kרbenhavn', to_date('02-04-2023', 'dd-mm-yyyy'), 11399);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11220, 'Fall Injury', 'Buenos Aires', to_date('09-02-2020', 'dd-mm-yyyy'), 11271);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11221, 'Shooting Attack', 'Coldmeece', to_date('06-05-2021', 'dd-mm-yyyy'), 11319);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11222, 'Burn', 'Suwon-city', to_date('04-01-2021', 'dd-mm-yyyy'), 11264);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11223, 'Burn', 'Santana do parnaםba', to_date('05-10-2023', 'dd-mm-yyyy'), 11326);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11224, 'Birth', 'San Jose', to_date('28-07-2022', 'dd-mm-yyyy'), 11433);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11225, 'Birth', 'Towson', to_date('21-05-2023', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11226, 'Birth', 'Gummersbach', to_date('08-02-2020', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11227, 'Burn', 'Paisley', to_date('15-10-2020', 'dd-mm-yyyy'), 11132);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11228, 'Poisoning', 'Milwaukee', to_date('01-12-2020', 'dd-mm-yyyy'), 11494);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11229, 'Birth', 'Brisbane', to_date('10-11-2023', 'dd-mm-yyyy'), 11367);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11230, 'Fall Injury', 'Media', to_date('18-10-2021', 'dd-mm-yyyy'), 11403);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11231, 'Shooting Attack', 'Courbevoie', to_date('04-11-2023', 'dd-mm-yyyy'), 11189);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11232, 'Burn', 'Key Biscayne', to_date('25-05-2023', 'dd-mm-yyyy'), 11265);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11233, 'Birth', 'Freising', to_date('24-07-2020', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11234, 'Burn', 'Juneau', to_date('01-09-2022', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11235, 'Car Accident', 'Pusan-city', to_date('03-03-2022', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11236, 'Burn', 'Wuerzburg', to_date('27-09-2023', 'dd-mm-yyyy'), 11142);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11237, 'Birth', 'Goteborg', to_date('02-06-2021', 'dd-mm-yyyy'), 11248);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11238, 'Car Accident', 'Chorzףw', to_date('16-03-2022', 'dd-mm-yyyy'), 11395);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11239, 'Car Accident', 'Media', to_date('10-01-2020', 'dd-mm-yyyy'), 11351);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11240, 'Fall Injury', 'Peine', to_date('23-08-2022', 'dd-mm-yyyy'), 11126);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11241, 'Burn', 'Erlangen', to_date('17-01-2023', 'dd-mm-yyyy'), 11214);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11242, 'Birth', 'Rorschach', to_date('01-10-2021', 'dd-mm-yyyy'), 11311);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11243, 'Car Accident', 'Nizhnevartovsk', to_date('07-04-2020', 'dd-mm-yyyy'), 11242);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11244, 'Shooting Attack', 'San Jose', to_date('13-11-2023', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11245, 'Poisoning', 'Lucca', to_date('23-02-2022', 'dd-mm-yyyy'), 11328);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11246, 'Car Accident', 'Bergara', to_date('24-07-2021', 'dd-mm-yyyy'), 11308);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11247, 'Poisoning', 'Sao paulo', to_date('20-08-2020', 'dd-mm-yyyy'), 11447);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11248, 'Car Accident', 'Hהssleholm', to_date('02-07-2020', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11249, 'Birth', 'Karachi', to_date('02-05-2023', 'dd-mm-yyyy'), 11328);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11250, 'Car Accident', 'Erlangen', to_date('22-06-2022', 'dd-mm-yyyy'), 11306);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11251, 'Fall Injury', 'Chinnor', to_date('12-06-2022', 'dd-mm-yyyy'), 11297);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11252, 'Car Accident', 'Middletown', to_date('01-01-2022', 'dd-mm-yyyy'), 11267);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11253, 'Poisoning', 'Rockland', to_date('05-04-2022', 'dd-mm-yyyy'), 11422);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11254, 'Burn', 'Ithaca', to_date('30-05-2022', 'dd-mm-yyyy'), 11202);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11255, 'Birth', 'Fremont', to_date('28-08-2022', 'dd-mm-yyyy'), 11482);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11256, 'Birth', 'Newcastle upon Tyne', to_date('07-09-2022', 'dd-mm-yyyy'), 11188);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11257, 'Poisoning', 'Maryville', to_date('29-12-2020', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11258, 'Birth', 'Mapo-gu', to_date('17-11-2020', 'dd-mm-yyyy'), 11198);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11259, 'Car Accident', 'Hackensack', to_date('07-10-2021', 'dd-mm-yyyy'), 11364);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11260, 'Birth', 'Carlin', to_date('23-03-2022', 'dd-mm-yyyy'), 11401);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11261, 'Fall Injury', 'St Kilda', to_date('09-06-2023', 'dd-mm-yyyy'), 11345);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11262, 'Burn', 'Shawnee', to_date('05-02-2022', 'dd-mm-yyyy'), 11481);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11263, 'Fall Injury', 'Mechanicsburg', to_date('14-12-2023', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11264, 'Poisoning', 'Hartford', to_date('02-07-2023', 'dd-mm-yyyy'), 11249);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11265, 'Shooting Attack', 'Varzea grande', to_date('30-07-2020', 'dd-mm-yyyy'), 11384);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11266, 'Fall Injury', 'Cambridge', to_date('02-03-2023', 'dd-mm-yyyy'), 11306);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11267, 'Fall Injury', 'Leimen', to_date('06-05-2022', 'dd-mm-yyyy'), 11239);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11268, 'Burn', 'Udine', to_date('18-04-2020', 'dd-mm-yyyy'), 11134);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11269, 'Birth', 'Long Island City', to_date('17-09-2022', 'dd-mm-yyyy'), 11382);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11270, 'Fall Injury', 'Prague', to_date('28-11-2022', 'dd-mm-yyyy'), 11443);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11271, 'Car Accident', 'Eden prairie', to_date('15-01-2023', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11272, 'Fall Injury', 'Bad Oeynhausen', to_date('23-09-2021', 'dd-mm-yyyy'), 11154);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11273, 'Fall Injury', 'Rothenburg', to_date('21-08-2023', 'dd-mm-yyyy'), 11139);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11274, 'Shooting Attack', 'Phoenix', to_date('08-10-2022', 'dd-mm-yyyy'), 11112);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11275, 'Poisoning', 'Leawood', to_date('11-01-2021', 'dd-mm-yyyy'), 11291);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11276, 'Shooting Attack', 'Fairfax', to_date('23-04-2023', 'dd-mm-yyyy'), 11319);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11277, 'Birth', 'St Jean de Soudain', to_date('11-05-2020', 'dd-mm-yyyy'), 11212);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11278, 'Shooting Attack', 'Albuquerque', to_date('29-06-2022', 'dd-mm-yyyy'), 11194);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11279, 'Poisoning', 'San Antonio', to_date('13-03-2022', 'dd-mm-yyyy'), 11197);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11280, 'Poisoning', 'Blacksburg', to_date('01-06-2020', 'dd-mm-yyyy'), 12);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11281, 'Poisoning', 'Goslar', to_date('27-05-2023', 'dd-mm-yyyy'), 11384);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11282, 'Car Accident', 'Prague', to_date('13-03-2023', 'dd-mm-yyyy'), 11232);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11283, 'Burn', 'Ramat Gan', to_date('27-09-2021', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11284, 'Shooting Attack', 'Lakewood', to_date('05-11-2023', 'dd-mm-yyyy'), 11304);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11285, 'Poisoning', 'Long Island City', to_date('17-11-2023', 'dd-mm-yyyy'), 11289);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11286, 'Fall Injury', 'Encinitas', to_date('27-10-2021', 'dd-mm-yyyy'), 11401);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11287, 'Car Accident', 'Firenze', to_date('25-09-2021', 'dd-mm-yyyy'), 11437);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11288, 'Car Accident', 'Osaka', to_date('09-07-2022', 'dd-mm-yyyy'), 11130);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11289, 'Burn', 'Media', to_date('13-01-2020', 'dd-mm-yyyy'), 11240);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11290, 'Birth', 'Mechelen', to_date('06-09-2023', 'dd-mm-yyyy'), 11338);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11291, 'Birth', 'Meerbusch', to_date('31-10-2020', 'dd-mm-yyyy'), 11220);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11292, 'Shooting Attack', 'Niigata', to_date('25-02-2022', 'dd-mm-yyyy'), 11232);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11293, 'Birth', 'Fair Lawn', to_date('27-01-2022', 'dd-mm-yyyy'), 11112);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11294, 'Birth', 'Visselhצvede', to_date('01-12-2021', 'dd-mm-yyyy'), 11327);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11295, 'Burn', 'Pיtion-ville', to_date('27-12-2020', 'dd-mm-yyyy'), 11282);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11296, 'Burn', 'Chiba', to_date('01-06-2022', 'dd-mm-yyyy'), 11459);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11297, 'Fall Injury', 'Edenbridge', to_date('15-06-2021', 'dd-mm-yyyy'), 11153);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11298, 'Car Accident', 'Mechanicsburg', to_date('08-03-2021', 'dd-mm-yyyy'), 11445);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11299, 'Birth', 'Belo Horizonte', to_date('05-06-2022', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11300, 'Fall Injury', 'Olsztyn', to_date('19-11-2022', 'dd-mm-yyyy'), 11352);
commit;
prompt 200 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11301, 'Fall Injury', 'Rome', to_date('22-12-2021', 'dd-mm-yyyy'), 11224);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11302, 'Poisoning', 'Jacksonville', to_date('21-12-2022', 'dd-mm-yyyy'), 11401);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11303, 'Birth', 'Forest Park', to_date('15-05-2020', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11304, 'Shooting Attack', 'Edmonton', to_date('05-03-2023', 'dd-mm-yyyy'), 11217);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11305, 'Burn', 'Karachi', to_date('08-05-2022', 'dd-mm-yyyy'), 11429);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11306, 'Burn', 'Royersford', to_date('12-04-2023', 'dd-mm-yyyy'), 11205);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11307, 'Birth', 'Quיbec', to_date('15-09-2020', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11308, 'Burn', 'Boucherville', to_date('02-11-2021', 'dd-mm-yyyy'), 11350);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11309, 'Shooting Attack', 'Rancho Palos Verdes', to_date('06-02-2020', 'dd-mm-yyyy'), 11371);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11310, 'Burn', 'Uetikon am See', to_date('25-08-2020', 'dd-mm-yyyy'), 11265);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11311, 'Birth', 'Thalwil', to_date('31-10-2022', 'dd-mm-yyyy'), 11293);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11312, 'Fall Injury', 'Rosario', to_date('03-08-2021', 'dd-mm-yyyy'), 11115);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11313, 'Shooting Attack', 'West Chester', to_date('14-02-2020', 'dd-mm-yyyy'), 11371);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11314, 'Poisoning', 'Lancaster', to_date('12-04-2020', 'dd-mm-yyyy'), 11358);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11315, 'Car Accident', 'Tualatin', to_date('03-03-2023', 'dd-mm-yyyy'), 11114);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11316, 'Birth', 'Taipei', to_date('03-12-2020', 'dd-mm-yyyy'), 11138);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11317, 'Poisoning', 'Duesseldorf', to_date('26-04-2021', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11318, 'Shooting Attack', 'Aiken', to_date('09-12-2021', 'dd-mm-yyyy'), 11275);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11319, 'Birth', 'North Yorkshire', to_date('03-07-2022', 'dd-mm-yyyy'), 11325);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11320, 'Birth', 'Buenos Aires', to_date('03-02-2020', 'dd-mm-yyyy'), 11391);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11321, 'Burn', 'Mnchen', to_date('30-12-2023', 'dd-mm-yyyy'), 11163);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11322, 'Birth', 'Durban', to_date('29-12-2020', 'dd-mm-yyyy'), 11184);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11323, 'Burn', 'Plymouth Meeting', to_date('23-03-2020', 'dd-mm-yyyy'), 11484);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11324, 'Burn', 'Green bay', to_date('25-09-2020', 'dd-mm-yyyy'), 11186);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11325, 'Poisoning', 'Salvador', to_date('26-10-2022', 'dd-mm-yyyy'), 11372);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11326, 'Birth', 'Menlo Park', to_date('12-11-2022', 'dd-mm-yyyy'), 11244);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11327, 'Fall Injury', 'Protvino', to_date('02-05-2023', 'dd-mm-yyyy'), 11278);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11328, 'Burn', 'San Ramon', to_date('08-03-2021', 'dd-mm-yyyy'), 13);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11329, 'Birth', 'North bethesda', to_date('31-10-2021', 'dd-mm-yyyy'), 11462);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11330, 'Shooting Attack', 'Gdansk', to_date('03-07-2020', 'dd-mm-yyyy'), 11398);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11331, 'Poisoning', 'Colombes', to_date('03-08-2020', 'dd-mm-yyyy'), 11446);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11332, 'Fall Injury', 'Eiksmarka', to_date('15-05-2020', 'dd-mm-yyyy'), 11159);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11333, 'Poisoning', 'Richmond', to_date('09-11-2021', 'dd-mm-yyyy'), 11492);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11334, 'Birth', 'Toyama', to_date('24-03-2023', 'dd-mm-yyyy'), 11140);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11335, 'Car Accident', 'Mapo-gu', to_date('17-10-2022', 'dd-mm-yyyy'), 11365);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11336, 'Poisoning', 'Gersthofen', to_date('02-12-2022', 'dd-mm-yyyy'), 11250);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11337, 'Shooting Attack', 'Fuchstal-asch', to_date('25-12-2022', 'dd-mm-yyyy'), 11237);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11338, 'Birth', 'Charlottesville', to_date('23-08-2022', 'dd-mm-yyyy'), 11416);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11339, 'Fall Injury', 'Hunt Valley', to_date('29-05-2021', 'dd-mm-yyyy'), 11370);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11340, 'Birth', 'Parma', to_date('09-09-2023', 'dd-mm-yyyy'), 10);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11341, 'Birth', 'Shizuoka', to_date('30-03-2023', 'dd-mm-yyyy'), 11440);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11342, 'Car Accident', 'Bloomington', to_date('19-01-2022', 'dd-mm-yyyy'), 11178);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11343, 'Poisoning', 'Kongserbg', to_date('21-12-2021', 'dd-mm-yyyy'), 11253);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11344, 'Car Accident', 'Fort worth', to_date('27-03-2020', 'dd-mm-yyyy'), 11340);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11345, 'Birth', 'Tadley', to_date('07-08-2020', 'dd-mm-yyyy'), 11417);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11346, 'Fall Injury', 'Ittigen', to_date('22-09-2021', 'dd-mm-yyyy'), 11344);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11347, 'Shooting Attack', 'New Delhi', to_date('01-09-2021', 'dd-mm-yyyy'), 11158);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11348, 'Burn', 'Framingaham', to_date('08-11-2020', 'dd-mm-yyyy'), 11265);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11349, 'Shooting Attack', 'Sao caetano do sul', to_date('17-05-2020', 'dd-mm-yyyy'), 11333);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11350, 'Poisoning', 'Coldmeece', to_date('10-04-2021', 'dd-mm-yyyy'), 11446);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11351, 'Car Accident', 'Paraju', to_date('04-10-2022', 'dd-mm-yyyy'), 11119);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11352, 'Shooting Attack', 'Geneva', to_date('13-05-2022', 'dd-mm-yyyy'), 11173);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11353, 'Birth', 'Leipzig', to_date('30-04-2021', 'dd-mm-yyyy'), 11355);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11354, 'Shooting Attack', 'Wetzlar', to_date('12-09-2021', 'dd-mm-yyyy'), 11260);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11355, 'Poisoning', 'Tlalpan', to_date('20-09-2021', 'dd-mm-yyyy'), 11402);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11356, 'Burn', 'Lecanto', to_date('12-06-2021', 'dd-mm-yyyy'), 11435);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11357, 'Fall Injury', 'Nancy', to_date('12-01-2023', 'dd-mm-yyyy'), 11225);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11358, 'Shooting Attack', 'East Providence', to_date('06-03-2020', 'dd-mm-yyyy'), 11234);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11359, 'Shooting Attack', 'London', to_date('21-03-2023', 'dd-mm-yyyy'), 11216);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11360, 'Fall Injury', 'Rochester', to_date('14-07-2023', 'dd-mm-yyyy'), 11122);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11361, 'Poisoning', 'Bretzfeld-Waldbach', to_date('11-02-2022', 'dd-mm-yyyy'), 11204);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11362, 'Car Accident', 'Bratislava', to_date('09-07-2022', 'dd-mm-yyyy'), 11172);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11363, 'Birth', 'Espoo', to_date('30-07-2022', 'dd-mm-yyyy'), 11396);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11364, 'Shooting Attack', 'Brookfield', to_date('19-10-2021', 'dd-mm-yyyy'), 11441);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11365, 'Birth', 'Mechanicsburg', to_date('26-11-2023', 'dd-mm-yyyy'), 11482);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11366, 'Car Accident', 'Grand Rapids', to_date('03-11-2021', 'dd-mm-yyyy'), 11427);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11367, 'Shooting Attack', 'South Weber', to_date('09-12-2020', 'dd-mm-yyyy'), 11220);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11368, 'Car Accident', 'Mainz-kastel', to_date('31-01-2023', 'dd-mm-yyyy'), 11380);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11369, 'Poisoning', 'Geneva', to_date('07-07-2021', 'dd-mm-yyyy'), 11493);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11370, 'Shooting Attack', 'Mainz-kastel', to_date('10-12-2022', 'dd-mm-yyyy'), 11435);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11371, 'Burn', 'Caguas', to_date('05-07-2020', 'dd-mm-yyyy'), 11220);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11372, 'Poisoning', 'San Mateo', to_date('11-05-2020', 'dd-mm-yyyy'), 11385);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11373, 'Car Accident', 'Battle Creek', to_date('03-04-2022', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11374, 'Birth', 'Maidstone', to_date('05-11-2020', 'dd-mm-yyyy'), 11196);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11375, 'Poisoning', 'Oosterhout', to_date('18-06-2022', 'dd-mm-yyyy'), 11142);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11376, 'Fall Injury', 'Nordhausen', to_date('04-06-2022', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11377, 'Burn', 'Ljubljana', to_date('15-06-2023', 'dd-mm-yyyy'), 11137);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11378, 'Shooting Attack', 'Holts Summit', to_date('03-11-2020', 'dd-mm-yyyy'), 11129);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11379, 'Shooting Attack', 'Pacific Grove', to_date('24-02-2020', 'dd-mm-yyyy'), 11194);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11380, 'Birth', 'Hampton', to_date('04-01-2023', 'dd-mm-yyyy'), 11254);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11381, 'Shooting Attack', 'Pיtion-ville', to_date('30-12-2020', 'dd-mm-yyyy'), 11176);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11382, 'Shooting Attack', 'Rtp', to_date('18-02-2021', 'dd-mm-yyyy'), 11406);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11383, 'Car Accident', 'Yucca', to_date('16-01-2023', 'dd-mm-yyyy'), 11487);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11384, 'Fall Injury', 'Karachi', to_date('05-11-2022', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11385, 'Poisoning', 'Monroe', to_date('30-10-2020', 'dd-mm-yyyy'), 11301);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11386, 'Fall Injury', 'East Providence', to_date('25-08-2020', 'dd-mm-yyyy'), 11505);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11387, 'Birth', 'Bellerose', to_date('31-05-2022', 'dd-mm-yyyy'), 11461);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11388, 'Fall Injury', 'Harahan', to_date('10-05-2022', 'dd-mm-yyyy'), 11154);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11389, 'Fall Injury', 'Lake Forest', to_date('13-02-2021', 'dd-mm-yyyy'), 11317);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11390, 'Car Accident', 'Lbeck', to_date('05-05-2023', 'dd-mm-yyyy'), 11319);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11391, 'Fall Injury', 'Altstהtten', to_date('12-02-2023', 'dd-mm-yyyy'), 11273);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11392, 'Birth', 'Santa rita sapucaם', to_date('11-02-2022', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11393, 'Shooting Attack', 'Bismarck', to_date('29-08-2020', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11394, 'Car Accident', 'Glen Cove', to_date('08-10-2021', 'dd-mm-yyyy'), 11336);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11395, 'Burn', 'Laredo', to_date('16-09-2021', 'dd-mm-yyyy'), 11345);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11396, 'Car Accident', 'Charlottesville', to_date('10-09-2020', 'dd-mm-yyyy'), 11320);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11397, 'Burn', 'Treviso', to_date('30-12-2023', 'dd-mm-yyyy'), 11305);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11398, 'Poisoning', 'Oslo', to_date('09-02-2022', 'dd-mm-yyyy'), 11192);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11399, 'Shooting Attack', 'Karlstad', to_date('20-09-2023', 'dd-mm-yyyy'), 11135);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11400, 'Shooting Attack', 'Boston', to_date('04-08-2022', 'dd-mm-yyyy'), 11482);
commit;
prompt 300 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11401, 'Poisoning', 'Cary', to_date('04-11-2023', 'dd-mm-yyyy'), 11209);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11402, 'Fall Injury', 'Flushing', to_date('15-06-2020', 'dd-mm-yyyy'), 11393);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11403, 'Fall Injury', 'Hercules', to_date('13-10-2022', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11404, 'Birth', 'Wetzlar', to_date('10-07-2021', 'dd-mm-yyyy'), 11145);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11405, 'Car Accident', 'Santana do parnaםba', to_date('10-11-2021', 'dd-mm-yyyy'), 11492);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11406, 'Fall Injury', 'New Hope', to_date('05-05-2023', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11407, 'Poisoning', 'Herdecke', to_date('09-05-2023', 'dd-mm-yyyy'), 11271);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11408, 'Birth', 'Dartmouth', to_date('14-06-2023', 'dd-mm-yyyy'), 11423);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11409, 'Birth', 'Fairview Heights', to_date('18-07-2022', 'dd-mm-yyyy'), 11422);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11410, 'Birth', 'Lummen', to_date('23-01-2020', 'dd-mm-yyyy'), 11244);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11411, 'Shooting Attack', 'Drogenbos', to_date('14-11-2023', 'dd-mm-yyyy'), 11280);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11412, 'Car Accident', 'Huntsville', to_date('24-10-2023', 'dd-mm-yyyy'), 11201);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11413, 'Fall Injury', 'Battle Creek', to_date('03-07-2022', 'dd-mm-yyyy'), 11439);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11414, 'Birth', 'Tucson', to_date('22-12-2022', 'dd-mm-yyyy'), 11398);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11415, 'Birth', 'Parsippany', to_date('11-06-2023', 'dd-mm-yyyy'), 11263);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11416, 'Fall Injury', 'Stans', to_date('26-06-2022', 'dd-mm-yyyy'), 11418);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11417, 'Car Accident', 'Neustadt', to_date('01-01-2022', 'dd-mm-yyyy'), 11322);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11418, 'Burn', 'Sulzbach', to_date('30-06-2021', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11419, 'Shooting Attack', 'Cromwell', to_date('24-10-2020', 'dd-mm-yyyy'), 11248);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11420, 'Car Accident', 'West Windsor', to_date('04-03-2022', 'dd-mm-yyyy'), 11444);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11421, 'Fall Injury', 'Bkk', to_date('13-07-2020', 'dd-mm-yyyy'), 11298);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11422, 'Fall Injury', 'Maidenhead', to_date('21-10-2021', 'dd-mm-yyyy'), 11128);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11423, 'Poisoning', 'Lublin', to_date('18-02-2020', 'dd-mm-yyyy'), 11126);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11424, 'Poisoning', 'Paחo de Arcos', to_date('09-03-2021', 'dd-mm-yyyy'), 11347);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11425, 'Burn', 'Moreno Valley', to_date('29-03-2023', 'dd-mm-yyyy'), 11279);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11426, 'Poisoning', 'Toulouse', to_date('08-12-2022', 'dd-mm-yyyy'), 11297);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11427, 'Birth', 'Arlington', to_date('29-07-2020', 'dd-mm-yyyy'), 11348);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11428, 'Poisoning', 'Birmensdorf', to_date('20-12-2021', 'dd-mm-yyyy'), 11149);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11429, 'Birth', 'Rtp', to_date('20-03-2020', 'dd-mm-yyyy'), 11449);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11430, 'Shooting Attack', 'Riverdale', to_date('23-02-2020', 'dd-mm-yyyy'), 11231);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11431, 'Car Accident', 'Oak Park', to_date('01-09-2021', 'dd-mm-yyyy'), 11282);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11432, 'Fall Injury', 'Phoenix', to_date('01-09-2023', 'dd-mm-yyyy'), 3);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11433, 'Birth', 'Meerbusch', to_date('01-03-2021', 'dd-mm-yyyy'), 11341);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11434, 'Poisoning', 'Telford', to_date('10-03-2023', 'dd-mm-yyyy'), 11487);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11435, 'Fall Injury', 'Batavia', to_date('11-03-2021', 'dd-mm-yyyy'), 11424);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11436, 'Fall Injury', 'Farnham', to_date('31-07-2023', 'dd-mm-yyyy'), 11448);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11437, 'Burn', 'Grand Rapids', to_date('23-09-2023', 'dd-mm-yyyy'), 11482);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11438, 'Shooting Attack', 'Maidenhead', to_date('27-04-2021', 'dd-mm-yyyy'), 11325);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11439, 'Car Accident', 'Highlands Ranch', to_date('31-03-2023', 'dd-mm-yyyy'), 11351);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11440, 'Car Accident', 'Monterey', to_date('29-10-2023', 'dd-mm-yyyy'), 11313);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11441, 'Poisoning', 'Alcobendas', to_date('24-07-2020', 'dd-mm-yyyy'), 11186);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11442, 'Poisoning', 'Essen', to_date('29-10-2023', 'dd-mm-yyyy'), 11434);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11443, 'Shooting Attack', 'Zuerich', to_date('01-03-2023', 'dd-mm-yyyy'), 11281);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11444, 'Poisoning', 'Derwood', to_date('02-04-2022', 'dd-mm-yyyy'), 11477);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11445, 'Burn', 'Toyama', to_date('26-05-2023', 'dd-mm-yyyy'), 11399);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11446, 'Poisoning', 'Tsu', to_date('11-09-2022', 'dd-mm-yyyy'), 11194);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11447, 'Burn', 'Sao paulo', to_date('29-11-2020', 'dd-mm-yyyy'), 11368);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11448, 'Birth', 'Stavanger', to_date('28-05-2020', 'dd-mm-yyyy'), 11369);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11449, 'Car Accident', 'Los Angeles', to_date('28-04-2021', 'dd-mm-yyyy'), 11148);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11450, 'Shooting Attack', 'Paisley', to_date('26-09-2020', 'dd-mm-yyyy'), 11415);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11451, 'Birth', 'Mnster', to_date('27-08-2021', 'dd-mm-yyyy'), 11157);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11452, 'Shooting Attack', 'Kungens kurva', to_date('14-09-2022', 'dd-mm-yyyy'), 11136);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11453, 'Shooting Attack', 'Groton', to_date('11-05-2023', 'dd-mm-yyyy'), 11375);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11454, 'Shooting Attack', 'Zrich', to_date('09-03-2022', 'dd-mm-yyyy'), 11243);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11455, 'Shooting Attack', 'Obfelden', to_date('06-01-2020', 'dd-mm-yyyy'), 11127);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11456, 'Shooting Attack', 'El Masnou', to_date('11-05-2022', 'dd-mm-yyyy'), 11430);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11457, 'Poisoning', 'New York', to_date('10-07-2020', 'dd-mm-yyyy'), 11356);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11458, 'Fall Injury', 'Newton-le-willows', to_date('20-04-2021', 'dd-mm-yyyy'), 11119);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11459, 'Burn', 'Linz', to_date('14-07-2020', 'dd-mm-yyyy'), 11329);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11460, 'Shooting Attack', 'Edenbridge', to_date('02-12-2023', 'dd-mm-yyyy'), 11310);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11461, 'Fall Injury', 'Monument', to_date('04-01-2023', 'dd-mm-yyyy'), 11122);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11462, 'Shooting Attack', 'Coppell', to_date('28-07-2023', 'dd-mm-yyyy'), 11496);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11463, 'Birth', 'Banbury', to_date('12-06-2023', 'dd-mm-yyyy'), 11503);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11464, 'Poisoning', 'Pulheim-brauweiler', to_date('28-04-2023', 'dd-mm-yyyy'), 11257);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11465, 'Birth', 'Belo Horizonte', to_date('20-04-2020', 'dd-mm-yyyy'), 11252);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11466, 'Burn', 'Meerbusch', to_date('09-09-2020', 'dd-mm-yyyy'), 11509);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11467, 'Poisoning', 'Lippetal', to_date('28-01-2020', 'dd-mm-yyyy'), 11413);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11468, 'Car Accident', 'Horb', to_date('12-01-2022', 'dd-mm-yyyy'), 11481);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11469, 'Shooting Attack', 'Santa rita sapucaם', to_date('16-06-2023', 'dd-mm-yyyy'), 11117);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11470, 'Burn', 'Narrows', to_date('16-08-2020', 'dd-mm-yyyy'), 11387);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11471, 'Poisoning', 'Herford', to_date('29-04-2023', 'dd-mm-yyyy'), 11464);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11472, 'Fall Injury', 'Oyten', to_date('28-08-2020', 'dd-mm-yyyy'), 11478);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11473, 'Burn', 'Berlin-Adlershof', to_date('09-02-2023', 'dd-mm-yyyy'), 11289);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11474, 'Fall Injury', 'Cedar Rapids', to_date('14-04-2021', 'dd-mm-yyyy'), 11426);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11475, 'Fall Injury', 'Reykjavik', to_date('20-04-2022', 'dd-mm-yyyy'), 11153);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11476, 'Shooting Attack', 'Woking', to_date('30-03-2020', 'dd-mm-yyyy'), 11215);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11477, 'Car Accident', 'Herzlia', to_date('13-02-2021', 'dd-mm-yyyy'), 11459);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11478, 'Birth', 'Ludbreg', to_date('29-01-2023', 'dd-mm-yyyy'), 11382);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11479, 'Poisoning', 'Kungki', to_date('28-07-2022', 'dd-mm-yyyy'), 11363);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11480, 'Poisoning', 'Odense', to_date('22-07-2020', 'dd-mm-yyyy'), 11164);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11481, 'Fall Injury', 'Maryville', to_date('30-07-2020', 'dd-mm-yyyy'), 11428);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11482, 'Burn', 'Issaquah', to_date('12-06-2022', 'dd-mm-yyyy'), 11312);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11483, 'Fall Injury', 'Uetikon am See', to_date('06-03-2022', 'dd-mm-yyyy'), 11451);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11484, 'Birth', 'St-laurent', to_date('04-07-2020', 'dd-mm-yyyy'), 11119);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11485, 'Burn', 'Suberg', to_date('06-09-2022', 'dd-mm-yyyy'), 11408);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11486, 'Poisoning', 'Carlingford', to_date('29-01-2023', 'dd-mm-yyyy'), 11375);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11487, 'Shooting Attack', 'Lathrop', to_date('27-10-2020', 'dd-mm-yyyy'), 11406);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11488, 'Car Accident', 'Wageningen', to_date('22-07-2023', 'dd-mm-yyyy'), 11486);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11489, 'Burn', 'Bloemfontein', to_date('14-05-2022', 'dd-mm-yyyy'), 11383);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11490, 'Shooting Attack', 'Pasadena', to_date('19-02-2023', 'dd-mm-yyyy'), 11426);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11491, 'Car Accident', 'Monmouth', to_date('23-06-2020', 'dd-mm-yyyy'), 11285);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11492, 'Birth', 'Ann Arbor', to_date('25-06-2023', 'dd-mm-yyyy'), 11112);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11493, 'Car Accident', 'Bradenton', to_date('19-03-2023', 'dd-mm-yyyy'), 11390);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11494, 'Car Accident', 'Towson', to_date('04-08-2022', 'dd-mm-yyyy'), 11159);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11495, 'Fall Injury', 'Gauteng', to_date('13-12-2020', 'dd-mm-yyyy'), 11209);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11496, 'Burn', 'Saint Ouen', to_date('14-06-2020', 'dd-mm-yyyy'), 11348);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11497, 'Birth', 'Groton', to_date('05-06-2021', 'dd-mm-yyyy'), 11144);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11498, 'Poisoning', 'Kanazawa', to_date('11-07-2022', 'dd-mm-yyyy'), 11467);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11499, 'Burn', 'Loveland', to_date('31-05-2023', 'dd-mm-yyyy'), 11410);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11500, 'Car Accident', 'Minneapolis', to_date('01-11-2023', 'dd-mm-yyyy'), 11344);
commit;
prompt 400 records committed...
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11501, 'Burn', 'Pirapora bom Jesus', to_date('16-02-2020', 'dd-mm-yyyy'), 11251);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11502, 'Fall Injury', 'Potsdam', to_date('20-04-2023', 'dd-mm-yyyy'), 11331);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11503, 'Car Accident', 'Koblenz', to_date('18-05-2021', 'dd-mm-yyyy'), 11127);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11504, 'Poisoning', 'Oakland', to_date('13-06-2023', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11505, 'Fall Injury', 'Oklahoma city', to_date('02-05-2021', 'dd-mm-yyyy'), 11404);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11506, 'Fall Injury', 'Stavanger', to_date('09-12-2020', 'dd-mm-yyyy'), 11182);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11507, 'Shooting Attack', 'Radovljica', to_date('01-09-2021', 'dd-mm-yyyy'), 11311);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11508, 'Poisoning', 'Mississauga', to_date('23-08-2022', 'dd-mm-yyyy'), 11176);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11509, 'Poisoning', 'Cardiff', to_date('06-09-2020', 'dd-mm-yyyy'), 11315);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11510, 'Car Accident', 'Horb', to_date('20-11-2021', 'dd-mm-yyyy'), 11221);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11511, 'birth', 'tsrofa', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11512, 'birth', 'tsrofa', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11513, 'birth', 'tsrofa', to_date('01-03-2024', 'dd-mm-yyyy'), 3);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11514, 'Car Accident', 'Beer Sheva', to_date('02-10-2022', 'dd-mm-yyyy'), 11193);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11515, 'Shooting Attack', 'Tel Aviv', to_date('06-08-2021', 'dd-mm-yyyy'), 11363);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11516, 'burn', 'Hifa', to_date('01-04-2024', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11517, 'burn', 'Hifa', to_date('01-04-2024', 'dd-mm-yyyy'), 4);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11518, 'Fall Injury', 'Netanya', to_date('14-06-2021', 'dd-mm-yyyy'), 11348);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11519, 'Burn', 'Haifa', to_date('18-11-2020', 'dd-mm-yyyy'), 11373);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11520, 'Fall Injury', 'Ashdod', to_date('20-04-2020', 'dd-mm-yyyy'), 11321);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11521, 'Car Accident', 'Beer Sheva', to_date('09-08-2020', 'dd-mm-yyyy'), 11438);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11522, 'Car Accident', 'Beer Sheva', to_date('04-03-2023', 'dd-mm-yyyy'), 11339);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11523, 'Shooting Attack', 'Jerusalem', to_date('06-10-2020', 'dd-mm-yyyy'), 11196);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11524, 'Birth', 'Haifa', to_date('26-10-2023', 'dd-mm-yyyy'), 11210);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11525, 'Birth', 'HIFA', to_date('01-01-2024', 'dd-mm-yyyy'), 1);
insert into EVENT (event_id, deescription, locaation, date_time, shift_id_)
values (11526, 'Shooting Attack', 'Holon', to_date('15-06-2023', 'dd-mm-yyyy'), 11384);
commit;
prompt 426 records loaded
prompt Loading AMBUTOEVENT...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (1, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (2, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3, 3);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4, 4);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5, 5);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5, 11268);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (6, 6);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 11112);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 11497);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8, 8);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9, 9);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (10, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (10, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11112, 11270);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11133);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11118, 11187);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11120, 11522);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11122, 11348);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11123, 11327);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11125, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11126, 11299);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11126, 11442);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11131, 11305);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11135, 11405);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11136, 11413);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11360);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11439);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11442);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11146, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11148, 11419);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11155, 11361);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11155, 11431);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11156, 11524);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11158, 11268);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11158, 11523);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11161, 11111);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11163, 11246);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11164, 11244);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11166, 11442);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11166, 11515);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11169, 11456);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11173, 11280);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11177, 11244);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11181, 11418);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11191, 11165);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11195, 11136);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11196, 11379);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11198, 11363);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11199, 11222);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11200, 11203);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11202, 11166);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11202, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11208, 11397);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11209, 11177);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11209, 11363);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11212, 11515);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11214, 11381);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11215, 11165);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11215, 11447);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11216, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11216, 11482);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11218, 11171);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11218, 11521);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11219, 11515);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11223, 11325);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11226, 11178);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11228, 11271);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11231, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11231, 11277);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11234, 11514);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11236, 11307);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11237, 11126);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11237, 11372);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11237, 11427);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11238, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11243, 11191);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11243, 11251);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11243, 11266);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11245, 11460);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11246, 11277);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11249, 11396);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11138);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11190);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11204);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11254, 11265);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11255, 11520);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11256, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11262, 11195);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11262, 11355);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11268);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11444);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11491);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11265, 11519);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11266, 11522);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11274, 11341);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11275, 11227);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11281, 11280);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11288, 11123);
commit;
prompt 100 records committed...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11289, 11321);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11289, 11351);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11292, 11314);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11295, 11387);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11297, 11190);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11297, 11347);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11297, 11526);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11298, 11384);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11300, 11324);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11302, 11169);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11303, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11304, 11176);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11308, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11309, 11336);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11310, 11327);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11312, 11499);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11314, 11444);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11315, 11223);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11315, 11238);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11317, 11369);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11322, 11417);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11327, 11163);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11330, 11493);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11331, 11472);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11336, 8);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11336, 11137);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11337, 11377);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11339, 11383);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11341, 11357);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11343, 11319);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11344, 11170);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11345, 11158);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11347, 11391);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11355, 11235);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11357, 11118);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11357, 11128);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11365, 11449);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11366, 11526);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11367, 11176);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11367, 11184);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11369, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11369, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11369, 11523);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11372, 11436);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11373, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11374, 11521);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11375, 11343);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11375, 11484);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11378, 11491);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11378, 11519);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11379, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11379, 11514);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11380, 11204);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11382, 11169);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11384, 11292);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11384, 11523);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11389, 11423);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11391, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11391, 11374);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11394, 11132);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11397, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11398, 11357);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11400, 11425);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11402, 11148);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11402, 11501);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11406, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11407, 11298);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11407, 11400);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11409, 11283);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11409, 11438);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11410, 11468);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11411, 11526);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11415, 11119);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11415, 11271);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11422, 11115);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11422, 11500);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11424, 11443);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11428, 11144);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11428, 11293);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11429, 11156);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11429, 11287);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11438, 11166);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11441, 11298);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11441, 11490);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11441, 11500);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11442, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11442, 11272);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11446, 11163);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11446, 11483);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11448, 11175);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11452, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11452, 11205);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11460, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11462, 11253);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11463, 11146);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11287);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11298);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11450);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11464, 11503);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11468, 11116);
commit;
prompt 200 records committed...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11468, 11407);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11469, 11118);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11470, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11470, 11360);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11472, 11491);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11473, 11190);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11473, 11245);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11475, 11518);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11476, 11274);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11476, 11302);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11476, 11456);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11477, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11479, 11386);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11479, 11500);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11481, 11150);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11481, 11465);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11483, 11181);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11483, 11203);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11486, 11296);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11487, 11420);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11490, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11491, 11362);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11495, 11284);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11497, 11279);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11498, 11412);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11498, 11436);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11499, 11208);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11500, 11168);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11501, 11362);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11502, 11404);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11506, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11507, 11216);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11507, 11305);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11508, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11508, 11352);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11510, 11191);
commit;
prompt 236 records loaded
prompt Loading DRIVER...
insert into DRIVER (licensenum, volunteer_id)
values (11111, '1');
insert into DRIVER (licensenum, volunteer_id)
values (22222, '2');
insert into DRIVER (licensenum, volunteer_id)
values (33333, '3');
insert into DRIVER (licensenum, volunteer_id)
values (44444, '4');
insert into DRIVER (licensenum, volunteer_id)
values (55555, '5');
insert into DRIVER (licensenum, volunteer_id)
values (66666, '6');
insert into DRIVER (licensenum, volunteer_id)
values (77777, '7');
insert into DRIVER (licensenum, volunteer_id)
values (88888, '8');
insert into DRIVER (licensenum, volunteer_id)
values (99999, '9');
insert into DRIVER (licensenum, volunteer_id)
values (101010, '10');
insert into DRIVER (licensenum, volunteer_id)
values (11111, '11413');
insert into DRIVER (licensenum, volunteer_id)
values (11112, '11381');
insert into DRIVER (licensenum, volunteer_id)
values (11113, '11331');
insert into DRIVER (licensenum, volunteer_id)
values (11114, '11268');
insert into DRIVER (licensenum, volunteer_id)
values (11115, '11473');
insert into DRIVER (licensenum, volunteer_id)
values (11116, '11495');
insert into DRIVER (licensenum, volunteer_id)
values (11117, '11242');
insert into DRIVER (licensenum, volunteer_id)
values (11118, '11421');
insert into DRIVER (licensenum, volunteer_id)
values (11119, '11293');
insert into DRIVER (licensenum, volunteer_id)
values (11120, '11121');
insert into DRIVER (licensenum, volunteer_id)
values (11121, '11179');
insert into DRIVER (licensenum, volunteer_id)
values (11122, '11435');
insert into DRIVER (licensenum, volunteer_id)
values (11123, '11352');
insert into DRIVER (licensenum, volunteer_id)
values (11124, '11367');
insert into DRIVER (licensenum, volunteer_id)
values (11125, '11321');
insert into DRIVER (licensenum, volunteer_id)
values (11126, '11188');
insert into DRIVER (licensenum, volunteer_id)
values (11127, '11223');
insert into DRIVER (licensenum, volunteer_id)
values (11128, '11312');
insert into DRIVER (licensenum, volunteer_id)
values (11129, '11423');
insert into DRIVER (licensenum, volunteer_id)
values (11130, '11402');
insert into DRIVER (licensenum, volunteer_id)
values (11131, '11463');
insert into DRIVER (licensenum, volunteer_id)
values (11132, '11498');
insert into DRIVER (licensenum, volunteer_id)
values (11133, '11497');
insert into DRIVER (licensenum, volunteer_id)
values (11134, '11297');
insert into DRIVER (licensenum, volunteer_id)
values (11135, '11191');
insert into DRIVER (licensenum, volunteer_id)
values (11137, '11329');
insert into DRIVER (licensenum, volunteer_id)
values (11138, '11443');
insert into DRIVER (licensenum, volunteer_id)
values (11139, '11140');
insert into DRIVER (licensenum, volunteer_id)
values (11140, '11506');
insert into DRIVER (licensenum, volunteer_id)
values (11141, '11465');
insert into DRIVER (licensenum, volunteer_id)
values (11142, '11315');
insert into DRIVER (licensenum, volunteer_id)
values (11143, '11158');
insert into DRIVER (licensenum, volunteer_id)
values (11145, '11481');
insert into DRIVER (licensenum, volunteer_id)
values (11146, '11265');
insert into DRIVER (licensenum, volunteer_id)
values (11148, '11213');
insert into DRIVER (licensenum, volunteer_id)
values (11149, '11258');
insert into DRIVER (licensenum, volunteer_id)
values (11150, '11489');
insert into DRIVER (licensenum, volunteer_id)
values (11151, '11129');
insert into DRIVER (licensenum, volunteer_id)
values (11152, '11325');
insert into DRIVER (licensenum, volunteer_id)
values (11153, '11260');
insert into DRIVER (licensenum, volunteer_id)
values (11154, '11353');
insert into DRIVER (licensenum, volunteer_id)
values (11155, '11400');
insert into DRIVER (licensenum, volunteer_id)
values (11156, '11131');
insert into DRIVER (licensenum, volunteer_id)
values (11157, '11199');
insert into DRIVER (licensenum, volunteer_id)
values (11158, '11285');
insert into DRIVER (licensenum, volunteer_id)
values (11159, '11235');
insert into DRIVER (licensenum, volunteer_id)
values (11160, '11408');
insert into DRIVER (licensenum, volunteer_id)
values (11161, '11478');
insert into DRIVER (licensenum, volunteer_id)
values (11162, '11374');
insert into DRIVER (licensenum, volunteer_id)
values (11163, '11160');
insert into DRIVER (licensenum, volunteer_id)
values (11164, '11430');
insert into DRIVER (licensenum, volunteer_id)
values (11165, '11266');
insert into DRIVER (licensenum, volunteer_id)
values (11166, '11138');
insert into DRIVER (licensenum, volunteer_id)
values (11167, '11442');
insert into DRIVER (licensenum, volunteer_id)
values (11170, '11369');
insert into DRIVER (licensenum, volunteer_id)
values (11171, '11327');
insert into DRIVER (licensenum, volunteer_id)
values (11172, '11449');
insert into DRIVER (licensenum, volunteer_id)
values (11173, '11508');
insert into DRIVER (licensenum, volunteer_id)
values (11174, '11244');
insert into DRIVER (licensenum, volunteer_id)
values (11175, '11280');
insert into DRIVER (licensenum, volunteer_id)
values (11176, '11190');
insert into DRIVER (licensenum, volunteer_id)
values (11177, '11509');
insert into DRIVER (licensenum, volunteer_id)
values (11178, '11231');
insert into DRIVER (licensenum, volunteer_id)
values (11180, '11384');
insert into DRIVER (licensenum, volunteer_id)
values (11181, '11460');
insert into DRIVER (licensenum, volunteer_id)
values (11183, '11236');
insert into DRIVER (licensenum, volunteer_id)
values (11184, '11182');
insert into DRIVER (licensenum, volunteer_id)
values (11185, '11344');
insert into DRIVER (licensenum, volunteer_id)
values (11186, '11335');
insert into DRIVER (licensenum, volunteer_id)
values (11188, '11230');
insert into DRIVER (licensenum, volunteer_id)
values (11189, '11431');
insert into DRIVER (licensenum, volunteer_id)
values (11190, '11456');
insert into DRIVER (licensenum, volunteer_id)
values (11191, '11311');
insert into DRIVER (licensenum, volunteer_id)
values (11192, '11137');
insert into DRIVER (licensenum, volunteer_id)
values (11193, '11157');
insert into DRIVER (licensenum, volunteer_id)
values (11194, '11452');
insert into DRIVER (licensenum, volunteer_id)
values (11196, '11499');
insert into DRIVER (licensenum, volunteer_id)
values (11197, '11153');
insert into DRIVER (licensenum, volunteer_id)
values (11198, '11185');
insert into DRIVER (licensenum, volunteer_id)
values (11199, '11232');
insert into DRIVER (licensenum, volunteer_id)
values (11200, '11496');
insert into DRIVER (licensenum, volunteer_id)
values (11201, '11114');
insert into DRIVER (licensenum, volunteer_id)
values (11202, '11224');
insert into DRIVER (licensenum, volunteer_id)
values (11204, '11186');
insert into DRIVER (licensenum, volunteer_id)
values (11208, '11349');
insert into DRIVER (licensenum, volunteer_id)
values (11209, '11307');
insert into DRIVER (licensenum, volunteer_id)
values (11211, '11362');
insert into DRIVER (licensenum, volunteer_id)
values (11212, '11205');
insert into DRIVER (licensenum, volunteer_id)
values (11213, '11264');
insert into DRIVER (licensenum, volunteer_id)
values (11215, '11278');
commit;
prompt 100 records committed...
insert into DRIVER (licensenum, volunteer_id)
values (11217, '11490');
insert into DRIVER (licensenum, volunteer_id)
values (11218, '11211');
insert into DRIVER (licensenum, volunteer_id)
values (11219, '11252');
insert into DRIVER (licensenum, volunteer_id)
values (11220, '11383');
insert into DRIVER (licensenum, volunteer_id)
values (11221, '11167');
insert into DRIVER (licensenum, volunteer_id)
values (11223, '11398');
insert into DRIVER (licensenum, volunteer_id)
values (11224, '11404');
insert into DRIVER (licensenum, volunteer_id)
values (11225, '11457');
insert into DRIVER (licensenum, volunteer_id)
values (11227, '11317');
insert into DRIVER (licensenum, volunteer_id)
values (11228, '11276');
insert into DRIVER (licensenum, volunteer_id)
values (11229, '11217');
insert into DRIVER (licensenum, volunteer_id)
values (11230, '11279');
insert into DRIVER (licensenum, volunteer_id)
values (11231, '11147');
insert into DRIVER (licensenum, volunteer_id)
values (11232, '11225');
insert into DRIVER (licensenum, volunteer_id)
values (11233, '11240');
insert into DRIVER (licensenum, volunteer_id)
values (11234, '11341');
insert into DRIVER (licensenum, volunteer_id)
values (11235, '11365');
insert into DRIVER (licensenum, volunteer_id)
values (11236, '11115');
insert into DRIVER (licensenum, volunteer_id)
values (11239, '11403');
insert into DRIVER (licensenum, volunteer_id)
values (11242, '11309');
insert into DRIVER (licensenum, volunteer_id)
values (11243, '11299');
insert into DRIVER (licensenum, volunteer_id)
values (11244, '11237');
insert into DRIVER (licensenum, volunteer_id)
values (11245, '11170');
insert into DRIVER (licensenum, volunteer_id)
values (11246, '11134');
insert into DRIVER (licensenum, volunteer_id)
values (11248, '11127');
insert into DRIVER (licensenum, volunteer_id)
values (11249, '11504');
insert into DRIVER (licensenum, volunteer_id)
values (11250, '11198');
insert into DRIVER (licensenum, volunteer_id)
values (11251, '11195');
insert into DRIVER (licensenum, volunteer_id)
values (11253, '11254');
insert into DRIVER (licensenum, volunteer_id)
values (11254, '11484');
insert into DRIVER (licensenum, volunteer_id)
values (11256, '11303');
insert into DRIVER (licensenum, volunteer_id)
values (11258, '11308');
insert into DRIVER (licensenum, volunteer_id)
values (11260, '11288');
insert into DRIVER (licensenum, volunteer_id)
values (11261, '11373');
insert into DRIVER (licensenum, volunteer_id)
values (11263, '11372');
insert into DRIVER (licensenum, volunteer_id)
values (11264, '11492');
insert into DRIVER (licensenum, volunteer_id)
values (11268, '11156');
insert into DRIVER (licensenum, volunteer_id)
values (11269, '11117');
insert into DRIVER (licensenum, volunteer_id)
values (11270, '11395');
insert into DRIVER (licensenum, volunteer_id)
values (11272, '11454');
insert into DRIVER (licensenum, volunteer_id)
values (11273, '11184');
insert into DRIVER (licensenum, volunteer_id)
values (11275, '11448');
insert into DRIVER (licensenum, volunteer_id)
values (11276, '11355');
insert into DRIVER (licensenum, volunteer_id)
values (11277, '11119');
insert into DRIVER (licensenum, volunteer_id)
values (11278, '11189');
insert into DRIVER (licensenum, volunteer_id)
values (11281, '11357');
insert into DRIVER (licensenum, volunteer_id)
values (11283, '11356');
insert into DRIVER (licensenum, volunteer_id)
values (11284, '11183');
insert into DRIVER (licensenum, volunteer_id)
values (11285, '11366');
insert into DRIVER (licensenum, volunteer_id)
values (11290, '11239');
insert into DRIVER (licensenum, volunteer_id)
values (11291, '11305');
insert into DRIVER (licensenum, volunteer_id)
values (11293, '11385');
insert into DRIVER (licensenum, volunteer_id)
values (11294, '11388');
insert into DRIVER (licensenum, volunteer_id)
values (11296, '11149');
insert into DRIVER (licensenum, volunteer_id)
values (11297, '11502');
insert into DRIVER (licensenum, volunteer_id)
values (11299, '11350');
insert into DRIVER (licensenum, volunteer_id)
values (11301, '11477');
insert into DRIVER (licensenum, volunteer_id)
values (11303, '11396');
insert into DRIVER (licensenum, volunteer_id)
values (11305, '11229');
insert into DRIVER (licensenum, volunteer_id)
values (11306, '11375');
insert into DRIVER (licensenum, volunteer_id)
values (11309, '11316');
commit;
prompt 161 records loaded
prompt Loading DRIVERINSHIFT...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('1', 1);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('1', 11112);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 10);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 13);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11252);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11371);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11393);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11471);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11478);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('10', 11481);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11114', 11236);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11115', 11311);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11115', 11367);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11115', 11501);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11117', 11247);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11119', 11421);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11121', 11383);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11121', 11430);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11127', 11349);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11129', 11183);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11129', 11432);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11131', 11456);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11134', 12);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11134', 11187);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11157);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11319);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11365);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11137', 11411);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11138', 11129);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11138', 11416);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11140', 11141);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11140', 11513);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11147', 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11149', 11167);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11149', 11169);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11149', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11153', 11438);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11156', 11502);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11124);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11167);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11258);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11157', 11349);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11158', 11398);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11158', 11435);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11160', 11198);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11160', 11275);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11167', 11179);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11167', 11188);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11167', 11277);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11170', 11125);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11170', 11229);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11170', 11385);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11155);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11280);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11457);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11179', 11495);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11182', 11206);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11182', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11183', 11199);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11183', 11451);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11184', 11191);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11185', 11233);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11185', 11316);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11186', 11237);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11186', 11321);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11188', 11166);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11188', 11271);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11188', 11432);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11189', 11485);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11366);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11376);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11394);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11190', 11454);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11191', 11136);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11195', 11319);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11195', 11441);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11198', 11304);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11199', 11240);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11199', 11340);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11199', 11361);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11205', 11);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11211', 11161);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11211', 11392);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11211', 11441);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11213', 11285);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11213', 11453);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11125);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11189);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11197);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11394);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11217', 11428);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11223', 11221);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 6);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11168);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11322);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11334);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11224', 11399);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11225', 11433);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11229', 11272);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11230', 11223);
commit;
prompt 100 records committed...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11230', 11467);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11231', 11316);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11232', 11295);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11232', 11387);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11232', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11275);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11315);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11329);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11437);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11236', 11449);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11237', 11339);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11239', 11360);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11240', 11253);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11242', 11238);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11242', 11340);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11242', 11415);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11244', 11336);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11252', 11157);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11252', 11334);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11252', 11337);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11254', 11506);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11258', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11258', 11427);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11264', 11327);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11264', 11380);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11211);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11288);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11265', 11308);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11266', 11407);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11276', 7);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11276', 11275);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11278', 11449);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11279', 11139);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11280', 11112);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11280', 11259);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11280', 11437);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11285', 11119);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11285', 11322);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11288', 11352);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11303', 11237);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11303', 11396);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11305', 11276);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11308', 11215);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11308', 11276);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11308', 11338);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11309', 11229);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11311', 11343);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11312', 11409);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 5);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11260);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11328);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11445);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11315', 11496);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11316', 11203);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11317', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11317', 11299);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11321', 11247);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11325', 11189);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11325', 11468);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11329', 11137);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11329', 11268);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11331', 11111);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11331', 11363);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11335', 11128);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11335', 11175);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11341', 11421);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11344', 11125);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11344', 11268);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11344', 11318);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11350', 11126);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11350', 11166);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11350', 11495);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11134);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11182);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11217);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11352', 11311);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11355', 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11356', 4);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11356', 11224);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11357', 11177);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11357', 11365);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11357', 11471);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11362', 11225);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11362', 11377);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11362', 11505);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11365', 11392);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11366', 11113);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11366', 11373);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11366', 11388);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11367', 11378);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11372', 11311);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11372', 11501);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11166);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11202);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11487);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11373', 11496);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11375', 11142);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11375', 11426);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11375', 11471);
commit;
prompt 200 records committed...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11381', 11447);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11130);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11180);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11235);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11383', 11344);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11384', 4);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11385', 11171);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11385', 11246);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11385', 11254);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11388', 11240);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11388', 11459);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 13);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 11212);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 11221);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11395', 11376);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11396', 11189);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11396', 11192);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11396', 11283);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11400', 11354);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11402', 11209);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11403', 11363);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11403', 11455);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11404', 11215);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11408', 11212);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11408', 11329);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11408', 11488);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11413', 11135);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11413', 11169);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11423', 11122);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11423', 11492);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11430', 11201);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11430', 11347);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11431', 11292);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11431', 11454);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11435', 11291);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11435', 11423);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11442', 11121);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11442', 11385);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11132);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11177);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11227);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11443', 11494);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11448', 11235);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11448', 11472);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11449', 11473);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11454', 11298);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11456', 11372);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11456', 11393);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11457', 11460);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11460', 11271);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11460', 11512);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11463', 11149);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11477', 11185);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11477', 11391);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11478', 11134);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11478', 11290);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11481', 11251);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11481', 11509);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11489', 11128);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11489', 11308);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11489', 11374);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11490', 11143);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11490', 11368);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11222);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11234);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11293);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11294);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11329);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11492', 11466);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11495', 11148);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11495', 11202);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11495', 11255);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11496', 11193);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11496', 11267);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 9);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 11139);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 11163);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11497', 11388);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11498', 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11498', 11279);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11498', 11481);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11499', 11415);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11502', 11341);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11502', 11421);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11504', 11307);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11504', 11393);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11506', 13);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11506', 11466);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11506', 11507);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11508', 11477);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11509', 11175);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11509', 11280);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('11509', 11410);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('2', 2);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('2', 11149);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('2', 11299);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('3', 3);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('3', 11472);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('3', 11491);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 4);
commit;
prompt 300 records committed...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11113);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11136);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11257);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11459);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('4', 11511);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 5);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11175);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11398);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('5', 11412);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('6', 6);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('6', 11471);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('7', 7);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('7', 11470);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('8', 8);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('8', 12);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('8', 11269);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('9', 9);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('9', 11211);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values ('9', 11377);
commit;
prompt 320 records loaded
prompt Loading DRIVERTOAMBU...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('1', 1);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 10);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 11222);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 11261);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('10', 11509);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11115', 11386);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11119', 11451);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11121', 11208);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11121', 11227);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11127', 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11129', 11164);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11129', 11476);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11131', 11162);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11131', 11350);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11134', 11297);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11134', 11370);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11137', 11443);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11137', 11454);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11138', 11286);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11138', 11394);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11138', 11430);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11140', 11130);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11140', 11206);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11147', 11252);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11149', 11164);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11149', 11390);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11153', 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11156', 11171);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11156', 11276);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11156', 11458);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11157', 11145);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11158', 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11158', 11130);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11160', 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11160', 11129);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11182', 11269);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11182', 11278);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11182', 11501);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11200);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11245);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11333);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11183', 11413);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11185', 10);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11185', 11327);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11186', 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11186', 11152);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11186', 11509);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11188', 11182);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11189', 11280);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11189', 11435);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11189', 11480);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11190', 11443);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11195', 11443);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11199', 11287);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11205', 11221);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11205', 11437);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11205', 11446);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11211', 11427);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11211', 11500);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11213', 11339);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11213', 11497);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11217', 11394);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11217', 11399);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11224', 11120);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11224', 11499);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11225', 11116);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11225', 11464);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11229', 11496);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11230', 11346);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11230', 11507);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11231', 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11231', 11424);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11232', 11289);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11235', 11478);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11236', 11255);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11237', 11316);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11237', 11382);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11240', 3);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11240', 11319);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11244', 11491);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11252', 11473);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11254', 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11254', 11290);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11258', 11367);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11260', 11464);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11264', 11176);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11264', 11459);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11268', 11139);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11268', 11292);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11268', 11422);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11278', 11263);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11278', 11325);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11279', 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11279', 11435);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11280', 11232);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11285', 11498);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11293', 11239);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11297', 11489);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11299', 11421);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11303', 5);
commit;
prompt 100 records committed...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11303', 11278);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11303', 11436);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11307', 11144);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11307', 11259);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11307', 11453);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11308', 11480);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11311', 11216);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11311', 11288);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11312', 11232);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11316', 11414);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11321', 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11321', 11167);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11321', 11329);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11327', 11200);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11327', 11333);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11329', 11172);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11329', 11224);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11329', 11347);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11259);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11437);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11331', 11441);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11335', 11489);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11344', 11306);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11344', 11416);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11349', 11404);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11350', 11327);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11352', 11357);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11353', 11430);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11355', 11495);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11356', 11318);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11357', 11148);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11357', 11424);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11362', 11325);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11140);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11369);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11367', 11474);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11369', 11144);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11372', 11147);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11372', 11489);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11373', 11510);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11374', 11505);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11375', 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11383', 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11383', 11275);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11383', 11450);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11384', 11323);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11384', 11421);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11385', 11483);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11396', 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11396', 11356);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11398', 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11400', 11131);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11402', 11339);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11402', 11378);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11402', 11420);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11403', 11134);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11404', 11471);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11413', 11270);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11421', 11185);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11421', 11308);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11421', 11434);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11430', 11508);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11431', 11111);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11442', 11375);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11443', 11196);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11448', 11358);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 6);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11195);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11269);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11344);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11449', 11370);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11452', 11359);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11452', 11503);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11457', 11219);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11457', 11378);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11460', 11220);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11460', 11242);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11460', 11358);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11463', 11508);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11465', 11385);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11473', 11163);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11481', 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11484', 11209);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11489', 11118);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11490', 11140);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11492', 11187);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11492', 11494);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11496', 11283);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11496', 11390);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11497', 11149);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11498', 11332);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11499', 11508);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11502', 11183);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11502', 11329);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11504', 11198);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11506', 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11506', 11247);
commit;
prompt 200 records committed...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('11508', 11373);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('2', 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('2', 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('2', 11463);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('3', 3);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('3', 11343);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('4', 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('5', 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('6', 6);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('6', 11316);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('6', 11383);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('7', 7);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('7', 11392);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('8', 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values ('9', 9);
commit;
prompt 215 records loaded
prompt Loading MEDIC...
insert into MEDIC (seniority, volunteer_id)
values (5, '1');
insert into MEDIC (seniority, volunteer_id)
values (4, '2');
insert into MEDIC (seniority, volunteer_id)
values (3, '3');
insert into MEDIC (seniority, volunteer_id)
values (2, '4');
insert into MEDIC (seniority, volunteer_id)
values (1, '5');
insert into MEDIC (seniority, volunteer_id)
values (6, '6');
insert into MEDIC (seniority, volunteer_id)
values (7, '7');
insert into MEDIC (seniority, volunteer_id)
values (8, '8');
insert into MEDIC (seniority, volunteer_id)
values (9, '9');
insert into MEDIC (seniority, volunteer_id)
values (10, '10');
insert into MEDIC (seniority, volunteer_id)
values (7, '11432');
insert into MEDIC (seniority, volunteer_id)
values (9, '11220');
insert into MEDIC (seniority, volunteer_id)
values (9, '11274');
insert into MEDIC (seniority, volunteer_id)
values (3, '11385');
insert into MEDIC (seniority, volunteer_id)
values (3, '11221');
insert into MEDIC (seniority, volunteer_id)
values (9, '11131');
insert into MEDIC (seniority, volunteer_id)
values (5, '11320');
insert into MEDIC (seniority, volunteer_id)
values (2, '11350');
insert into MEDIC (seniority, volunteer_id)
values (6, '11488');
insert into MEDIC (seniority, volunteer_id)
values (2, '11425');
insert into MEDIC (seniority, volunteer_id)
values (3, '11273');
insert into MEDIC (seniority, volunteer_id)
values (7, '11490');
insert into MEDIC (seniority, volunteer_id)
values (6, '11206');
insert into MEDIC (seniority, volunteer_id)
values (8, '11286');
insert into MEDIC (seniority, volunteer_id)
values (6, '11301');
insert into MEDIC (seniority, volunteer_id)
values (9, '11228');
insert into MEDIC (seniority, volunteer_id)
values (4, '11342');
insert into MEDIC (seniority, volunteer_id)
values (2, '11184');
insert into MEDIC (seniority, volunteer_id)
values (6, '11165');
insert into MEDIC (seniority, volunteer_id)
values (6, '11146');
insert into MEDIC (seniority, volunteer_id)
values (5, '11291');
insert into MEDIC (seniority, volunteer_id)
values (8, '11138');
insert into MEDIC (seniority, volunteer_id)
values (9, '11485');
insert into MEDIC (seniority, volunteer_id)
values (3, '11464');
insert into MEDIC (seniority, volunteer_id)
values (9, '11493');
insert into MEDIC (seniority, volunteer_id)
values (5, '11258');
insert into MEDIC (seniority, volunteer_id)
values (3, '11346');
insert into MEDIC (seniority, volunteer_id)
values (1, '11159');
insert into MEDIC (seniority, volunteer_id)
values (8, '11150');
insert into MEDIC (seniority, volunteer_id)
values (7, '11292');
insert into MEDIC (seniority, volunteer_id)
values (2, '11256');
insert into MEDIC (seniority, volunteer_id)
values (9, '11423');
insert into MEDIC (seniority, volunteer_id)
values (1, '11297');
insert into MEDIC (seniority, volunteer_id)
values (8, '11212');
insert into MEDIC (seniority, volunteer_id)
values (2, '11140');
insert into MEDIC (seniority, volunteer_id)
values (8, '11347');
insert into MEDIC (seniority, volunteer_id)
values (1, '11257');
insert into MEDIC (seniority, volunteer_id)
values (6, '11246');
insert into MEDIC (seniority, volunteer_id)
values (7, '11394');
insert into MEDIC (seniority, volunteer_id)
values (6, '11185');
insert into MEDIC (seniority, volunteer_id)
values (7, '11324');
insert into MEDIC (seniority, volunteer_id)
values (6, '11263');
insert into MEDIC (seniority, volunteer_id)
values (1, '11259');
insert into MEDIC (seniority, volunteer_id)
values (5, '11251');
insert into MEDIC (seniority, volunteer_id)
values (3, '11447');
insert into MEDIC (seniority, volunteer_id)
values (9, '11229');
insert into MEDIC (seniority, volunteer_id)
values (8, '11203');
insert into MEDIC (seniority, volunteer_id)
values (9, '11458');
insert into MEDIC (seniority, volunteer_id)
values (5, '11113');
insert into MEDIC (seniority, volunteer_id)
values (9, '11118');
insert into MEDIC (seniority, volunteer_id)
values (2, '11198');
insert into MEDIC (seniority, volunteer_id)
values (9, '11442');
insert into MEDIC (seniority, volunteer_id)
values (5, '11382');
insert into MEDIC (seniority, volunteer_id)
values (4, '11484');
insert into MEDIC (seniority, volunteer_id)
values (4, '11374');
insert into MEDIC (seniority, volunteer_id)
values (1, '11145');
insert into MEDIC (seniority, volunteer_id)
values (2, '11300');
insert into MEDIC (seniority, volunteer_id)
values (7, '11126');
insert into MEDIC (seniority, volunteer_id)
values (6, '11232');
insert into MEDIC (seniority, volunteer_id)
values (5, '11141');
insert into MEDIC (seniority, volunteer_id)
values (1, '11182');
insert into MEDIC (seniority, volunteer_id)
values (8, '11270');
insert into MEDIC (seniority, volunteer_id)
values (5, '11132');
insert into MEDIC (seniority, volunteer_id)
values (6, '11469');
insert into MEDIC (seniority, volunteer_id)
values (6, '11139');
insert into MEDIC (seniority, volunteer_id)
values (9, '11483');
insert into MEDIC (seniority, volunteer_id)
values (4, '11486');
insert into MEDIC (seniority, volunteer_id)
values (1, '11315');
insert into MEDIC (seniority, volunteer_id)
values (4, '11175');
insert into MEDIC (seniority, volunteer_id)
values (5, '11381');
insert into MEDIC (seniority, volunteer_id)
values (4, '11451');
insert into MEDIC (seniority, volunteer_id)
values (4, '11252');
insert into MEDIC (seniority, volunteer_id)
values (9, '11124');
insert into MEDIC (seniority, volunteer_id)
values (7, '11306');
insert into MEDIC (seniority, volunteer_id)
values (1, '11412');
insert into MEDIC (seniority, volunteer_id)
values (3, '11197');
insert into MEDIC (seniority, volunteer_id)
values (6, '11116');
insert into MEDIC (seniority, volunteer_id)
values (6, '11314');
insert into MEDIC (seniority, volunteer_id)
values (4, '11402');
insert into MEDIC (seniority, volunteer_id)
values (3, '11400');
insert into MEDIC (seniority, volunteer_id)
values (6, '11503');
insert into MEDIC (seniority, volunteer_id)
values (8, '11233');
insert into MEDIC (seniority, volunteer_id)
values (1, '11217');
insert into MEDIC (seniority, volunteer_id)
values (6, '11470');
insert into MEDIC (seniority, volunteer_id)
values (3, '11456');
insert into MEDIC (seniority, volunteer_id)
values (9, '11194');
insert into MEDIC (seniority, volunteer_id)
values (4, '11144');
insert into MEDIC (seniority, volunteer_id)
values (1, '11368');
insert into MEDIC (seniority, volunteer_id)
values (4, '11336');
insert into MEDIC (seniority, volunteer_id)
values (9, '11472');
commit;
prompt 100 records committed...
insert into MEDIC (seniority, volunteer_id)
values (6, '11281');
insert into MEDIC (seniority, volunteer_id)
values (3, '11355');
insert into MEDIC (seniority, volunteer_id)
values (1, '11283');
insert into MEDIC (seniority, volunteer_id)
values (9, '11151');
insert into MEDIC (seniority, volunteer_id)
values (2, '11326');
insert into MEDIC (seniority, volunteer_id)
values (8, '11168');
insert into MEDIC (seniority, volunteer_id)
values (6, '11417');
insert into MEDIC (seniority, volunteer_id)
values (6, '11351');
insert into MEDIC (seniority, volunteer_id)
values (4, '11137');
insert into MEDIC (seniority, volunteer_id)
values (7, '11237');
insert into MEDIC (seniority, volunteer_id)
values (5, '11170');
insert into MEDIC (seniority, volunteer_id)
values (2, '11290');
insert into MEDIC (seniority, volunteer_id)
values (3, '11462');
insert into MEDIC (seniority, volunteer_id)
values (8, '11253');
insert into MEDIC (seniority, volunteer_id)
values (3, '11195');
insert into MEDIC (seniority, volunteer_id)
values (4, '11325');
insert into MEDIC (seniority, volunteer_id)
values (2, '11343');
insert into MEDIC (seniority, volunteer_id)
values (5, '11201');
insert into MEDIC (seniority, volunteer_id)
values (7, '11479');
insert into MEDIC (seniority, volunteer_id)
values (3, '11396');
insert into MEDIC (seniority, volunteer_id)
values (2, '11262');
insert into MEDIC (seniority, volunteer_id)
values (8, '11455');
insert into MEDIC (seniority, volunteer_id)
values (3, '11386');
insert into MEDIC (seniority, volunteer_id)
values (7, '11436');
insert into MEDIC (seniority, volunteer_id)
values (6, '11353');
insert into MEDIC (seniority, volunteer_id)
values (5, '11234');
insert into MEDIC (seniority, volunteer_id)
values (9, '11505');
insert into MEDIC (seniority, volunteer_id)
values (6, '11305');
insert into MEDIC (seniority, volunteer_id)
values (3, '11171');
insert into MEDIC (seniority, volunteer_id)
values (3, '11334');
insert into MEDIC (seniority, volunteer_id)
values (5, '11463');
insert into MEDIC (seniority, volunteer_id)
values (6, '11218');
insert into MEDIC (seniority, volunteer_id)
values (2, '11238');
insert into MEDIC (seniority, volunteer_id)
values (3, '11331');
insert into MEDIC (seniority, volunteer_id)
values (1, '11441');
insert into MEDIC (seniority, volunteer_id)
values (4, '11117');
insert into MEDIC (seniority, volunteer_id)
values (2, '11507');
insert into MEDIC (seniority, volunteer_id)
values (8, '11208');
insert into MEDIC (seniority, volunteer_id)
values (3, '11200');
insert into MEDIC (seniority, volunteer_id)
values (8, '11426');
insert into MEDIC (seniority, volunteer_id)
values (3, '11178');
insert into MEDIC (seniority, volunteer_id)
values (4, '11420');
insert into MEDIC (seniority, volunteer_id)
values (7, '11275');
insert into MEDIC (seniority, volunteer_id)
values (2, '11176');
insert into MEDIC (seniority, volunteer_id)
values (4, '11424');
insert into MEDIC (seniority, volunteer_id)
values (3, '11495');
insert into MEDIC (seniority, volunteer_id)
values (5, '11276');
insert into MEDIC (seniority, volunteer_id)
values (8, '11431');
insert into MEDIC (seniority, volunteer_id)
values (7, '11202');
insert into MEDIC (seniority, volunteer_id)
values (7, '11356');
insert into MEDIC (seniority, volunteer_id)
values (9, '11111');
insert into MEDIC (seniority, volunteer_id)
values (6, '11502');
insert into MEDIC (seniority, volunteer_id)
values (7, '11480');
insert into MEDIC (seniority, volunteer_id)
values (5, '11365');
insert into MEDIC (seniority, volunteer_id)
values (4, '11475');
insert into MEDIC (seniority, volunteer_id)
values (7, '11322');
insert into MEDIC (seniority, volunteer_id)
values (8, '11358');
insert into MEDIC (seniority, volunteer_id)
values (5, '11446');
insert into MEDIC (seniority, volunteer_id)
values (9, '11143');
insert into MEDIC (seniority, volunteer_id)
values (4, '11395');
insert into MEDIC (seniority, volunteer_id)
values (3, '11186');
insert into MEDIC (seniority, volunteer_id)
values (2, '11448');
insert into MEDIC (seniority, volunteer_id)
values (1, '11162');
commit;
prompt 163 records loaded
prompt Loading MADICINSHIFT...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (1, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (1, '11462');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (2, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (3, '3');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (4, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (5, '5');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, '11185');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, '6');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (7, '7');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (8, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (8, '8');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (9, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (10, '10');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11, '10');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (12, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (12, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (13, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (13, '11150');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (13, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11111, '11423');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11116, '11220');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11118, '11483');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11119, '11259');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11120, '11246');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11130, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11137, '11292');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11138, '11218');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11140, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11143, '11257');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11146, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11148, '11233');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11150, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11153, '11502');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11156, '11301');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11161, '11185');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11163, '11111');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11163, '11365');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11167, '11464');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11170, '11170');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11172, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11174, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11180, '11150');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11180, '11290');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11181, '11111');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11181, '11281');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11181, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11182, '11368');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11185, '11446');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11185, '11488');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11186, '11238');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11187, '11111');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11188, '11253');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11189, '11426');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11190, '11315');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11191, '11292');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11195, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11200, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11204, '11458');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11206, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11210, '11251');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11211, '11336');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11214, '11141');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11217, '11385');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11217, '11485');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11219, '11300');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11219, '11441');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11221, '11336');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11222, '11324');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11225, '11229');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11225, '11234');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11227, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11230, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11232, '8');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11234, '11425');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11235, '11200');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11236, '11456');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11241, '11186');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11245, '11262');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11246, '11305');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11246, '11365');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11249, '11124');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11251, '11505');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11254, '11151');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11257, '11229');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11260, '11228');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11264, '11200');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11264, '11472');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11265, '11132');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11266, '11368');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11268, '11331');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11269, '11462');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11270, '11503');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11276, '11118');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11277, '11232');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11278, '11252');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11280, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11281, '11116');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11281, '11314');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11282, '11165');
commit;
prompt 100 records committed...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11283, '11137');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11283, '11485');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11285, '11479');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11287, '11343');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11291, '11262');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11292, '11400');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11293, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11301, '11451');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11302, '11270');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11302, '11351');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11302, '11463');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11307, '11228');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11308, '1');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11309, '11351');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11315, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11318, '11118');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11320, '11234');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11320, '11356');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11322, '11132');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11323, '11334');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11325, '11233');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11333, '11263');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11333, '11503');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11333, '11505');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11338, '11178');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11342, '7');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11343, '11131');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11344, '11186');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11346, '11505');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11348, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11348, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11349, '11170');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11350, '11116');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11350, '11281');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11352, '11176');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11354, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11356, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11362, '11400');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11367, '11113');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11368, '11113');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11371, '11195');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11371, '11283');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11378, '11382');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11378, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11379, '11140');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11379, '11162');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11379, '11274');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11380, '11495');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11381, '11197');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11387, '11228');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11387, '11322');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11389, '11206');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11390, '11355');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11393, '11322');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11395, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11395, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11398, '11353');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11399, '11140');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11399, '11275');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11403, '11326');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11405, '11469');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11409, '4');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11410, '11305');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11410, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11411, '11286');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11413, '11458');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11422, '11292');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11425, '11343');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11429, '11507');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11431, '11436');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11431, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11433, '11144');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11434, '3');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11435, '11140');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11436, '11324');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11437, '11446');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11438, '11144');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11438, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11439, '11286');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11440, '11336');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11441, '11178');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11131');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11200');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11203');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11445, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11446, '7');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11448, '11150');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11449, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11450, '11290');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11450, '9');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11455, '11386');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11456, '11221');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11456, '11480');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11458, '11217');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11458, '11270');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11458, '11324');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11460, '11480');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11463, '11306');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11473, '11165');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11474, '11485');
commit;
prompt 200 records committed...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11475, '11314');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11479, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11480, '11117');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11480, '11221');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11481, '11117');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11481, '11426');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11486, '11493');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11490, '11144');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11500, '11273');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11501, '11257');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11503, '11145');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11503, '11343');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11504, '11297');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11504, '11420');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11506, '11402');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11509, '11257');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11511, '2');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11511, '3');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11512, '11275');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11512, '11355');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11513, '11246');
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11513, '11488');
commit;
prompt 222 records loaded
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C008884;
prompt Enabling foreign key constraints for SHIFT...
alter table SHIFT enable constraint SYS_C008904;
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint SYS_C008911;
prompt Enabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT enable constraint SYS_C008915;
alter table AMBUTOEVENT enable constraint SYS_C008916;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C008888;
prompt Enabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable constraint SYS_C008925;
alter table DRIVERINSHIFT enable constraint SYS_C008926;
prompt Enabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable constraint SYS_C008896;
alter table DRIVERTOAMBU enable constraint SYS_C008897;
prompt Enabling foreign key constraints for MEDIC...
alter table MEDIC enable constraint SYS_C008892;
prompt Enabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT enable constraint SYS_C008920;
alter table MADICINSHIFT enable constraint SYS_C008921;
prompt Enabling triggers for AMBULANS...
alter table AMBULANS enable all triggers;
prompt Enabling triggers for VOLUNTEER...
alter table VOLUNTEER enable all triggers;
prompt Enabling triggers for PARAMEDIC...
alter table PARAMEDIC enable all triggers;
prompt Enabling triggers for SHIFT...
alter table SHIFT enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable all triggers;
prompt Enabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable all triggers;
prompt Enabling triggers for MEDIC...
alter table MEDIC enable all triggers;
prompt Enabling triggers for MADICINSHIFT...
alter table MADICINSHIFT enable all triggers;
set feedback on
set define on
prompt Done.
