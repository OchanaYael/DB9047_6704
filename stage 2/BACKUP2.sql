prompt PL/SQL Developer import file
prompt Created on יום רביעי 12 יוני 2024 by חני סקורי
set feedback off
set define off
prompt Creating AMBULANS...
create table AMBULANS
(
  locaation    VARCHAR2(15) not null,
  ambulance_id INTEGER not null,
  ambulancenum INTEGER not null,
  tipe         VARCHAR2(10) not null,
  status       VARCHAR2(15) default 'Available' not null
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

prompt Creating EVENT...
create table EVENT
(
  event_id     INTEGER not null,
  deescription VARCHAR2(40) not null,
  locaation    VARCHAR2(25) not null,
  date_time    DATE not null
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

prompt Creating VOLUNTEER...
create table VOLUNTEER
(
  volunteer_id INTEGER not null,
  naame        VARCHAR2(20) not null,
  phonnum      INTEGER not null,
  address      VARCHAR2(40) not null,
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

prompt Creating DRIVER...
create table DRIVER
(
  licensenum   INTEGER not null,
  volunteer_id INTEGER not null
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

prompt Creating PARAMEDIC...
create table PARAMEDIC
(
  medical_degree VARCHAR2(25) not null,
  seniority      INTEGER not null,
  volunteer_id   INTEGER not null
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
  event_id     INTEGER not null,
  volunteer_id INTEGER not null
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
  add foreign key (EVENT_ID)
  references EVENT (EVENT_ID);
alter table SHIFT
  add foreign key (VOLUNTEER_ID)
  references PARAMEDIC (VOLUNTEER_ID);
alter table SHIFT
  add constraint CHK_SHIFT_START_END
  check (StartTime <> EndTime);

prompt Creating DRIVERINSHIFT...
create table DRIVERINSHIFT
(
  volunteer_id INTEGER not null,
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
  volunteer_id INTEGER not null,
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
  volunteer_id INTEGER not null
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
  volunteer_id INTEGER not null
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

prompt Creating SCHEDULER$_PROGRAM...
create table SCHEDULER$_PROGRAM
(
  obj#             NUMBER not null,
  action           VARCHAR2(4000),
  number_of_args   NUMBER,
  comments         VARCHAR2(240),
  flags            NUMBER,
  schedule_limit   INTERVAL DAY(3) TO SECOND(0),
  priority         NUMBER,
  job_weight       NUMBER,
  max_runs         NUMBER,
  max_failures     NUMBER,
  max_run_duration INTERVAL DAY(3) TO SECOND(0),
  nls_env          VARCHAR2(4000),
  env              RAW(32),
  run_count        NUMBER
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
alter table SCHEDULER$_PROGRAM
  add constraint SCHEDULER$_PROGRAM_PK primary key (OBJ#)
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

prompt Disabling triggers for AMBULANS...
alter table AMBULANS disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT disable all triggers;
prompt Disabling triggers for VOLUNTEER...
alter table VOLUNTEER disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for PARAMEDIC...
alter table PARAMEDIC disable all triggers;
prompt Disabling triggers for SHIFT...
alter table SHIFT disable all triggers;
prompt Disabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable all triggers;
prompt Disabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable all triggers;
prompt Disabling triggers for MEDIC...
alter table MEDIC disable all triggers;
prompt Disabling triggers for MADICINSHIFT...
alter table MADICINSHIFT disable all triggers;
prompt Disabling triggers for SCHEDULER$_PROGRAM...
alter table SCHEDULER$_PROGRAM disable all triggers;
prompt Disabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT disable constraint SYS_C008537;
alter table AMBUTOEVENT disable constraint SYS_C008538;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C008524;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C008520;
prompt Disabling foreign key constraints for SHIFT...
alter table SHIFT disable constraint SYS_C008546;
alter table SHIFT disable constraint SYS_C008547;
prompt Disabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable constraint SYS_C008556;
alter table DRIVERINSHIFT disable constraint SYS_C008557;
prompt Disabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable constraint SYS_C008532;
alter table DRIVERTOAMBU disable constraint SYS_C008533;
prompt Disabling foreign key constraints for MEDIC...
alter table MEDIC disable constraint SYS_C008528;
prompt Disabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT disable constraint SYS_C008551;
alter table MADICINSHIFT disable constraint SYS_C008552;
prompt Deleting SCHEDULER$_PROGRAM...
delete from SCHEDULER$_PROGRAM;
commit;
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
prompt Deleting SHIFT...
delete from SHIFT;
commit;
prompt Deleting PARAMEDIC...
delete from PARAMEDIC;
commit;
prompt Deleting DRIVER...
delete from DRIVER;
commit;
prompt Deleting VOLUNTEER...
delete from VOLUNTEER;
commit;
prompt Deleting AMBUTOEVENT...
delete from AMBUTOEVENT;
commit;
prompt Deleting EVENT...
delete from EVENT;
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
values ('Olsztyn', 11111, 111, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pomona', 11112, 112, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Burwood East', 11113, 113, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 11114, 114, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Harsum', 11115, 115, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Flushing', 11116, 116, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Quיbec', 11117, 117, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Echirolles', 11118, 118, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mechanicsburg', 11119, 119, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Williamstown', 11120, 120, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fort McMurray', 11121, 121, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Seoul', 11122, 122, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Douala', 11123, 123, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mayfield Villag', 11124, 124, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Calgary', 11125, 125, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Potsdam', 11126, 126, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sendai', 11127, 127, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pandrup', 11128, 128, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Burwood East', 11129, 129, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bern', 11130, 130, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Milton Keynes', 11131, 131, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Koppl', 11132, 132, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Glenshaw', 11133, 133, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Englewood Cliff', 11134, 134, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Morioka', 11135, 135, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Breda', 11136, 136, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wavre', 11137, 137, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rockland', 11138, 138, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gummersbach', 11139, 139, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kרbenhavn', 11140, 140, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kaiserslautern', 11141, 141, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Regina', 11142, 142, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lucca', 11143, 143, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hillerרd', 11144, 144, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('St-laurent', 11145, 145, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Joinville', 11146, 146, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laredo', 11147, 147, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Baarn', 11148, 148, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oslo', 11149, 149, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Clark', 11150, 150, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Akron', 11151, 151, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ismaning', 11152, 152, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Delafield', 11153, 153, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toyama', 11154, 154, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sao caetano do ', 11155, 155, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pulheim-brauwei', 11156, 156, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Longueuil', 11157, 157, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Laurel', 11158, 158, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Roma', 11159, 159, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rockland', 11160, 160, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Belgrad', 11161, 161, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Des Plaines', 11162, 162, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ithaca', 11163, 163, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waterloo', 11164, 164, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valladolid', 11165, 165, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('S. Bernardo do ', 11166, 166, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ternitz', 11167, 167, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Akron', 11168, 168, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toledo', 11169, 169, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barueri', 11170, 170, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Swannanoa', 11171, 171, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Riverdale', 11172, 172, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa Clarita', 11173, 173, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Athens', 11174, 174, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stony Point', 11175, 175, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Istanbul', 11176, 176, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mogliano Veneto', 11177, 177, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Araras', 11178, 178, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Juazeiro', 11179, 179, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brussel', 11180, 180, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pasadena', 11181, 181, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('New Hyde Park', 11182, 182, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Spring City', 11183, 183, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tadley', 11184, 184, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tokushima', 11185, 185, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Blue bell', 11186, 186, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Saint-vincent-d', 11187, 187, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Freising', 11188, 188, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tsu', 11189, 189, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Saint-vincent-d', 11190, 190, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Unionville', 11191, 191, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Daejeon', 11192, 192, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pecs', 11193, 193, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waalwijk', 11194, 194, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cardiff', 11195, 195, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thalwil', 11196, 196, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nordhausen', 11197, 197, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Aiken', 11198, 198, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('New Delhi', 11199, 199, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lyngby', 11200, 200, 'Van', 'notavailable');
commit;
prompt 100 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mariano Comense', 11201, 201, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Thצrishaus', 11202, 202, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('St Leonards', 11203, 203, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barksdale afb', 11204, 204, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bay Shore', 11205, 205, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lexington', 11206, 206, 'motorcycle', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oakland', 11207, 207, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dublin', 11208, 208, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Velizy Villacou', 11209, 209, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('High Wycombe', 11210, 210, 'Van', 'available');
commit;
prompt 110 records loaded
prompt Loading EVENT...
insert into EVENT (event_id, deescription, locaation, date_time)
values (1, 'Birth', 'Tel Aviv', to_date('01-01-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (2, 'Burn', 'Jerusalem', to_date('01-02-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (3, 'Shooting Attack', 'Haifa', to_date('01-03-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (4, 'Car Accident', 'Beersheba', to_date('01-04-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (5, 'Heart Attack', 'Rishon LeZion', to_date('01-05-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (6, 'Stroke', 'Petah Tikva', to_date('01-06-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (7, 'Drowning', 'Ashdod', to_date('01-07-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (8, 'Electrocution', 'Netanya', to_date('01-08-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (9, 'Fall Injury', 'Holon', to_date('01-09-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (10, 'Poisoning', 'Bnei Brak', to_date('01-10-2024', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11111, 'Fall Injury', 'Horsham', to_date('14-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11112, 'Fall Injury', 'Germantown', to_date('02-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11113, 'Car Accident', 'Silverdale', to_date('01-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11114, 'Shooting Attack', 'Lake Forest', to_date('28-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11115, 'Poisoning', 'Rosemead', to_date('11-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11116, 'Poisoning', 'Claymont', to_date('22-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11117, 'Car Accident', 'Tallahassee', to_date('29-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11118, 'Car Accident', 'Hannover', to_date('29-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11119, 'Birth', 'Changwon-si', to_date('25-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11120, 'Poisoning', 'Riverdale', to_date('21-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11121, 'Car Accident', 'Tהby', to_date('25-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11122, 'Poisoning', 'Oslo', to_date('15-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11123, 'Shooting Attack', 'Mantova', to_date('11-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11124, 'Birth', 'Richmond Hill', to_date('08-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11125, 'Poisoning', 'Ludbreg', to_date('07-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11126, 'Birth', 'Brno', to_date('30-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11127, 'Burn', 'Braintree', to_date('09-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11128, 'Birth', 'Visselhצvede', to_date('18-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11129, 'Car Accident', 'Steyr', to_date('14-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11130, 'Car Accident', 'Salvador', to_date('03-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11131, 'Birth', 'Biella', to_date('09-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11132, 'Burn', 'Dartmouth', to_date('08-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11133, 'Burn', 'Johor Bahru', to_date('17-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11134, 'Burn', 'Cambridge', to_date('04-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11135, 'Birth', 'Vanderbijlpark', to_date('16-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11136, 'Shooting Attack', 'Bremen', to_date('29-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11137, 'Birth', 'Kyoto', to_date('03-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11138, 'Car Accident', 'Abbotsford', to_date('17-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11139, 'Poisoning', 'Market Harborough', to_date('11-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11140, 'Burn', 'Rome', to_date('16-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11141, 'Shooting Attack', 'Market Harborough', to_date('24-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11142, 'Shooting Attack', 'Belo Horizonte', to_date('31-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11143, 'Car Accident', 'Lublin', to_date('28-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11144, 'Burn', 'Adelaide', to_date('23-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11145, 'Car Accident', 'Kista', to_date('15-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11146, 'Car Accident', 'Albany', to_date('03-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11147, 'Fall Injury', 'Royersford', to_date('28-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11148, 'Burn', 'Irving', to_date('28-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11149, 'Car Accident', 'Nagano', to_date('29-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11150, 'Car Accident', 'Hochwald', to_date('22-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11151, 'Poisoning', 'Turku', to_date('29-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11152, 'Fall Injury', 'Warrenton', to_date('20-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11153, 'Birth', 'Aomori', to_date('12-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11154, 'Car Accident', 'Birkenhead', to_date('09-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11155, 'Birth', 'L''union', to_date('08-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11156, 'Shooting Attack', 'Nagano', to_date('04-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11157, 'Poisoning', 'Akita', to_date('13-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11158, 'Fall Injury', 'Leinfelden-Echterdin', to_date('25-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11159, 'Car Accident', 'Milwaukee', to_date('22-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11160, 'Shooting Attack', 'Rockland', to_date('16-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11161, 'Shooting Attack', 'Kejae City', to_date('02-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11162, 'Poisoning', 'Oslo', to_date('24-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11163, 'Car Accident', 'Double Oak', to_date('06-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11164, 'Fall Injury', 'Olsztyn', to_date('07-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11165, 'Shooting Attack', 'Westfield', to_date('20-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11166, 'Car Accident', 'Redmond', to_date('21-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11167, 'Shooting Attack', 'Cambridge', to_date('05-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11168, 'Car Accident', 'Leipzig', to_date('22-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11169, 'Poisoning', 'Johor Bahru', to_date('16-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11170, 'Car Accident', 'Okayama', to_date('22-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11171, 'Birth', 'Lehi', to_date('14-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11172, 'Birth', 'Drogenbos', to_date('24-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11173, 'Burn', 'Redwood City', to_date('11-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11174, 'Poisoning', 'San Jose', to_date('28-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11175, 'Burn', 'Ebersdorf', to_date('10-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11176, 'Shooting Attack', 'Coquitlam', to_date('26-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11177, 'Shooting Attack', 'Silverdale', to_date('19-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11178, 'Fall Injury', 'Aracruz', to_date('30-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11179, 'Car Accident', 'Cedar Park', to_date('08-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11180, 'Birth', 'Sapporo', to_date('29-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11181, 'Burn', 'Williamstown', to_date('14-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11182, 'Fall Injury', 'North Sydney', to_date('04-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11183, 'Car Accident', 'Orleans', to_date('07-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11184, 'Shooting Attack', 'Hochwald', to_date('10-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11185, 'Fall Injury', 'Rtp', to_date('25-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11186, 'Car Accident', 'Mumbai', to_date('11-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11187, 'Poisoning', 'King of Prussia', to_date('02-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11188, 'Car Accident', 'Seoul', to_date('06-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11189, 'Fall Injury', 'Sihung-si', to_date('14-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11190, 'Poisoning', 'Lowell', to_date('02-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11191, 'Shooting Attack', 'Salem', to_date('19-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11192, 'Burn', 'Friedrichshafe', to_date('18-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11193, 'Car Accident', 'New Hope', to_date('06-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11194, 'Fall Injury', 'Oppenheim', to_date('10-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11195, 'Shooting Attack', 'Richmond', to_date('18-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11196, 'Car Accident', 'Richmond Hill', to_date('12-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11197, 'Car Accident', 'North Sydney', to_date('06-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11198, 'Fall Injury', 'Harahan', to_date('28-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11199, 'Shooting Attack', 'New Fairfield', to_date('06-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11200, 'Shooting Attack', 'Farmington Hills', to_date('06-01-2020', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into EVENT (event_id, deescription, locaation, date_time)
values (11201, 'Shooting Attack', 'Whitehouse Station', to_date('26-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11202, 'Fall Injury', 'Den Haag', to_date('08-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11203, 'Birth', 'Durham', to_date('17-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11204, 'Burn', 'Cleveland', to_date('22-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11205, 'Poisoning', 'Tadley', to_date('10-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11206, 'Car Accident', 'Valencia', to_date('09-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11207, 'Fall Injury', 'Limeira', to_date('15-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11208, 'Burn', 'Harrisburg', to_date('23-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11209, 'Car Accident', 'Stoneham', to_date('13-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11210, 'Car Accident', 'Hamburg', to_date('04-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11211, 'Burn', 'Pearland', to_date('04-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11212, 'Car Accident', 'Nuernberg', to_date('10-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11213, 'Car Accident', 'London', to_date('27-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11214, 'Car Accident', 'Bartlett', to_date('05-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11215, 'Burn', 'Kongserbg', to_date('07-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11216, 'Car Accident', 'Duluth', to_date('16-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11217, 'Fall Injury', 'Lathrop', to_date('21-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11218, 'Poisoning', 'Varzea grande', to_date('05-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11219, 'Poisoning', 'Lyngby', to_date('03-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11220, 'Poisoning', 'Giessen', to_date('09-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11221, 'Fall Injury', 'Sale', to_date('04-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11222, 'Car Accident', 'Portland', to_date('12-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11223, 'Burn', 'Arlington', to_date('18-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11224, 'Shooting Attack', 'Slmea', to_date('07-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11225, 'Car Accident', 'Sao caetano do sul', to_date('23-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11226, 'Birth', 'Frankfurt am Main', to_date('07-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11227, 'Poisoning', 'Livermore', to_date('30-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11228, 'Poisoning', 'Redwood City', to_date('19-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11229, 'Poisoning', 'Yomgok-dong', to_date('29-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11230, 'Shooting Attack', 'Uetikon am See', to_date('02-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11231, 'Birth', 'Brugherio', to_date('03-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11232, 'Fall Injury', 'Oak park', to_date('28-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11233, 'Poisoning', 'Richmond', to_date('02-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11234, 'Burn', 'Reno', to_date('25-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11235, 'Poisoning', 'Haverhill', to_date('04-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11236, 'Fall Injury', 'Aurora', to_date('29-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11237, 'Car Accident', 'Oulu', to_date('17-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11238, 'Shooting Attack', 'Pitstone', to_date('16-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11239, 'Birth', 'Okayama', to_date('18-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11240, 'Car Accident', 'California', to_date('15-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11241, 'Car Accident', 'Calcutta', to_date('12-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11242, 'Poisoning', 'Hjallerup', to_date('28-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11243, 'Birth', 'Annandale', to_date('17-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11244, 'Birth', 'Anchorage', to_date('23-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11245, 'Poisoning', 'Bartlett', to_date('05-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11246, 'Poisoning', 'Aurora', to_date('09-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11247, 'Car Accident', 'Immenstaad', to_date('05-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11248, 'Fall Injury', 'Coventry', to_date('27-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11249, 'Burn', 'La Plata', to_date('23-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11250, 'Car Accident', 'Cherepovets', to_date('24-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11251, 'Fall Injury', 'Derwood', to_date('16-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11252, 'Poisoning', 'Princeton', to_date('04-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11253, 'Shooting Attack', 'Bend', to_date('17-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11254, 'Birth', 'Akita', to_date('22-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11255, 'Car Accident', 'Fredericia', to_date('25-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11256, 'Burn', 'Lake Forest', to_date('26-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11257, 'Birth', 'Vienna', to_date('19-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11258, 'Car Accident', 'Montrיal', to_date('11-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11259, 'Shooting Attack', 'Gainesville', to_date('13-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11260, 'Poisoning', 'Ebersdorf', to_date('26-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11261, 'Birth', 'Mexico City', to_date('24-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11262, 'Burn', 'Rochester', to_date('04-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11263, 'Burn', 'Richmond Hill', to_date('02-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11264, 'Birth', 'Lexington', to_date('15-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11265, 'Birth', 'Charlottesville', to_date('02-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11266, 'Car Accident', 'Zurich', to_date('22-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11267, 'Burn', 'Luedenscheid', to_date('28-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11268, 'Car Accident', 'Winnipeg', to_date('30-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11269, 'Poisoning', 'Des Plaines', to_date('15-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11270, 'Burn', 'Kyunnam', to_date('25-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11271, 'Car Accident', 'Murray', to_date('21-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11272, 'Car Accident', 'North Yorkshire', to_date('05-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11273, 'Fall Injury', 'Saudarkrokur', to_date('23-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11274, 'Shooting Attack', 'Billund', to_date('09-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11275, 'Shooting Attack', 'Taoyuan', to_date('09-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11276, 'Shooting Attack', 'Bretzfeld-Waldbach', to_date('19-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11277, 'Birth', 'Bruxelles', to_date('13-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11278, 'Car Accident', 'Halfway house', to_date('04-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11279, 'Poisoning', 'Rocklin', to_date('06-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11280, 'Poisoning', 'Barueri', to_date('14-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11281, 'Car Accident', 'Aiken', to_date('15-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11282, 'Burn', 'Warrenton', to_date('26-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11283, 'Birth', 'Yogyakarta', to_date('13-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11284, 'Poisoning', 'El Segundo', to_date('03-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11285, 'Car Accident', 'Darmstadt', to_date('05-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11286, 'Fall Injury', 'Regensburg', to_date('24-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11287, 'Fall Injury', 'Munich', to_date('24-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11288, 'Poisoning', 'Chorzףw', to_date('27-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11289, 'Birth', 'Laredo', to_date('22-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11290, 'Birth', 'Sacramento', to_date('08-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11291, 'Birth', 'Pomona', to_date('16-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11292, 'Fall Injury', 'Waltham', to_date('24-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11293, 'Burn', 'Oxford', to_date('17-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11294, 'Fall Injury', 'Billund', to_date('10-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11295, 'Fall Injury', 'Bremen', to_date('15-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11296, 'Fall Injury', 'Stuttgart', to_date('13-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11297, 'Shooting Attack', 'Charlottesville', to_date('06-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11298, 'Burn', 'Slmea', to_date('11-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11299, 'Fall Injury', 'Storrington', to_date('09-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11300, 'Poisoning', 'Utsunomiya', to_date('26-10-2020', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into EVENT (event_id, deescription, locaation, date_time)
values (11301, 'Car Accident', 'Bרnes', to_date('22-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11302, 'Car Accident', 'Dortmund', to_date('17-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11303, 'Shooting Attack', 'Milan', to_date('02-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11304, 'Birth', 'Monmouth', to_date('10-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11305, 'Poisoning', 'Hartford', to_date('03-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11306, 'Fall Injury', 'Gauteng', to_date('08-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11307, 'Burn', 'Loveland', to_date('30-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11308, 'Car Accident', 'Ismaning', to_date('22-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11309, 'Car Accident', 'Vaduz', to_date('27-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11310, 'Shooting Attack', 'New York City', to_date('22-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11311, 'Car Accident', 'La Plata', to_date('17-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11312, 'Car Accident', 'Sidney', to_date('20-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11313, 'Poisoning', 'Helsinki', to_date('23-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11314, 'Burn', 'The Woodlands', to_date('13-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11315, 'Birth', 'Birmingham', to_date('14-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11316, 'Poisoning', 'Harrisburg', to_date('12-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11317, 'Fall Injury', 'Takapuna', to_date('24-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11318, 'Birth', 'Oldham', to_date('07-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11319, 'Shooting Attack', 'Bretzfeld-Waldbach', to_date('24-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11320, 'Car Accident', 'Oulu', to_date('22-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11321, 'Car Accident', 'Chambersburg', to_date('16-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11322, 'Shooting Attack', 'Daejeon', to_date('04-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11323, 'Poisoning', 'Salisbury', to_date('15-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11324, 'Poisoning', 'Essex', to_date('14-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11325, 'Shooting Attack', 'Giessen', to_date('25-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11326, 'Car Accident', 'Cobham', to_date('03-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11327, 'Burn', 'Huntington', to_date('20-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11328, 'Birth', 'Rosemead', to_date('12-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11329, 'Poisoning', 'Zurich', to_date('07-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11330, 'Burn', 'Takamatsu', to_date('08-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11331, 'Car Accident', 'Shizuoka', to_date('15-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11332, 'Burn', 'Rome', to_date('19-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11333, 'Shooting Attack', 'Protvino', to_date('14-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11334, 'Birth', 'Rheinfelden', to_date('09-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11335, 'Poisoning', 'Tottori', to_date('30-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11336, 'Birth', 'West Launceston', to_date('07-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11337, 'Car Accident', 'Berlin-Adlershof', to_date('05-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11338, 'Poisoning', 'Leverkusen', to_date('08-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11339, 'Car Accident', 'Eden prairie', to_date('19-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11340, 'Fall Injury', 'Mechanicsburg', to_date('04-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11341, 'Car Accident', 'Oslo', to_date('29-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11342, 'Shooting Attack', 'Murray', to_date('30-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11343, 'Birth', 'Vantaa', to_date('14-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11344, 'Shooting Attack', 'Dubai', to_date('01-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11345, 'Shooting Attack', 'Chirignago', to_date('20-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11346, 'Fall Injury', 'Dartmouth', to_date('04-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11347, 'Fall Injury', 'Salt Lake City', to_date('25-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11348, 'Shooting Attack', 'Sorocaba', to_date('07-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11349, 'Car Accident', 'Wehrheim', to_date('19-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11350, 'Car Accident', 'Yokohama', to_date('17-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11351, 'Poisoning', 'Pasadena', to_date('26-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11352, 'Car Accident', 'Karlstad', to_date('14-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11353, 'Car Accident', 'Taoyuan', to_date('28-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11354, 'Car Accident', 'Coslada', to_date('14-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11355, 'Shooting Attack', 'Antwerpen', to_date('14-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11356, 'Birth', 'Juneau', to_date('14-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11357, 'Burn', 'Borger', to_date('18-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11358, 'Burn', 'Appenzell', to_date('28-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11359, 'Poisoning', 'Pacific Grove', to_date('31-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11360, 'Shooting Attack', 'Holts Summit', to_date('18-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11361, 'Car Accident', 'Brampton', to_date('22-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11362, 'Car Accident', 'Bountiful', to_date('07-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11363, 'Fall Injury', 'Varzea grande', to_date('09-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11364, 'Car Accident', 'Fleet', to_date('14-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11365, 'Birth', 'Vantaa', to_date('11-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11366, 'Shooting Attack', 'Torino', to_date('15-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11367, 'Burn', 'Buenos Aires', to_date('10-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11368, 'Birth', 'Chinnor', to_date('11-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11369, 'Poisoning', 'Eden prairie', to_date('03-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11370, 'Burn', 'Kerava', to_date('27-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11371, 'Birth', 'Birkenhead', to_date('17-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11372, 'Burn', 'Webster Groves', to_date('20-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11373, 'Birth', 'Irati', to_date('28-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11374, 'Shooting Attack', 'New York City', to_date('16-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11375, 'Burn', 'Issaquah', to_date('11-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11376, 'Birth', 'Amarillo', to_date('06-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11377, 'Poisoning', 'Akron', to_date('16-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11378, 'Burn', 'Cerritos', to_date('22-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11379, 'Car Accident', 'Dinslaken', to_date('21-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11380, 'Shooting Attack', 'Mito', to_date('27-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11381, 'Shooting Attack', 'Lubbock', to_date('24-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11382, 'Birth', 'West Drayton', to_date('14-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11383, 'Poisoning', 'Naestved', to_date('20-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11384, 'Car Accident', 'Oak park', to_date('21-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11385, 'Birth', 'Campinas', to_date('05-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11386, 'Fall Injury', 'Fornacette', to_date('31-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11387, 'Car Accident', 'Hines', to_date('04-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11388, 'Poisoning', 'Gdansk', to_date('22-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11389, 'Birth', 'Erpe-Mere', to_date('07-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11390, 'Poisoning', 'Lake worth', to_date('03-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11391, 'Burn', 'Valencia', to_date('10-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11392, 'Car Accident', 'Goiania', to_date('04-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11393, 'Birth', 'Newcastle upon Tyne', to_date('10-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11394, 'Shooting Attack', 'Reston', to_date('07-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11395, 'Shooting Attack', 'Lucca', to_date('01-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11396, 'Birth', 'Verdun', to_date('17-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11397, 'Burn', 'Rotterdam', to_date('09-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11398, 'Burn', 'Suberg', to_date('12-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11399, 'Birth', 'Tartu', to_date('23-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11400, 'Birth', 'Seoul', to_date('10-10-2022', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into EVENT (event_id, deescription, locaation, date_time)
values (11401, 'Shooting Attack', 'St. Petersburg', to_date('21-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11402, 'Car Accident', 'Salvador', to_date('29-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11403, 'Fall Injury', 'Maarssen', to_date('17-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11404, 'Poisoning', 'Daejeon', to_date('12-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11405, 'Car Accident', 'Chemnitz', to_date('21-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11406, 'Car Accident', 'Groton', to_date('03-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11407, 'Poisoning', 'Golden', to_date('30-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11408, 'Shooting Attack', 'Huntington', to_date('08-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11409, 'Birth', 'Virginia Beach', to_date('20-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11410, 'Birth', 'Leeds', to_date('09-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11411, 'Burn', 'Irati', to_date('05-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11412, 'Fall Injury', 'Sדo paulo', to_date('21-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11413, 'Fall Injury', 'Menlo Park', to_date('20-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11414, 'Birth', 'Vantaa', to_date('02-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11415, 'Poisoning', 'Szazhalombatta', to_date('24-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11416, 'Birth', 'Kuopio', to_date('20-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11417, 'Fall Injury', 'Flower mound', to_date('11-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11418, 'Car Accident', 'Narrows', to_date('23-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11419, 'Car Accident', 'Boise', to_date('24-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11420, 'Burn', 'Grand Rapids', to_date('31-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11421, 'Car Accident', 'Macau', to_date('21-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11422, 'Poisoning', 'Ribeirao preto', to_date('15-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11423, 'Car Accident', 'Marietta', to_date('28-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11424, 'Poisoning', 'Melrose', to_date('04-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11425, 'Birth', 'Clark', to_date('15-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11426, 'Shooting Attack', 'Ben-Gurion', to_date('29-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11427, 'Shooting Attack', 'Pompeia', to_date('13-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11428, 'Burn', 'Dubai', to_date('21-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11429, 'Birth', 'Agoncillo', to_date('08-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11430, 'Car Accident', 'St-bruno', to_date('05-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11431, 'Car Accident', 'Uetikon am See', to_date('21-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11432, 'Shooting Attack', 'Highlands Ranch', to_date('04-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11433, 'Fall Injury', 'Salisbury', to_date('04-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11434, 'Poisoning', 'Ashland', to_date('07-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11435, 'Burn', 'Tyne & Wear', to_date('01-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11436, 'Car Accident', 'Chennai', to_date('28-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11437, 'Poisoning', 'Ludbreg', to_date('12-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11438, 'Fall Injury', 'New Delhi', to_date('09-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11439, 'Burn', 'Parsippany', to_date('25-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11440, 'Poisoning', 'Baltimore', to_date('01-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11441, 'Car Accident', 'Coventry', to_date('22-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11442, 'Shooting Attack', 'Angers', to_date('11-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11443, 'Fall Injury', 'Gummersbach', to_date('31-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11444, 'Car Accident', 'Longueuil', to_date('04-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11445, 'Car Accident', 'Birmensdorf', to_date('26-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11446, 'Fall Injury', 'Charleston', to_date('16-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11447, 'Poisoning', 'Erlangen', to_date('17-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11448, 'Burn', 'Waco', to_date('03-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11449, 'Birth', 'Pasadena', to_date('01-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11450, 'Poisoning', 'Cle Elum', to_date('21-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11451, 'Fall Injury', 'Frankfurt', to_date('30-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11452, 'Car Accident', 'Hilton', to_date('07-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11453, 'Poisoning', 'Burlington', to_date('15-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11454, 'Birth', 'Ittigen', to_date('30-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11455, 'Car Accident', 'Gaza', to_date('06-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11456, 'Poisoning', 'Ringwood', to_date('25-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11457, 'Burn', 'Sapporo', to_date('13-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11458, 'Burn', 'Colorado Springs', to_date('15-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11459, 'Car Accident', 'Seatle', to_date('18-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11460, 'Poisoning', 'Sulzbach', to_date('28-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11461, 'Car Accident', 'Luedenscheid', to_date('13-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11462, 'Shooting Attack', 'Thames Ditton', to_date('02-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11463, 'Poisoning', 'Essex', to_date('26-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11464, 'Fall Injury', 'Pasadena', to_date('27-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11465, 'Shooting Attack', 'Irkutsk', to_date('18-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11466, 'Burn', 'Research Triangle', to_date('25-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11467, 'Poisoning', 'Fukui', to_date('29-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11468, 'Birth', 'Tallahassee', to_date('04-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11469, 'Shooting Attack', 'Nanaimo', to_date('26-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11470, 'Birth', 'Zaandam', to_date('08-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11471, 'Poisoning', 'Kaohsiung', to_date('05-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11472, 'Burn', 'Brentwood', to_date('19-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11473, 'Fall Injury', 'San Francisco', to_date('17-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11474, 'Fall Injury', 'Laredo', to_date('19-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11475, 'Car Accident', 'Silverdale', to_date('28-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11476, 'Fall Injury', 'Erpe-Mere', to_date('18-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11477, 'Fall Injury', 'Szazhalombatta', to_date('15-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11478, 'Burn', 'Prague', to_date('20-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11479, 'Poisoning', 'Zaandam', to_date('05-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11480, 'Poisoning', 'Fairfax', to_date('08-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11481, 'Fall Injury', 'Singapore', to_date('11-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11482, 'Fall Injury', 'Portsmouth', to_date('16-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11483, 'Shooting Attack', 'Slidel', to_date('15-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11484, 'Burn', 'Linz', to_date('03-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11485, 'Poisoning', 'Caguas', to_date('18-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11486, 'Car Accident', 'Milano', to_date('03-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11487, 'Burn', 'Pasadena', to_date('05-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11488, 'Birth', 'Sainte-foy', to_date('11-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11489, 'Car Accident', 'Zurich', to_date('25-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11490, 'Car Accident', 'Dardilly', to_date('28-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11491, 'Poisoning', 'Malmצ', to_date('24-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11492, 'Shooting Attack', 'Corona', to_date('22-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11493, 'Shooting Attack', 'Kloten', to_date('03-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11494, 'Burn', 'Salzburg', to_date('26-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11495, 'Shooting Attack', 'Joinville', to_date('08-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11496, 'Poisoning', 'Arlington', to_date('07-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11497, 'Burn', 'Taoyuan', to_date('06-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11498, 'Shooting Attack', 'Hackensack', to_date('30-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11499, 'Poisoning', 'Fort gordon', to_date('01-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11500, 'Fall Injury', 'Rtp', to_date('03-09-2020', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into EVENT (event_id, deescription, locaation, date_time)
values (11501, 'Poisoning', 'Nordhausen', to_date('09-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11502, 'Shooting Attack', 'Slmea', to_date('27-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11503, 'Shooting Attack', 'Duesseldorf', to_date('01-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11504, 'Burn', 'St-bruno', to_date('29-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11505, 'Fall Injury', 'Monument', to_date('19-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11506, 'Shooting Attack', 'Columbus', to_date('16-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11507, 'Poisoning', 'Mablethorpe', to_date('13-04-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11508, 'Fall Injury', 'Rothenburg', to_date('14-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11509, 'Burn', 'Melbourne', to_date('05-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11510, 'Poisoning', 'Lyon', to_date('11-12-2021', 'dd-mm-yyyy'));
commit;
prompt 410 records loaded
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
values (6, 6);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 7);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8, 8);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9, 9);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (10, 10);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11167, 11160);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11206, 11494);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11141, 11252);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11149, 11160);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9, 11225);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11162, 11138);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11166, 11262);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11130, 11123);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11125, 11498);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11136, 11134);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11134, 11116);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11203, 11401);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11210, 11129);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11136, 11234);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11183, 11166);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11133, 11215);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11115, 11222);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11125, 11234);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11111, 11347);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11207, 11368);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11202, 11412);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11171, 11208);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11117, 9);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11144, 11149);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11159, 11294);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11151, 11445);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11175, 11308);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8, 11111);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11195, 11356);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11132, 11296);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11137, 11113);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11172, 11465);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11205, 11382);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11210, 11425);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8, 11391);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11136, 11424);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11205, 11238);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11124, 11267);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11118, 11450);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11115, 11131);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11177, 11164);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11209, 11125);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11190, 11456);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11138, 11260);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11189, 11181);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11151, 11117);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11128, 11485);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11203, 1);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11138, 11228);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11168, 11478);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11151, 11319);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11116, 11288);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (6, 11232);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11113, 11350);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11147, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3, 11320);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11115, 11506);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11398);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11206, 11233);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11115, 11311);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11173, 11433);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11132, 11210);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11435);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11124, 11414);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11148, 11352);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11176, 11348);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11113, 11152);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3, 11362);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11155, 11495);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11206, 11421);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11196, 11172);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11382);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11118, 11261);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11142, 11157);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4, 11212);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11189, 11170);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11172, 11280);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3, 11194);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11176, 11225);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 11470);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11125, 11302);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9, 11126);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11157, 11403);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11168, 11260);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11205, 11290);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11373);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11162, 11282);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (2, 11221);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11207, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11153, 11484);
commit;
prompt 100 records committed...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11163, 11231);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11184, 11185);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11141, 2);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11174, 11440);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11194, 11406);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11161, 11396);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11167, 11224);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11203, 11446);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11185, 11439);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11163, 11447);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11152, 11499);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11181, 11438);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11181, 11294);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11187, 11388);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11172, 11455);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11150, 11132);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11184, 11211);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11145, 11323);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11192, 11260);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (1, 11429);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11171, 11175);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11133, 11142);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11141, 11446);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11170, 11438);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11171, 11120);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11161, 11192);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11156, 11345);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11178, 11369);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11180, 11474);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7, 11440);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11121, 11120);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11164, 11451);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11148, 11156);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11119, 11178);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11147, 11275);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11162, 11390);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11127, 11250);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11145, 11308);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11121, 11256);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11195, 11186);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11157, 11210);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11127, 11434);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11198, 11263);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11177, 11259);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4, 11145);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11204, 11172);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11151, 9);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11146, 11464);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (6, 11153);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11154, 11191);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11203, 11468);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11170, 11482);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11206, 11406);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11157, 11499);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11169, 11354);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11159, 11319);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11149, 11324);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11138, 11504);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11193, 11257);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11117, 11127);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11133, 11148);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (10, 11436);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11124, 11294);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11184, 11150);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11181, 11374);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11191, 11429);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11159, 11324);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11133, 11384);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11127, 11296);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11185, 11147);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11117, 11397);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11195, 11368);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11111, 11164);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11162, 11178);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11210, 11313);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11130, 11336);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11133, 11385);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11172, 11271);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11114, 11324);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11179, 11441);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11124, 11252);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11172, 11169);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11186, 11125);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11143, 11113);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11178, 11273);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11192, 11154);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11111, 11230);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11133, 11411);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11187, 11331);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11171, 11490);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11139, 11399);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3, 11355);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11204, 11223);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11134, 11182);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11167, 11354);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11199, 11124);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11151, 11360);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11169, 11135);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11156, 11438);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9, 11155);
commit;
prompt 200 records committed...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11199, 11425);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11179, 11291);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11164, 11251);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11154, 11282);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11136, 11460);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11135, 11460);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11115, 11404);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11132, 11138);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (11125, 11503);
commit;
prompt 209 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1, 'John Doe', 1234567890, '123 Herzl St, Tel Aviv', to_date('01-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2, 'Jane Smith', 2345678901, '456 Ben Yehuda St, Jerusalem', to_date('02-02-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (3, 'Emily Jones', 3456789012, '789 Hanassi St, Haifa', to_date('03-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (4, 'Michael Brown', 4567890123, '101 David Ben Gurion Blvd, Beersheba', to_date('04-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (5, 'Sarah Davis', 5678901234, '202 Rothschild Blvd, Rishon LeZion', to_date('05-05-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (6, 'David Wilson', 6789012345, '303 Jabotinsky St, Petah Tikva', to_date('06-06-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (7, 'Laura Martinez', 7890123456, '404 Bialik St, Ashdod', to_date('07-07-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (8, 'James Garcia', 8901234567, '505 Herzl St, Netanya', to_date('08-08-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (9, 'Emma Anderson', 9012345678, '606 Weizmann St, Holon', to_date('09-09-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (10, 'Daniel Taylor', 1234567809, '707 Jabotinsky St, Bnei Brak', to_date('10-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11111, 'HaroldBerkley', 9276174796, '93 Danni Street', to_date('13-04-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11112, 'JenaCandy', 5854415692, '66 Portman Drive', to_date('10-02-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11113, 'GlennMueller-Stahl', 4887688195, '33 Alexander Blvd', to_date('13-06-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11114, 'PaulaLattimore', 5789124329, '63 Kenoly', to_date('20-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11115, 'ManuWorrell', 5678755255, '58 Schenectady Road', to_date('12-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11116, 'ColeKweller', 9363151218, '28 Heiligenhaus Road', to_date('14-05-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11117, 'RoddyNortham', 5532723975, '817 Ilmenau Street', to_date('09-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11118, 'CleaWeisberg', 5115193177, '991 Nile Street', to_date('01-02-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11119, 'MiraAllen', 3614438695, '78 Chambers Blvd', to_date('10-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11120, 'KarenPresley', 8293635521, '746 Gandolfini Street', to_date('20-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11121, 'GavinSwank', 2315125955, '92 Schlieren Drive', to_date('24-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11122, 'CarlenePaymer', 6236142451, '50 Pacific Grove Street', to_date('16-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11123, 'DermotBriscoe', 1737444699, '522 Jackie Road', to_date('27-01-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11124, 'DianneYoung', 8615419978, '17 Carmen', to_date('27-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11125, 'StevieNolte', 2532192661, '31st Street', to_date('30-03-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11126, 'HenryMcFerrin', 7384598589, '90 Lee Blvd', to_date('22-10-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11127, 'DarylKenoly', 7335947535, '24 Whitmore Road', to_date('15-04-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11128, 'ToniMcDiarmid', 9886726962, '569 Allison Street', to_date('04-10-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11129, 'RoddyOakenfold', 1844346573, '22nd Street', to_date('15-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11130, 'CeliaAtlas', 9286946856, '47 Paymer Street', to_date('29-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11131, 'ChrisCassidy', 5717243117, '13 Gene Street', to_date('26-09-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11132, 'GlenCartlidge', 5741679915, '1 Northbrook Street', to_date('13-11-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11133, 'LatinWitherspoon', 7718757318, '34 Quinn Street', to_date('28-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11134, 'CarolineMacLachlan', 6846896511, '25 Tokushima Drive', to_date('19-02-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11135, 'BoSpears', 7329451337, '36 France Road', to_date('27-10-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11136, 'ReneeTankard', 1432854425, '81st Street', to_date('19-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11137, 'BethCandy', 3168615145, '421 Fiorentino Blvd', to_date('14-04-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11138, 'AustinWitt', 4124761136, '99 Villata Street', to_date('10-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11139, 'RobLevin', 4271363658, '78 Lopez Street', to_date('04-11-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11140, 'VerucaThornton', 9113247211, '2 Weston Street', to_date('11-06-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11141, 'ArmandHanley', 9339742926, '47 Bob Road', to_date('29-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11142, 'LuisCondition', 2415257562, '376 Boorem Street', to_date('21-10-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11143, 'CathyCrouse', 7357848124, '26 Raitt Drive', to_date('16-03-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11144, 'MichaelGriggs', 8544691539, '42nd Street', to_date('07-05-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11145, 'IlleanaEvans', 9214944316, '43 Tilburg', to_date('11-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11146, 'CameronSwayze', 8487445145, '42nd Street', to_date('24-05-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11147, 'TiaSandoval', 1112676177, '23 Milpitas', to_date('06-04-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11148, 'MarleyBruce', 7163541772, '41 Eldard Drive', to_date('27-08-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11149, 'CliveArkenstone', 5458675556, '66 Uden Street', to_date('18-07-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11150, 'WillieCronin', 4593773469, '919 Hanley Blvd', to_date('22-09-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11151, 'ZooeyMueller-Stahl', 6264322175, '75 Hartford', to_date('01-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11152, 'GavinBarry', 9929147411, '6 Curt Street', to_date('14-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11153, 'MorrisCalle', 8821786352, '25 Charlize Ave', to_date('10-01-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11154, 'WendyWeller', 4917298196, '817 Stewart Road', to_date('20-03-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11155, 'GwynethVicious', 6823453626, '58 McPherson Street', to_date('16-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11156, 'MartyCollins', 2767771581, '91st Street', to_date('30-04-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11157, 'AndraeArkin', 5679159261, '37 Hutton Drive', to_date('02-01-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11158, 'VendettaBarkin', 3758621693, '9 Marley', to_date('15-06-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11159, 'BillyHector', 6467512277, '81 Watley Drive', to_date('28-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11160, 'EmersonMann', 6315512865, '30 Marlon', to_date('06-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11161, 'TyroneBancroft', 3632538286, '69 Sherman Street', to_date('08-03-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11162, 'HollandSchreiber', 6121865293, '86 Tankard Drive', to_date('27-02-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11163, 'LeoLuongo', 9368971747, '29 Nicky Road', to_date('23-02-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11164, 'RosePantoliano', 3838429315, '395 Harsum Blvd', to_date('19-09-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11165, 'WendyRipley', 4117926642, '8 Webster Groves Street', to_date('26-04-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11166, 'VerucaCurtis', 5958492756, '4 Sawa Road', to_date('05-01-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11167, 'EthanBroza', 7163745628, '70 Rydell Street', to_date('29-11-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11168, 'TaylorBuckingham', 9693285758, '28 Kieran Road', to_date('20-02-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11169, 'TchekyChestnut', 9484941463, '24 Gordon Road', to_date('29-10-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11170, 'IreneStuart', 8316486913, '82nd Street', to_date('09-12-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11171, 'AlexFraser', 1536893479, '45 Hidalgo', to_date('30-03-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11172, 'BenicioPaul', 8625185329, '35 Holy Drive', to_date('03-05-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11173, 'BarbaraAtlas', 1319791222, '4 Carlingford Drive', to_date('20-06-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11174, 'DougBryson', 4615489258, '24 Atlas Street', to_date('23-04-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11175, 'DeanMatheson', 8251534248, '81 Horb Street', to_date('05-03-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11176, 'NikkaNewton', 2226763899, '66 Cazale Street', to_date('02-02-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11177, 'FamkeMcCready', 3999199848, '8 Geggy Drive', to_date('03-02-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11178, 'GraceSpacek', 2466522442, '61 Giamatti', to_date('03-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11179, 'SethIsaak', 5239393551, '4 Deejay Drive', to_date('19-02-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11180, 'VinPage', 6488666323, '99 Bautzen Drive', to_date('27-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11181, 'GeggyCoverdale', 9561647241, '51 Oak park Ave', to_date('25-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11182, 'GordDanes', 7939545388, '580 Fornacette Road', to_date('06-05-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11183, 'ThinCrowell', 7936325278, '67 Baarn Road', to_date('20-12-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11184, 'BuddyJohansen', 4923771476, '50 Apple Street', to_date('01-09-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11185, 'LupeWoodward', 7785595421, '89 Macclesfield Drive', to_date('29-04-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11186, 'JonMatthau', 3237999432, '589 Kweller Drive', to_date('21-10-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11187, 'JonathaGriffin', 7333687968, '256 Edie Street', to_date('28-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11188, 'GuyKennedy', 8548788972, '84 Cliff Drive', to_date('22-11-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11189, 'FrancesFogerty', 7132592839, '903 Heather Drive', to_date('16-03-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11190, 'TomTolkan', 8441667876, '52 CeCe Road', to_date('03-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11191, 'VernChinlund', 7962691267, '4 Manaus Street', to_date('09-11-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11192, 'BethCleese', 4258749977, '77 Toulouse Street', to_date('30-09-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11193, 'PierceBassett', 3663338568, '17 Glendale Drive', to_date('02-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11194, 'LaraKrumholtz', 4581372733, '96 Bischofshofen', to_date('24-07-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11195, 'IkeMoffat', 4992574226, '11 Reeves Street', to_date('23-05-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11196, 'BetteSpader', 9119869584, '48 Swinton Blvd', to_date('31-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11197, 'NoraHart', 5387914222, '422 Goldwyn Drive', to_date('17-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11198, 'ZooeyCummings', 5768222893, '71st Street', to_date('04-09-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11199, 'VondaFinney', 5825827158, '60 Gladys Road', to_date('11-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11200, 'CeCeGano', 8961526854, '73 Kweller Street', to_date('24-05-1993', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11201, 'AniVaughn', 4349596277, '52 Bartlesville Ave', to_date('20-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11202, 'GarthCaine', 7873882159, '38 Bentley Road', to_date('02-05-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11203, 'ChristinaCrouch', 8257887857, '55 Cardiff Drive', to_date('23-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11204, 'SissyCrystal', 1354883392, '95 Glen Drive', to_date('18-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11205, 'ShannonWeaver', 4545576145, '5 Charlotte Road', to_date('17-04-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11206, 'AntonioScaggs', 6489413233, '61 DeVita Road', to_date('28-06-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11207, 'GaryNeil', 8153419567, '62 Cardiff Drive', to_date('16-08-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11208, 'SpikeHanley', 5753897581, '54 Aniston Drive', to_date('01-09-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11209, 'IrenePerez', 1161558678, '11st Street', to_date('13-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11210, 'MinnieDurning', 4358574149, '58 Okayama Road', to_date('19-11-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11211, 'DaveEder', 1619381275, '310 Nicosia Street', to_date('24-01-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11212, 'NatalieLachey', 2723375647, '26 Stanford Drive', to_date('01-07-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11213, 'HollySpader', 2666796324, '2 Mapo-gu Road', to_date('10-02-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11214, 'BurtGrier', 6513586864, '83rd Street', to_date('07-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11215, 'KatrinLeachman', 7793834258, '62 Johansson Road', to_date('06-04-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11216, 'WillemBassett', 6473381695, '33 Marty Road', to_date('25-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11217, 'NanciGarcia', 5979796696, '69 Snow Street', to_date('20-01-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11218, 'CharltonCollie', 6756921972, '43rd Street', to_date('23-08-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11219, 'SheenaChinlund', 5677651489, '24 Harsum Street', to_date('03-04-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11220, 'RonHagerty', 8582371516, '148 Arjona Road', to_date('14-09-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11221, 'MarySpacey', 1384991236, '77 Curtis-Hall Drive', to_date('07-03-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11222, 'RonSaxon', 5197193395, '44 Carrere Drive', to_date('02-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11223, 'GarthSpacey', 9725436949, '56 Yamaguchi Road', to_date('09-02-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11224, 'ValAaron', 9874669596, '935 L''union Road', to_date('15-04-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11225, 'CateAiken', 5152888344, '10 Edmonton Drive', to_date('14-01-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11226, 'DelroySchwimmer', 5334768752, '28 Womack Drive', to_date('31-05-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11227, 'RedRamirez', 4383134752, '16 Sevigny Road', to_date('29-11-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11228, 'KatiePepper', 3267639815, '12 Andrea Street', to_date('04-10-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11229, 'OssieMaxwell', 7818767391, '30 Rooker Street', to_date('24-02-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11230, 'MikaRickles', 1389749157, '68 Gino Drive', to_date('16-08-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11231, 'SonaUggams', 9458414572, '25 Overstreet Street', to_date('02-12-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11232, 'ValShawn', 2669488386, '76 Winwood Street', to_date('26-05-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11233, 'WallaceSevenfold', 9674996788, '41st Street', to_date('12-01-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11234, 'MarianneRanger', 4845387434, '54 Udo Drive', to_date('16-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11235, 'MariaPerry', 4446881846, '78 Armatrading Drive', to_date('21-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11236, 'BillyFehr', 4959293932, '33 Dillon Road', to_date('24-06-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11237, 'DomingoHobson', 8599261392, '23 Vonda Blvd', to_date('08-02-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11238, 'SusanKeith', 8618397834, '412 Snipes Road', to_date('10-01-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11239, 'LorraineBelushi', 4263155523, '15 DeLuise Street', to_date('07-02-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11240, 'ElizaMcPherson', 5733288693, '21 Pulheim-brauweiler Blvd', to_date('10-05-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11241, 'IlleanaHaynes', 6426123979, '53 Kenneth Drive', to_date('27-04-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11242, 'CameronHarry', 7628891444, '15 St Jean de Soudain Drive', to_date('02-11-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11243, 'SophieColman', 2698548245, '55 Penelope Street', to_date('13-03-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11244, 'FatsLovitz', 7443436813, '5 Callow Ave', to_date('05-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11245, 'WallacePollak', 5635375598, '12 Shannon Road', to_date('20-08-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11246, 'ValShepherd', 7277371434, '897 Hedaya', to_date('01-06-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11247, 'RickyDushku', 7857658365, '79 Fornacette Blvd', to_date('27-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11248, 'ShelbyMcGowan', 1677527159, '36 O''fallon Drive', to_date('30-06-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11249, 'StockardVega', 2319839464, '77 Holly Street', to_date('15-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11250, 'JeanneCarradine', 1774454185, '492 San Antonio Road', to_date('27-10-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11251, 'KevinEldard', 7396466682, '25 Javon Road', to_date('02-02-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11252, 'GenaCarrere', 9887559625, '54 Krieger Street', to_date('26-11-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11253, 'DianneBlackwell', 8167497527, '52 Luke Street', to_date('10-09-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11254, 'JeffreyVenora', 2665811773, '20 Flanery Road', to_date('25-07-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11255, 'CaseyFinney', 7499487255, '93 Ratzenberger Drive', to_date('04-07-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11256, 'PelvicScorsese', 4223173485, '24 D''Onofrio Ave', to_date('23-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11257, 'SalmaRodgers', 7689597891, '6 Fats Street', to_date('28-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11258, 'MarcHurt', 2365875561, '49 Paisley Blvd', to_date('17-03-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11259, 'MattCheadle', 2214598777, '59 Voight Road', to_date('26-01-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11260, 'TreatKier', 4572162359, '61 Buffalo Ave', to_date('17-08-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11261, 'ChaleeBlige', 4975819357, '49 Raymond Blvd', to_date('21-06-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11262, 'CampbellRaye', 3343363277, '47 Renee Street', to_date('24-03-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11263, 'RobbieGano', 5419124191, '53 Marin Road', to_date('14-06-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11264, 'BozBusey', 9176716659, '76 Bell Street', to_date('06-03-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11265, 'GeraldineChaykin', 8315442775, '100 Garza Drive', to_date('11-05-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11266, 'LinScorsese', 5772978931, '22 Trey Ave', to_date('30-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11267, 'DwightCrewson', 6728474313, '42 Kelli Ave', to_date('07-06-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11268, 'VerucaMiller', 2783539596, '21st Street', to_date('03-09-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11269, 'EttaMichaels', 8587341782, '83rd Street', to_date('07-07-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11270, 'WilliamNewton', 9677457646, '57 Cuba Drive', to_date('27-05-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11271, 'MariaMakeba', 8553531161, '813 Henstridge Street', to_date('16-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11272, 'NicolasHeche', 8671757289, '91 Goldblum Ave', to_date('16-06-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11273, 'GenaLightfoot', 2371694649, '27 Ellen Road', to_date('09-04-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11274, 'JulianaSharp', 1189143196, '935 Kevelaer Road', to_date('21-02-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11275, 'MichaelBiehn', 1811246259, '5 McCann Road', to_date('30-09-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11276, 'GilEstevez', 9277732771, '18 Tcheky Road', to_date('26-02-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11277, 'TaraChaplin', 2977196298, '63 Lizzy Street', to_date('23-09-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11278, 'RaulDouglas', 1976361967, '23 Estevez Street', to_date('24-01-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11279, 'JoshCharles', 8154961362, '318 Blackwell Ave', to_date('10-10-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11280, 'EddiePatillo', 4587585762, '74 Olin Blvd', to_date('04-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11281, 'MiliLoveless', 2195728125, '31 Sophie Road', to_date('30-01-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11282, 'NightTurner', 4446598561, '95 Caguas', to_date('25-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11283, 'ArnoldLatifah', 3219191394, '43 Easton', to_date('13-09-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11284, 'FionnulaHopkins', 2963312726, '90 Alice Drive', to_date('17-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11285, 'PenelopeHumphrey', 4169631191, '46 Carmen Street', to_date('27-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11286, 'VickieGoodall', 9586813267, '47 DiFranco Blvd', to_date('11-08-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11287, 'KieranBaldwin', 2658776917, '310 Oldham', to_date('08-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11288, 'CarolineFrost', 7861967648, '273 Turner', to_date('07-07-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11289, 'ChadCaldwell', 8668439683, '22 Gryner Street', to_date('25-09-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11290, 'ShirleyGilley', 3723715619, '99 Teena', to_date('12-03-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11291, 'DariusRispoli', 9538396483, '79 Wiedlin Ave', to_date('09-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11292, 'YolandaHersh', 4247517178, '224 Beckham Street', to_date('24-08-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11293, 'LeVarLennix', 5772823812, '958 Ceasar Drive', to_date('11-11-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11294, 'JaneHolliday', 1236293514, '83 Roma Street', to_date('11-07-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11295, 'ChrissieStanley', 6355833325, '73 MacPherson Street', to_date('20-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11296, 'KatieHawke', 5582496239, '9 Judi Drive', to_date('17-02-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11297, 'NancyBacharach', 3617959626, '53 Courtney Road', to_date('08-12-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11298, 'EricTisdale', 9137412325, '95 Nicosia Ave', to_date('13-12-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11299, 'StephanieDutton', 8945163741, '6 Pleasure Street', to_date('05-11-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11300, 'NellyMalone', 6329574956, '31st Street', to_date('22-08-1991', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11301, 'CarolHolbrook', 6433315489, '45 Sparrows Point Street', to_date('06-10-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11302, 'SwoosiePlowright', 7574272648, '79 Sainte-Marie Drive', to_date('11-01-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11303, 'ViennaCoughlan', 1339965594, '28 Crispin Blvd', to_date('24-03-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11304, 'CollectiveDouglas', 5687477525, '37 Kungki Drive', to_date('15-06-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11305, 'RobbieParker', 1255336747, '98 Jeremy Street', to_date('14-06-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11306, 'DelbertStampley', 7829148831, '30 Unger Street', to_date('05-02-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11307, 'KimKurtz', 7285278787, '12 Love Street', to_date('11-05-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11308, 'LarryHerndon', 2486598349, '50 Maceo Street', to_date('02-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11309, 'TaylorSpeaks', 5918722685, '43 Piacenza Drive', to_date('05-10-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11310, 'SophieYorn', 4282137436, '8 Mariano Comense Drive', to_date('26-05-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11311, 'KidCarrey', 4593752741, '58 McFerrin Road', to_date('26-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11312, 'KieranBraugher', 6119912594, '93rd Street', to_date('15-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11313, 'AdinaChambers', 3566264434, '21 Stewart', to_date('27-11-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11314, 'AnthonyLucien', 4347341545, '8 Sinead Street', to_date('12-11-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11315, 'RichieCornell', 1447594299, '649 Page Road', to_date('15-02-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11316, 'ChuckWhite', 8486244551, '1 Montrיal Road', to_date('14-10-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11317, 'ToshiroWashington', 1382956322, '36 Oxon Drive', to_date('02-03-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11318, 'RoscoeFeore', 2695858745, '35 Bello Street', to_date('01-12-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11319, 'TimothyCartlidge', 3416413343, '842 Shand Street', to_date('24-08-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11320, 'SuziShocked', 1861865812, '36 Cardiff', to_date('10-09-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11321, 'TreyHauer', 3514476564, '63 Marisa Road', to_date('02-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11322, 'ValKenoly', 9512475485, '42 Danny Ave', to_date('15-09-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11323, 'FamkeJackson', 4374966783, '28 Garth Street', to_date('22-09-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11324, 'JodieMargolyes', 5181617135, '744 Cerritos Road', to_date('24-02-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11325, 'StockardLynn', 2521255222, '38 Sedgwick Drive', to_date('30-12-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11326, 'AndieShaye', 5914983462, '13rd Street', to_date('23-12-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11327, 'LukeNelson', 2688239561, '26 Sao jose rio preto Ave', to_date('06-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11328, 'ViggoMoss', 5756139443, '689 Parker Blvd', to_date('29-01-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11329, 'NinaApple', 5464218745, '62 Gere Street', to_date('15-11-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11330, 'ElizaBacon', 5619838533, '65 Lynch Street', to_date('24-10-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11331, 'MerrillYoung', 9824754478, '79 Rispoli Street', to_date('03-03-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11332, 'VerticalChurch', 5999524696, '46 DiCaprio Drive', to_date('04-06-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11333, 'ElizaMorales', 2493874156, '68 Antonio Drive', to_date('08-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11334, 'Jonny LeeStuart', 3318294451, '42 Blackwell Street', to_date('06-01-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11335, 'DionnePhillippe', 6245372269, '99 Walker Ave', to_date('08-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11336, 'JulianneMcDowall', 8331513919, '769 Westerberg Drive', to_date('07-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11337, 'NormWinger', 1285179712, '897 Nigel Road', to_date('19-03-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11338, 'RachidJolie', 1934282541, '43 Colombo Road', to_date('27-04-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11339, 'CledusSquier', 1248281447, '928 Drive Road', to_date('06-06-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11340, 'NenehRamirez', 3584564124, '99 Studi Street', to_date('13-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11341, 'ArnoldKurtz', 5195486361, '7 Capshaw Street', to_date('31-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11342, 'MitchellPitney', 3453927119, '97 Suzanne Street', to_date('04-06-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11343, 'OzzyMoore', 4424144289, '35 Charlie', to_date('24-04-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11344, 'WayneDuschel', 3149154674, '73 Deejay Drive', to_date('11-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11345, 'FamkeStiller', 8956997216, '61 Puckett Street', to_date('06-12-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11346, 'PattyShocked', 6414924837, '58 Gilbert Street', to_date('14-08-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11347, 'AnnaCraddock', 3572966998, '58 Beaverton Street', to_date('25-06-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11348, 'HugoChilton', 3912365197, '6 Ceasar Blvd', to_date('02-01-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11349, 'GinSerbedzija', 3934499653, '77 LaPaglia', to_date('10-03-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11350, 'VerucaRaye', 6771911386, '91 Martinez Street', to_date('05-11-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11351, 'KristinPalmer', 4899776198, '32 Freddy Street', to_date('06-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11352, 'RolandoDupree', 3266731186, '32nd Street', to_date('25-10-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11353, 'RadneyDomino', 5771638989, '1 Crouse Road', to_date('31-03-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11354, 'ChloeGayle', 1333628132, '97 Hikaru Road', to_date('06-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11355, 'GeoffreyConley', 5965925131, '52nd Street', to_date('04-02-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11356, 'StockardLang', 9628779123, '94 Thurman Street', to_date('06-04-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11357, 'JulioKahn', 2916859465, '84 Pitney Street', to_date('09-08-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11358, 'CharlieDiddley', 2847324472, '99 Tilda Blvd', to_date('06-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11359, 'ErnieCoward', 2721649954, '45 Bremen Road', to_date('22-10-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11360, 'AndreGold', 3515587341, '83rd Street', to_date('11-06-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11361, 'LynetteMiles', 4581712488, '40 Carnes Street', to_date('28-12-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11362, 'GarlandPenders', 9243666665, '367 Leto', to_date('28-07-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11363, 'MauryTempest', 3385132377, '99 Weaving Blvd', to_date('17-05-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11364, 'AdinaSewell', 9545775665, '83rd Street', to_date('24-11-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11365, 'LeeMahoney', 9321649417, '82 Billund Drive', to_date('22-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11366, 'BreckinValentin', 3563817166, '15 Shaye Street', to_date('05-06-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11367, 'NicholasDorn', 8811533964, '71 Khan Drive', to_date('12-03-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11368, 'CampbellTurturro', 3789822464, '399 Ljubljana Street', to_date('21-03-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11369, 'OlympiaTobolowsky', 4599487256, '740 Coward Blvd', to_date('07-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11370, 'HookahBalaban', 5479778263, '33rd Street', to_date('12-01-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11371, 'NatachaWeber', 1393699182, '981 Hounslow Street', to_date('25-05-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11372, 'JesseSevigny', 1759284647, '48 Favreau Drive', to_date('18-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11373, 'CesarConnick', 6827886463, '64 Butler Drive', to_date('30-07-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11374, 'DarylRhames', 8645692666, '351 King', to_date('06-06-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11375, 'AliciaReinhold', 1274768734, '43rd Street', to_date('09-03-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11376, 'AlbertWainwright', 8682338171, '66 Arjona', to_date('16-09-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11377, 'LouiseCarlyle', 4289972745, '61st Street', to_date('29-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11378, 'LouiseSnow', 3919823123, '53 Northbrook Road', to_date('08-10-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11379, 'LatinDomino', 2638243216, '14 Waldorf Street', to_date('05-11-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11380, 'MiaRhodes', 5358385837, '66 Page Street', to_date('01-12-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11381, 'CourtneyCherry', 3116929313, '100 Gilbert Road', to_date('16-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11382, 'DavidHartnett', 6667824931, '298 Olga Road', to_date('23-09-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11383, 'DrewAmmons', 6232382671, '66 Leachman Drive', to_date('04-08-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11384, 'NicoleSpringfield', 1326574523, '79 Wen Blvd', to_date('25-03-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11385, 'BryanDale', 6522297447, '98 Rankin Street', to_date('18-10-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11386, 'GeenaMulroney', 5333283227, '80 Logue Street', to_date('26-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11387, 'RufusFlatts', 5933657267, '798 Masur Drive', to_date('23-06-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11388, 'KeithRodgers', 8665546557, '5 Columbus', to_date('14-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11389, 'TalvinKeener', 5756241494, '4 Boyle Drive', to_date('12-02-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11390, 'NickelHobson', 1318675251, '18 Juliet Drive', to_date('04-07-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11391, 'DanielBeck', 9793248674, '54 Carlene', to_date('10-06-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11392, 'MichelleJane', 5296365899, '75 Lauren Drive', to_date('22-01-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11393, 'RhonaHersh', 6243215624, '81st Street', to_date('12-02-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11394, 'RawlinsRyan', 7412528248, '49 Rispoli Drive', to_date('21-10-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11395, 'BenRaitt', 4472954313, '73 Vaughan Street', to_date('03-07-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11396, 'HowieDriver', 5373181487, '27 Ashton Street', to_date('22-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11397, 'BozChappelle', 7814641598, '42nd Street', to_date('29-06-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11398, 'KazemLillard', 7938572629, '50 Buffy', to_date('13-08-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11399, 'FionnulaChecker', 6637411414, '57 Sevilla Road', to_date('14-02-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11400, 'FisherDean', 5134954841, '71 Leimen Ave', to_date('21-04-1989', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11401, 'GenaGuest', 2224382287, '45 Debi Road', to_date('20-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11402, 'MikoSatriani', 9648745916, '117 Al Drive', to_date('29-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11403, 'EddieLauper', 2511381898, '583 Tהby Street', to_date('18-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11404, 'SpencerGuest', 3665494665, '82 Steagall Ave', to_date('05-10-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11405, 'AndreHughes', 4981585392, '11 Garofalo Ave', to_date('13-07-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11406, 'KayMcGowan', 8494133598, '9 Neustadt Road', to_date('31-10-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11407, 'JaimeMyles', 7116955824, '84 Mann Road', to_date('04-04-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11408, 'LiamChesnutt', 4598817644, '485 Juazeiro Drive', to_date('13-04-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11409, 'DerekHolland', 8116937966, '78 Julia Street', to_date('15-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11410, 'CornellMcDormand', 1943971797, '96 Brando Road', to_date('15-10-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11411, 'RobbyMarie', 6945699793, '95 Eat World Street', to_date('26-11-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11412, 'LaraColton', 5532248481, '3 Kylie Road', to_date('02-01-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11413, 'ArturoSylvian', 4232597875, '72 Washington', to_date('10-09-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11414, 'RonChecker', 9345595677, '21 Melvin Street', to_date('08-01-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11415, 'CherylKeaton', 2749335765, '55 Brittany Blvd', to_date('26-02-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11416, 'KeanuDiBiasio', 3159195273, '54 Branch Drive', to_date('23-09-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11417, 'StellanMoorer', 9249137142, '26 Storrington Road', to_date('02-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11418, 'KathleenAglukark', 2681876111, '711 Uggams Road', to_date('02-12-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11419, 'MitchellGates', 7762695465, '6 Deborah Drive', to_date('28-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11420, 'AllanYankovic', 6986377876, '88 Broza Road', to_date('21-11-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11421, 'MariaLewis', 4314425464, '40 Barrymore Road', to_date('27-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11422, 'LisaAykroyd', 5972615718, '79 Merrilee Ave', to_date('03-11-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11423, 'RedDonovan', 9764177783, '11 Weisz Road', to_date('10-12-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11424, 'AidanPosener', 3819133443, '58 Moe Road', to_date('24-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11425, 'OliverConners', 9323628518, '510 Denis Drive', to_date('18-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11426, 'ColeyPantoliano', 6164843439, '48 Hutch Street', to_date('18-12-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11427, 'HaroldDevine', 3638551494, '71 Rip Ave', to_date('23-04-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11428, 'KatieSarandon', 6492925765, '916 Isaac Street', to_date('02-02-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11429, 'FairuzaBurstyn', 9794432452, '42nd Street', to_date('27-10-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11430, 'DeborahQuinn', 3738598341, '52 Lee Road', to_date('31-05-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11431, 'WillBroza', 4656854777, '46 Radney Street', to_date('16-03-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11432, 'GabrielleMcDonnell', 2463157741, '40 Saucedo Drive', to_date('15-09-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11433, 'BretCetera', 4267458943, '384 Gavin Blvd', to_date('18-05-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11434, 'CornellAvalon', 6551682254, '808 Snider Street', to_date('02-06-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11435, 'NatalieRawls', 8763219938, '733 English Drive', to_date('16-04-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11436, 'IceMagnuson', 5883448567, '27 Timonium Road', to_date('25-08-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11437, 'EmmaDourif', 4176992867, '86 Shawnee Street', to_date('22-01-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11438, 'WillemReilly', 3672938317, '237 Bogguss Road', to_date('27-08-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11439, 'ThoraMcCain', 8432274963, '33 Hingle Road', to_date('07-01-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11440, 'CarrieWinger', 6267334915, '47 Shoreline Road', to_date('01-10-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11441, 'MichaelDawson', 7598377688, '72 Fairfax Street', to_date('01-08-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11442, 'VivicaSchwarzenegger', 9231464732, '57 Mississauga Drive', to_date('23-09-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11443, 'RodneyRemar', 5479519832, '5 Koyana Street', to_date('13-03-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11444, 'ColinFoster', 9363561472, '153 Fiorentino', to_date('14-01-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11445, 'TaylorBlossoms', 2246123365, '51 Broderick Road', to_date('08-02-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11446, 'YaphetHughes', 3565416343, '69 Moe Street', to_date('15-02-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11447, 'ColmThewlis', 2326671693, '172 Grant Street', to_date('13-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11448, 'GuyPride', 4549676791, '83 Debby', to_date('13-09-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11449, 'OzzyWilson', 8294478659, '72 McDonnell', to_date('26-09-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11450, 'HughFerry', 6234664526, '26 Judd', to_date('22-09-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11451, 'SeanHawkins', 7951653728, '23 Kris Road', to_date('05-04-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11452, 'LivMirren', 7131815594, '57 Woodward Drive', to_date('20-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11453, 'JoaquimCocker', 6368788483, '53 Gothenburg Blvd', to_date('26-05-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11454, 'HectorBloch', 4695462545, '67 Gracie Drive', to_date('17-02-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11455, 'AlbertinaQuinlan', 4452671938, '673 Mantegna Drive', to_date('05-01-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11456, 'GrantArkenstone', 3436968998, '104 Kirshner Street', to_date('30-12-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11457, 'GilbertoBanderas', 3233864948, '5 Athens Street', to_date('12-12-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11458, 'RolandoCooper', 7237527788, '71st Street', to_date('08-11-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11459, 'LydiaWahlberg', 5182442321, '16 Lake Forest Road', to_date('06-02-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11460, 'RachaelKinnear', 4774719244, '35 Lucy Drive', to_date('24-04-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11461, 'IkeSchwimmer', 8193777819, '42 Garcia Blvd', to_date('09-09-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11462, 'YaphetCleese', 8296818249, '534 Dalmine Drive', to_date('04-07-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11463, 'CharlesTravolta', 5566632548, '11 Alice Drive', to_date('16-07-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11464, 'CevinNash', 7849774378, '45 Clive Street', to_date('16-07-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11465, 'BoydNess', 9197249414, '189 Nick Drive', to_date('31-07-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11466, 'ThoraMacPherson', 1776374968, '68 Katie Road', to_date('04-07-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11467, 'DenzelDiffie', 9356241233, '95 Barnett', to_date('07-09-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11468, 'GinColin Young', 3322243499, '95 Patton Street', to_date('20-09-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11469, 'OliverO''Connor', 2179146759, '31 Graham Drive', to_date('15-01-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11470, 'BuddyMcElhone', 4139243334, '477 Stans', to_date('08-02-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11471, 'GinCube', 8436225119, '68 Anne Drive', to_date('16-10-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11472, 'HarrisAlexander', 5966513121, '46 Stiers', to_date('22-07-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11473, 'CharlesKing', 8214568249, '649 Hoskins Blvd', to_date('24-11-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11474, 'KellyHaynes', 7312132337, '100 Bedelia Road', to_date('11-05-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11475, 'RhysRio', 3464826172, '42 Hatchet Street', to_date('13-01-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11476, 'ColeyDysart', 6941126326, '507 Zagreb Road', to_date('15-02-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11477, 'LeonardoElizondo', 1886296859, '464 Wayman Road', to_date('16-02-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11478, 'DenzelFiennes', 4386231695, '32 Rhett Street', to_date('05-10-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11479, 'NilsConlee', 3856355154, '528 Eder Street', to_date('03-10-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11480, 'UdoRonstadt', 4211354938, '49 Jonze Street', to_date('16-08-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11481, 'PetulaHauser', 1431461823, '85 Boyle Blvd', to_date('22-04-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11482, 'MarieBogguss', 8645573843, '81 Louise Drive', to_date('07-02-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11483, 'ReginaMyles', 8382467636, '34 Garner Road', to_date('12-05-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11484, 'HookahBrolin', 6744148995, '64 Ryan Road', to_date('08-02-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11485, 'YolandaHerrmann', 6792229883, '29 Junior Road', to_date('13-11-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11486, 'ColleenMewes', 8363918441, '5 Paxton Street', to_date('04-03-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11487, 'ThelmaIrons', 4558191861, '13 Cary Street', to_date('14-01-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11488, 'LesleyImperioli', 3978719937, '854 White', to_date('14-01-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11489, 'BuddyHead', 2392199585, '64 Freddie Road', to_date('30-10-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11490, 'MatthewDupree', 5938437736, '20 Lizzy Drive', to_date('20-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11491, 'RichWarwick', 9277882669, '871 Nikka', to_date('13-05-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11492, 'ColeWells', 8945385713, '41 Milan Road', to_date('15-03-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11493, 'LennyMorse', 6982894922, '2 McLachlan', to_date('08-01-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11494, 'AzucarSecada', 2524926254, '66 Whitmore Street', to_date('14-09-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11495, 'SheenaTicotin', 8225594143, '52 Wilkinson Road', to_date('12-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11496, 'CledusBerkley', 7564891748, '882 Austin Drive', to_date('25-06-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11497, 'GwynethBush', 1491787913, '27 Gandolfini Blvd', to_date('18-12-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11498, 'MiriamAdkins', 2893997679, '77 Favreau Street', to_date('16-03-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11499, 'GinaBlack', 1168638795, '50 Pleasure Road', to_date('24-09-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11500, 'ToshiroRuffalo', 7617817579, '86 Everett Street', to_date('24-11-1983', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11501, 'SigourneyRush', 6894894193, '27 Greene Street', to_date('13-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11502, 'KirkUnion', 6411173758, '67 Sandler Street', to_date('26-05-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11503, 'RheaDonovan', 3866814676, '71st Street', to_date('16-04-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11504, 'GeggyDarren', 4894744574, '15 Murphy Blvd', to_date('14-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11505, 'CherryFinn', 5461597424, '98 Singletary Road', to_date('01-04-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11506, 'IsaiahWalsh', 5428747625, '2 New Delhi Street', to_date('30-05-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11507, 'MegNiven', 1447593681, '20 Udo Street', to_date('12-05-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11508, 'NicolasWells', 6531773982, '24 Brooks', to_date('17-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11509, 'CliffColton', 2974791378, '63rd Street', to_date('30-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (11510, 'FionaKudrow', 5733139328, '91 Sellers Street', to_date('11-01-1996', 'dd-mm-yyyy'));
commit;
prompt 410 records loaded
prompt Loading DRIVER...
insert into DRIVER (licensenum, volunteer_id)
values (11111, 1);
insert into DRIVER (licensenum, volunteer_id)
values (22222, 2);
insert into DRIVER (licensenum, volunteer_id)
values (33333, 3);
insert into DRIVER (licensenum, volunteer_id)
values (44444, 4);
insert into DRIVER (licensenum, volunteer_id)
values (55555, 5);
insert into DRIVER (licensenum, volunteer_id)
values (66666, 6);
insert into DRIVER (licensenum, volunteer_id)
values (77777, 7);
insert into DRIVER (licensenum, volunteer_id)
values (88888, 8);
insert into DRIVER (licensenum, volunteer_id)
values (99999, 9);
insert into DRIVER (licensenum, volunteer_id)
values (101010, 10);
insert into DRIVER (licensenum, volunteer_id)
values (11111, 11492);
insert into DRIVER (licensenum, volunteer_id)
values (11112, 11240);
insert into DRIVER (licensenum, volunteer_id)
values (11113, 11327);
insert into DRIVER (licensenum, volunteer_id)
values (11114, 11112);
insert into DRIVER (licensenum, volunteer_id)
values (11115, 11339);
insert into DRIVER (licensenum, volunteer_id)
values (11116, 11204);
insert into DRIVER (licensenum, volunteer_id)
values (11117, 11178);
insert into DRIVER (licensenum, volunteer_id)
values (11118, 11302);
insert into DRIVER (licensenum, volunteer_id)
values (11120, 11271);
insert into DRIVER (licensenum, volunteer_id)
values (11121, 11193);
insert into DRIVER (licensenum, volunteer_id)
values (11122, 11379);
insert into DRIVER (licensenum, volunteer_id)
values (11123, 11269);
insert into DRIVER (licensenum, volunteer_id)
values (11124, 11393);
insert into DRIVER (licensenum, volunteer_id)
values (11125, 11258);
insert into DRIVER (licensenum, volunteer_id)
values (11126, 11267);
insert into DRIVER (licensenum, volunteer_id)
values (11127, 11353);
insert into DRIVER (licensenum, volunteer_id)
values (11128, 11229);
insert into DRIVER (licensenum, volunteer_id)
values (11129, 11443);
insert into DRIVER (licensenum, volunteer_id)
values (11130, 11498);
insert into DRIVER (licensenum, volunteer_id)
values (11131, 11177);
insert into DRIVER (licensenum, volunteer_id)
values (11132, 11502);
insert into DRIVER (licensenum, volunteer_id)
values (11133, 11300);
insert into DRIVER (licensenum, volunteer_id)
values (11134, 11127);
insert into DRIVER (licensenum, volunteer_id)
values (11135, 11149);
insert into DRIVER (licensenum, volunteer_id)
values (11136, 11122);
insert into DRIVER (licensenum, volunteer_id)
values (11137, 11325);
insert into DRIVER (licensenum, volunteer_id)
values (11138, 11119);
insert into DRIVER (licensenum, volunteer_id)
values (11139, 11241);
insert into DRIVER (licensenum, volunteer_id)
values (11140, 11409);
insert into DRIVER (licensenum, volunteer_id)
values (11141, 11401);
insert into DRIVER (licensenum, volunteer_id)
values (11142, 11226);
insert into DRIVER (licensenum, volunteer_id)
values (11143, 11445);
insert into DRIVER (licensenum, volunteer_id)
values (11144, 11396);
insert into DRIVER (licensenum, volunteer_id)
values (11145, 11375);
insert into DRIVER (licensenum, volunteer_id)
values (11146, 11450);
insert into DRIVER (licensenum, volunteer_id)
values (11147, 11366);
insert into DRIVER (licensenum, volunteer_id)
values (11148, 11505);
insert into DRIVER (licensenum, volunteer_id)
values (11149, 11278);
insert into DRIVER (licensenum, volunteer_id)
values (11150, 11238);
insert into DRIVER (licensenum, volunteer_id)
values (11151, 11200);
insert into DRIVER (licensenum, volunteer_id)
values (11152, 11422);
insert into DRIVER (licensenum, volunteer_id)
values (11154, 11145);
insert into DRIVER (licensenum, volunteer_id)
values (11156, 11454);
insert into DRIVER (licensenum, volunteer_id)
values (11157, 11437);
insert into DRIVER (licensenum, volunteer_id)
values (11158, 11142);
insert into DRIVER (licensenum, volunteer_id)
values (11159, 11423);
insert into DRIVER (licensenum, volunteer_id)
values (11160, 11197);
commit;
prompt 57 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 5, 1);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, 2);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 3, 3);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ben-Gurion University', 2, 4);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Bar-Ilan University', 1, 5);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Weizmann Institute', 6, 6);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Haifa University', 7, 7);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 8, 8);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('IDC Herzliya', 9, 9);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Open University', 10, 10);
commit;
prompt 10 records loaded
prompt Loading SHIFT...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (1, to_date('01-01-2024', 'dd-mm-yyyy'), '08:00', '16:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (2, to_date('01-02-2024', 'dd-mm-yyyy'), '08:00', '16:00', 2, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (3, to_date('01-03-2024', 'dd-mm-yyyy'), '08:00', '16:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (4, to_date('01-04-2024', 'dd-mm-yyyy'), '08:00', '16:00', 4, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (5, to_date('01-05-2024', 'dd-mm-yyyy'), '08:00', '16:00', 5, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (6, to_date('01-06-2024', 'dd-mm-yyyy'), '08:00', '16:00', 6, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (7, to_date('01-07-2024', 'dd-mm-yyyy'), '08:00', '16:00', 7, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (8, to_date('01-08-2024', 'dd-mm-yyyy'), '08:00', '16:00', 8, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (9, to_date('01-09-2024', 'dd-mm-yyyy'), '08:00', '16:00', 9, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (10, to_date('01-10-2024', 'dd-mm-yyyy'), '08:00', '16:00', 10, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11111, to_date('16-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11112, to_date('18-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11113, to_date('05-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11114, to_date('30-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 10, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11115, to_date('13-09-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11116, to_date('07-06-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11117, to_date('22-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11118, to_date('26-06-2020', 'dd-mm-yyyy'), '00:00', '06:00', 2, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11119, to_date('18-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11120, to_date('17-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11121, to_date('06-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11122, to_date('14-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11123, to_date('14-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11124, to_date('18-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11125, to_date('07-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11126, to_date('15-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11127, to_date('18-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 5, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11128, to_date('15-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11129, to_date('10-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 8, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11130, to_date('27-06-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11131, to_date('06-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11132, to_date('10-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 5, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11133, to_date('15-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11134, to_date('15-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11135, to_date('03-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 10, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11136, to_date('04-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11137, to_date('15-03-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11138, to_date('27-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11139, to_date('02-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11140, to_date('15-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11141, to_date('08-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11142, to_date('10-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11143, to_date('08-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 4, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11144, to_date('08-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11145, to_date('08-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11146, to_date('06-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11147, to_date('08-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11148, to_date('26-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11149, to_date('07-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11150, to_date('09-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11151, to_date('04-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11152, to_date('24-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11153, to_date('20-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11154, to_date('29-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11155, to_date('22-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11156, to_date('28-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11157, to_date('10-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11158, to_date('25-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11159, to_date('12-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11160, to_date('10-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11161, to_date('08-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 10, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11162, to_date('19-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11163, to_date('29-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11164, to_date('24-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11165, to_date('16-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11166, to_date('29-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11167, to_date('05-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11168, to_date('26-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11169, to_date('27-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11170, to_date('06-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11171, to_date('09-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11172, to_date('23-06-2020', 'dd-mm-yyyy'), '00:00', '06:00', 5, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11173, to_date('19-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11174, to_date('13-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11175, to_date('12-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11176, to_date('23-01-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11177, to_date('15-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11178, to_date('28-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11179, to_date('24-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11180, to_date('03-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11181, to_date('09-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11182, to_date('15-01-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11183, to_date('20-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11184, to_date('18-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11185, to_date('08-03-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11186, to_date('29-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11187, to_date('23-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11188, to_date('04-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11189, to_date('19-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11190, to_date('03-09-2020', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11191, to_date('02-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 4, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11192, to_date('15-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11193, to_date('14-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11194, to_date('16-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11195, to_date('21-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11196, to_date('16-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11197, to_date('27-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11198, to_date('24-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11199, to_date('11-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11200, to_date('13-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
commit;
prompt 100 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11201, to_date('04-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11202, to_date('17-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11203, to_date('17-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11204, to_date('23-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11205, to_date('10-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11206, to_date('20-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11207, to_date('30-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11208, to_date('24-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11209, to_date('13-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11210, to_date('19-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11211, to_date('19-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11212, to_date('02-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11213, to_date('26-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11214, to_date('24-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11215, to_date('18-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11216, to_date('03-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11217, to_date('30-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11218, to_date('29-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11219, to_date('03-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11220, to_date('26-04-2022', 'dd-mm-yyyy'), '00:00', '06:00', 5, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11221, to_date('20-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11222, to_date('26-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11223, to_date('24-06-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11224, to_date('28-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 6, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11225, to_date('08-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11226, to_date('05-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11227, to_date('29-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11228, to_date('07-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11229, to_date('13-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11230, to_date('12-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11231, to_date('25-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11232, to_date('13-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11233, to_date('08-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11234, to_date('28-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11235, to_date('06-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11236, to_date('26-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11237, to_date('17-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11238, to_date('22-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11239, to_date('01-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11240, to_date('16-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11241, to_date('13-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11242, to_date('08-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11243, to_date('01-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11244, to_date('20-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11245, to_date('22-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11246, to_date('28-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11247, to_date('19-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11248, to_date('12-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11249, to_date('17-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11250, to_date('05-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11251, to_date('25-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11252, to_date('25-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11253, to_date('21-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11254, to_date('04-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11255, to_date('14-06-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11256, to_date('10-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11257, to_date('28-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11258, to_date('06-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11259, to_date('22-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 8, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11260, to_date('01-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11261, to_date('26-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11262, to_date('06-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11263, to_date('14-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11264, to_date('09-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11265, to_date('23-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11266, to_date('30-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11267, to_date('09-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11268, to_date('31-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11269, to_date('15-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11270, to_date('04-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11271, to_date('12-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 5, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11272, to_date('06-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11273, to_date('15-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11274, to_date('21-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11275, to_date('26-01-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11276, to_date('23-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11277, to_date('18-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11278, to_date('20-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11279, to_date('19-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11280, to_date('11-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11281, to_date('16-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11282, to_date('18-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11283, to_date('28-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 8, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11284, to_date('11-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11285, to_date('18-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 10, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11286, to_date('22-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11287, to_date('20-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11288, to_date('06-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11289, to_date('12-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11290, to_date('20-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11291, to_date('29-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11292, to_date('04-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11293, to_date('19-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 4, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11294, to_date('06-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11295, to_date('23-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11296, to_date('05-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 5, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11297, to_date('30-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11298, to_date('31-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11299, to_date('17-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11300, to_date('01-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 1);
commit;
prompt 200 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11301, to_date('02-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11302, to_date('03-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11303, to_date('19-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11304, to_date('19-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11305, to_date('14-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11306, to_date('15-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 10, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11307, to_date('01-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11308, to_date('16-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11309, to_date('17-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11310, to_date('12-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11311, to_date('03-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 5, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11312, to_date('14-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11313, to_date('05-03-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11314, to_date('01-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11315, to_date('01-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11316, to_date('20-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11317, to_date('05-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11318, to_date('09-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11319, to_date('26-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11320, to_date('24-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11321, to_date('07-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11322, to_date('20-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11323, to_date('06-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11324, to_date('08-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11325, to_date('27-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11326, to_date('06-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11327, to_date('04-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 10, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11328, to_date('30-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11329, to_date('08-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11330, to_date('09-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11331, to_date('19-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11332, to_date('10-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11333, to_date('23-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11334, to_date('19-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11335, to_date('26-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11336, to_date('11-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11337, to_date('28-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11338, to_date('29-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11339, to_date('30-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11340, to_date('11-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11341, to_date('23-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11342, to_date('09-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11343, to_date('05-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11344, to_date('27-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11345, to_date('14-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11346, to_date('01-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11347, to_date('21-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11348, to_date('16-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11349, to_date('26-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11350, to_date('06-01-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11351, to_date('08-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11352, to_date('30-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11353, to_date('03-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11354, to_date('22-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11355, to_date('26-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11356, to_date('01-06-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11357, to_date('16-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11358, to_date('23-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11359, to_date('18-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11360, to_date('12-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11361, to_date('06-02-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11362, to_date('18-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11363, to_date('26-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11364, to_date('06-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11365, to_date('29-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11366, to_date('14-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 4, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11367, to_date('08-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 4, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11368, to_date('24-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11369, to_date('07-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11370, to_date('08-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11371, to_date('29-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11372, to_date('05-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11373, to_date('01-03-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11374, to_date('09-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11375, to_date('24-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11376, to_date('24-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 6, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11377, to_date('04-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11378, to_date('26-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11379, to_date('29-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 5, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11380, to_date('20-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11381, to_date('27-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11382, to_date('19-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11383, to_date('19-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11384, to_date('17-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11385, to_date('03-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11386, to_date('12-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11387, to_date('31-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11388, to_date('21-09-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11389, to_date('07-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11390, to_date('05-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11391, to_date('03-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11392, to_date('22-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11393, to_date('24-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11394, to_date('18-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 5, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11395, to_date('06-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11396, to_date('21-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11397, to_date('24-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 3, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11398, to_date('03-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11399, to_date('17-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11400, to_date('28-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 10);
commit;
prompt 300 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11401, to_date('12-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 6, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11402, to_date('07-06-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11403, to_date('25-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11404, to_date('18-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11405, to_date('24-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11406, to_date('03-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 5, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11407, to_date('21-09-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11408, to_date('28-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 7, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11409, to_date('23-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 3, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11410, to_date('15-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 5, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11411, to_date('25-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11412, to_date('12-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11413, to_date('08-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11414, to_date('09-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11415, to_date('22-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11416, to_date('01-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11417, to_date('05-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11418, to_date('30-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11419, to_date('19-04-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11420, to_date('12-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11421, to_date('11-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11422, to_date('14-06-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11423, to_date('02-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11424, to_date('06-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 5, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11425, to_date('03-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11426, to_date('24-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11427, to_date('15-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11428, to_date('14-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11429, to_date('05-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11430, to_date('23-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11431, to_date('08-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11432, to_date('23-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11433, to_date('09-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11434, to_date('09-10-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11435, to_date('15-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 5, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11436, to_date('31-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11437, to_date('12-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11438, to_date('03-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11439, to_date('12-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11440, to_date('23-01-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11441, to_date('18-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 5, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11442, to_date('22-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11443, to_date('30-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11444, to_date('26-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11445, to_date('19-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11446, to_date('27-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11447, to_date('26-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11448, to_date('16-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11449, to_date('02-06-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11450, to_date('08-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11451, to_date('07-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11452, to_date('30-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11453, to_date('06-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11454, to_date('13-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11455, to_date('29-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11456, to_date('24-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 2, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11457, to_date('11-09-2020', 'dd-mm-yyyy'), '00:00', '06:00', 4, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11458, to_date('06-03-2021', 'dd-mm-yyyy'), '00:00', '06:00', 8, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11459, to_date('09-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11460, to_date('02-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 8, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11461, to_date('17-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 2, 2);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11462, to_date('13-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11463, to_date('20-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11464, to_date('22-03-2020', 'dd-mm-yyyy'), '00:00', '06:00', 8, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11465, to_date('14-12-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11466, to_date('29-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 5, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11467, to_date('13-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11468, to_date('24-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11469, to_date('27-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 1, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11470, to_date('14-07-2020', 'dd-mm-yyyy'), '00:00', '06:00', 5, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11471, to_date('01-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 10, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11472, to_date('20-02-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11473, to_date('18-01-2020', 'dd-mm-yyyy'), '00:00', '06:00', 9, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11474, to_date('30-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 7, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11475, to_date('23-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11476, to_date('28-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11477, to_date('21-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 6, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11478, to_date('25-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 2, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11479, to_date('08-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11480, to_date('03-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 5, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11481, to_date('03-01-2021', 'dd-mm-yyyy'), '00:00', '06:00', 1, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11482, to_date('02-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11483, to_date('08-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11484, to_date('27-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 7, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11485, to_date('18-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11486, to_date('19-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 1, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11487, to_date('26-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11488, to_date('03-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 9, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11489, to_date('18-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11490, to_date('23-05-2022', 'dd-mm-yyyy'), '00:00', '06:00', 8, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11491, to_date('27-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11492, to_date('23-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11493, to_date('12-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11494, to_date('25-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 3, 6);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11495, to_date('23-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 4, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11496, to_date('09-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11497, to_date('06-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 10, 3);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11498, to_date('08-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11499, to_date('23-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 6, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11500, to_date('20-11-2021', 'dd-mm-yyyy'), '00:00', '06:00', 3, 4);
commit;
prompt 400 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11501, to_date('03-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 6, 5);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11502, to_date('03-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 4, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11503, to_date('20-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 7, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11504, to_date('20-01-2021', 'dd-mm-yyyy'), '00:00', '06:00', 4, 8);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11505, to_date('16-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 9, 7);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11506, to_date('21-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 2, 1);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11507, to_date('14-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 10, 4);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11508, to_date('07-08-2022', 'dd-mm-yyyy'), '00:00', '06:00', 9, 9);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11509, to_date('13-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 2, 10);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11510, to_date('04-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 5, 4);
commit;
prompt 410 records loaded
prompt Loading DRIVERINSHIFT...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (1, 1);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2, 2);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (3, 3);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (4, 4);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (5, 5);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (6, 6);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (7, 7);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (8, 8);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (9, 9);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (10, 10);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (11302, 11116);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (11401, 11492);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (11375, 11356);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (11278, 11252);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (11498, 11492);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (11366, 11374);
commit;
prompt 16 records loaded
prompt Loading DRIVERTOAMBU...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 1);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 3);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 5);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 6);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 7);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 9);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 10);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11161);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11124);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11133);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11188);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11206);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11164);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11196);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11136);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11204);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11134);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11177);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11203);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11198);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11118);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 1);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11151);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11123);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11154);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11177);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11131);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11114);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11136);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11132);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11130);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11182);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11185);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11199);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11115);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11205);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11175);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11157);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11126);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11145);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11155);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11177);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11111);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11202);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11177);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11175);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11185);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11206);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11160);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11181);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11191);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11161);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 1);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11125);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11127);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11146);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11149);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11174);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11183);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11191);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11199);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11143);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11111);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 7);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11123);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11209);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11176);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11162);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 4);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11186);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11122);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11175);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11197);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11153);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11138);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11173);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11149);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11146);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11133);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11173);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11201);
commit;
prompt 100 records committed...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11139);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11113);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11175);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11128);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11172);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11157);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11203);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11119);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11142);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11139);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11141);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11181);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11167);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11204);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11197);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11136);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11172);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11191);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11204);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11175);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11130);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11160);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11169);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11171);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11137);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11140);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11151);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11156);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11146);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11117);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11150);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11123);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11111);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11133);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11161);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11147);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11192);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 2);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11154);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11159);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11129);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11139);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11162);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11193);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11141);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11128);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11198);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11196);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11175);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11163);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11112);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2, 11169);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11140);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 9);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11152);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11201);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11169);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11188);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (5, 11152);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11184);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11156);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 9);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11160);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11131);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11135);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11185);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (8, 11166);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11148);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11192);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 11186);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11196);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11149);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (9, 11178);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11154);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (7, 11113);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (6, 11138);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (4, 11170);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11123);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 3);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11193);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (10, 11157);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1, 8);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (3, 11204);
commit;
prompt 189 records loaded
prompt Loading MEDIC...
insert into MEDIC (seniority, volunteer_id)
values (5, 1);
insert into MEDIC (seniority, volunteer_id)
values (4, 2);
insert into MEDIC (seniority, volunteer_id)
values (3, 3);
insert into MEDIC (seniority, volunteer_id)
values (2, 4);
insert into MEDIC (seniority, volunteer_id)
values (1, 5);
insert into MEDIC (seniority, volunteer_id)
values (6, 6);
insert into MEDIC (seniority, volunteer_id)
values (7, 7);
insert into MEDIC (seniority, volunteer_id)
values (8, 8);
insert into MEDIC (seniority, volunteer_id)
values (9, 9);
insert into MEDIC (seniority, volunteer_id)
values (10, 10);
insert into MEDIC (seniority, volunteer_id)
values (1, 11296);
insert into MEDIC (seniority, volunteer_id)
values (1, 11464);
insert into MEDIC (seniority, volunteer_id)
values (1, 11368);
insert into MEDIC (seniority, volunteer_id)
values (1, 11451);
insert into MEDIC (seniority, volunteer_id)
values (1, 11306);
insert into MEDIC (seniority, volunteer_id)
values (8, 11320);
insert into MEDIC (seniority, volunteer_id)
values (2, 11119);
insert into MEDIC (seniority, volunteer_id)
values (6, 11340);
insert into MEDIC (seniority, volunteer_id)
values (7, 11146);
insert into MEDIC (seniority, volunteer_id)
values (5, 11297);
insert into MEDIC (seniority, volunteer_id)
values (1, 11409);
insert into MEDIC (seniority, volunteer_id)
values (5, 11419);
insert into MEDIC (seniority, volunteer_id)
values (6, 11378);
insert into MEDIC (seniority, volunteer_id)
values (4, 11486);
insert into MEDIC (seniority, volunteer_id)
values (1, 11482);
insert into MEDIC (seniority, volunteer_id)
values (2, 11172);
insert into MEDIC (seniority, volunteer_id)
values (5, 11203);
insert into MEDIC (seniority, volunteer_id)
values (6, 11130);
insert into MEDIC (seniority, volunteer_id)
values (3, 11315);
insert into MEDIC (seniority, volunteer_id)
values (6, 11143);
insert into MEDIC (seniority, volunteer_id)
values (7, 11236);
insert into MEDIC (seniority, volunteer_id)
values (7, 11348);
insert into MEDIC (seniority, volunteer_id)
values (9, 11332);
insert into MEDIC (seniority, volunteer_id)
values (5, 11387);
insert into MEDIC (seniority, volunteer_id)
values (3, 11194);
insert into MEDIC (seniority, volunteer_id)
values (2, 11403);
insert into MEDIC (seniority, volunteer_id)
values (1, 11264);
insert into MEDIC (seniority, volunteer_id)
values (4, 11228);
insert into MEDIC (seniority, volunteer_id)
values (1, 11415);
insert into MEDIC (seniority, volunteer_id)
values (9, 11312);
insert into MEDIC (seniority, volunteer_id)
values (1, 11302);
insert into MEDIC (seniority, volunteer_id)
values (5, 11410);
insert into MEDIC (seniority, volunteer_id)
values (3, 11176);
insert into MEDIC (seniority, volunteer_id)
values (7, 11448);
insert into MEDIC (seniority, volunteer_id)
values (6, 11318);
insert into MEDIC (seniority, volunteer_id)
values (8, 11361);
insert into MEDIC (seniority, volunteer_id)
values (8, 11197);
insert into MEDIC (seniority, volunteer_id)
values (4, 11244);
insert into MEDIC (seniority, volunteer_id)
values (1, 11238);
insert into MEDIC (seniority, volunteer_id)
values (9, 11291);
insert into MEDIC (seniority, volunteer_id)
values (3, 11124);
insert into MEDIC (seniority, volunteer_id)
values (4, 11417);
insert into MEDIC (seniority, volunteer_id)
values (4, 11407);
insert into MEDIC (seniority, volunteer_id)
values (9, 11341);
insert into MEDIC (seniority, volunteer_id)
values (7, 11303);
insert into MEDIC (seniority, volunteer_id)
values (9, 11132);
insert into MEDIC (seniority, volunteer_id)
values (8, 11488);
insert into MEDIC (seniority, volunteer_id)
values (3, 11324);
insert into MEDIC (seniority, volunteer_id)
values (9, 11139);
insert into MEDIC (seniority, volunteer_id)
values (2, 11150);
insert into MEDIC (seniority, volunteer_id)
values (5, 11280);
insert into MEDIC (seniority, volunteer_id)
values (5, 11501);
insert into MEDIC (seniority, volunteer_id)
values (6, 11498);
insert into MEDIC (seniority, volunteer_id)
values (5, 11252);
commit;
prompt 64 records loaded
prompt Loading MADICINSHIFT...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (1, 1);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (2, 2);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (3, 3);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (4, 4);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (5, 5);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (7, 7);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (8, 8);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (9, 9);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (10, 10);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11416, 11139);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11452, 11448);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11288, 11194);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11373, 11488);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11169, 11415);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11432, 11203);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11111, 11501);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11208, 11280);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11213, 11378);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11174, 11368);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11473, 11488);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11394, 11451);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11249, 11464);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11476, 3);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11294, 11324);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11489, 11498);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11174, 11341);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11191, 11332);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11348, 4);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11193, 11403);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11276, 11387);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11130, 11130);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11414, 5);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11143, 3);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11486, 1);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11126, 11280);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11439, 11387);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11370, 11172);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11386, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11322, 11378);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11403, 11368);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11113, 11146);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11365, 10);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11131, 11146);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (2, 11143);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11227, 11172);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11234, 11203);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11189, 11448);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11498, 11361);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11386, 11340);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11230, 8);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11345, 10);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11475, 11407);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11510, 11407);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11300, 11451);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11228, 11150);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11500, 11244);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11280, 11409);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11129, 11409);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11360, 11236);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11453, 10);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11410, 11498);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11324, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11116, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11261, 3);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11365, 4);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11233, 11302);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11320, 11280);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11451, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11304, 11302);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11208, 9);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11229, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11168, 11303);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11282, 11124);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11500, 11378);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11385, 11130);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11439, 11238);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11399, 11348);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11497, 11409);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11272, 11341);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11403, 11280);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11259, 11501);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11341, 5);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11190, 11172);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11422, 11417);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11193, 11415);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11412, 11172);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11394, 11387);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11199, 11387);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11159, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11339, 11197);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11360, 11172);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (7, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11397, 11124);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11381, 11150);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11229, 11302);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11376, 9);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11175, 11410);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11277, 11130);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11329, 11315);
commit;
prompt 100 records committed...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11216, 11341);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11345, 9);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11479, 7);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11415, 11486);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11138, 11312);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11290, 11176);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11439, 11143);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11265, 11387);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11506, 11244);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11330, 11378);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11504, 11238);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11411, 11194);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11430, 3);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11151, 11501);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11463, 11451);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11118, 11150);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11261, 11320);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11241, 11146);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11466, 11297);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11423, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11328, 11176);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11167, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11236, 7);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11317, 11407);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11414, 11238);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11260, 11297);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11250, 11410);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11453, 11143);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11389, 11303);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11154, 11488);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11380, 11348);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11407, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11349, 11341);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11318, 11238);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, 9);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11173, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11275, 2);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11437, 11403);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11279, 11448);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11152, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11433, 1);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11383, 11203);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11314, 11236);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11435, 11238);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11465, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11491, 11332);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11207, 11417);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11230, 11501);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11457, 11244);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11327, 11488);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11443, 11318);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11273, 8);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11285, 11407);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11450, 5);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11173, 11291);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11461, 11387);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11120, 11143);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11209, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11245, 7);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11467, 8);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11442, 11150);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11166, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11411, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11500, 11302);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11338, 11419);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11151, 11302);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11146, 10);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11131, 11486);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11235, 11324);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11304, 11378);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11222, 11315);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11122, 11315);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11450, 11486);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11204, 11378);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11497, 11130);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11280, 11448);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11495, 11130);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11167, 3);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (6, 11419);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11317, 11498);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11343, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11222, 11302);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11427, 11312);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11418, 11482);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11392, 11139);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11437, 9);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11196, 11146);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11301, 11264);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11122, 11320);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11146, 11139);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11375, 11486);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11460, 11139);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11370, 11419);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11178, 11132);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11337, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11248, 11340);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11186, 11419);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11284, 8);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11121, 11340);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11196, 8);
commit;
prompt 200 records committed...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11185, 11119);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11395, 11306);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11158, 11130);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11351, 11486);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11483, 11324);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11361, 6);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11499, 11341);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11392, 11244);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11203, 11318);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11222, 11340);
commit;
prompt 210 records loaded
prompt Loading SCHEDULER$_PROGRAM...
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12433, 'dbms_scheduler.auto_purge', 0, 'purge log program', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12436, 'dbms_isched.file_watch_job', 0, 'File Watcher program', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12555, 'dbms_stats.gather_database_stats_job_proc', 0, 'Oracle defined automatic optimizer statistics collection program', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12556, 'dbms_space.auto_space_advisor_job_proc', 0, 'auto space advisor maintenance program', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12557, 'dbms_autotask_prvt.age', 0, 'deletes obsolete AUTOTASK repository data', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12733, 'sys.dbms_hs_parallel_metadata.table_sampling', 12, null, 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12801, 'SYS.DBMS_AQADM_SYS.aq$_propagation_procedure', 10, 'AQ propagation program', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12803, 'DECLARE' || chr(10) || '         ename VARCHAR2(30);' || chr(10) || '       BEGIN' || chr(10) || '         ename := dbms_sqltune.execute_tuning_task(' || chr(10) || '                    ''SYS_AUTO_SQL_TUNING_TASK'');' || chr(10) || '       END;', 0, 'Program to run automatic sql tuning task, see dbmssqlt.sql', 3, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (12913, 'begin if prvt_advisor.is_pack_enabled(''DIAGNOSTIC'') then dbsnmp.bsln_internal.maintain_statistics; end if; end;', 0, 'Moving window baseline statistics maintenance program', 3, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13224, 'SYS.dbms_jdm_internal.build_task', 17, 'Used for building a mining model using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13225, 'SYS.dbms_jdm_internal.test_task', 27, 'Used for testing a mining model using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13226, 'SYS.dbms_jdm_internal.sql_apply_task', 26, 'Used for applying a mining model using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13227, 'SYS.dbms_jdm_internal.export_task', 11, 'Used for exporting a mining model using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13228, 'SYS.dbms_jdm_internal.import_task', 11, 'Used for importing a mining model using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13229, 'SYS.dbms_jdm_internal.xform_task', 18, 'Used for transformation using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13230, 'SYS.dbms_jdm_internal.PREDICT_TASK', 9, 'Used for predict using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13231, 'SYS.dbms_jdm_internal.explain_task', 8, 'Used for explain using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13232, 'SYS.dbms_jdm_internal.profile_task', 8, 'Used for profile using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
insert into SCHEDULER$_PROGRAM (obj#, action, number_of_args, comments, flags, schedule_limit, priority, job_weight, max_runs, max_failures, max_run_duration, nls_env, env, run_count)
values (13233, 'SYS.dbms_jdm_internal.xform_seq_task', 7, 'Used for transformation sequence task using JDM API', 5, null, 3, 1, null, null, null, 'NLS_LANGUAGE=''AMERICAN'' NLS_TERRITORY=''AMERICA'' NLS_CURRENCY=''$'' NLS_ISO_CURRENCY=''AMERICA'' NLS_NUMERIC_CHARACTERS=''.,'' NLS_CALENDAR=''GREGORIAN'' NLS_DATE_FORMAT=''DD-MON-RR'' NLS_DATE_LANGUAGE=''AMERICAN'' NLS_SORT=''BINARY'' NLS_TIME_FORMAT=''HH.MI.SSXFF AM'' NLS_TIMESTAMP_FORMAT=''DD-MON-RR HH.MI.SSXFF AM'' NLS_TIME_TZ_FORMAT=''HH.MI.SSXFF AM TZR'' NLS_TIMESTAMP_TZ_FORMAT=''DD-MON-RR HH.MI.SSXFF AM TZR'' NLS_DUAL_CURRENCY=''$'' NLS_COMP=''BINARY'' NLS_LENGTH_SEMANTICS=''BYTE'' NLS_NCHAR_CONV_EXCP=''FALSE''', '010200000A000000', null);
commit;
prompt 19 records loaded
prompt Enabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT enable constraint SYS_C008537;
alter table AMBUTOEVENT enable constraint SYS_C008538;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C008524;
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C008520;
prompt Enabling foreign key constraints for SHIFT...
alter table SHIFT enable constraint SYS_C008546;
alter table SHIFT enable constraint SYS_C008547;
prompt Enabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable constraint SYS_C008556;
alter table DRIVERINSHIFT enable constraint SYS_C008557;
prompt Enabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable constraint SYS_C008532;
alter table DRIVERTOAMBU enable constraint SYS_C008533;
prompt Enabling foreign key constraints for MEDIC...
alter table MEDIC enable constraint SYS_C008528;
prompt Enabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT enable constraint SYS_C008551;
alter table MADICINSHIFT enable constraint SYS_C008552;
prompt Enabling triggers for AMBULANS...
alter table AMBULANS enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT enable all triggers;
prompt Enabling triggers for VOLUNTEER...
alter table VOLUNTEER enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for PARAMEDIC...
alter table PARAMEDIC enable all triggers;
prompt Enabling triggers for SHIFT...
alter table SHIFT enable all triggers;
prompt Enabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable all triggers;
prompt Enabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable all triggers;
prompt Enabling triggers for MEDIC...
alter table MEDIC enable all triggers;
prompt Enabling triggers for MADICINSHIFT...
alter table MADICINSHIFT enable all triggers;
prompt Enabling triggers for SCHEDULER$_PROGRAM...
alter table SCHEDULER$_PROGRAM enable all triggers;
set feedback on
set define on
prompt Done.
