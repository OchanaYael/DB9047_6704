prompt PL/SQL Developer import file
prompt Created on יום רביעי 29 מאי 2024 by חני סקורי
set feedback off
set define off
prompt Creating AMBULANS...
create table AMBULANS
(
  locaation    VARCHAR2(15) not null,
  ambulance_id INTEGER not null,
  ambulancenum INTEGER not null,
  tipe         VARCHAR2(10) not null,
  status       VARCHAR2(15) not null
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
prompt Disabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT disable constraint SYS_C008266;
alter table AMBUTOEVENT disable constraint SYS_C008267;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C008253;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C008249;
prompt Disabling foreign key constraints for SHIFT...
alter table SHIFT disable constraint SYS_C008275;
alter table SHIFT disable constraint SYS_C008276;
prompt Disabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable constraint SYS_C008285;
alter table DRIVERINSHIFT disable constraint SYS_C008286;
prompt Disabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable constraint SYS_C008261;
alter table DRIVERTOAMBU disable constraint SYS_C008262;
prompt Disabling foreign key constraints for MEDIC...
alter table MEDIC disable constraint SYS_C008257;
prompt Disabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT disable constraint SYS_C008280;
alter table MADICINSHIFT disable constraint SYS_C008281;
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
values ('New York', 381, 153, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Miyazaki', 755, 913, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chemnitz', 764, 228, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Orleans', 726, 384, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('New Delhi', 699, 959, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Clark', 389, 928, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tokushima', 292, 115, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lisbon', 329, 422, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Redwood City', 162, 354, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Flushing', 377, 467, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lubbock', 246, 946, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edinburgh', 536, 362, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lincoln', 818, 753, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Aachen', 738, 962, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hartford', 138, 262, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rochester', 227, 414, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lake Forest', 544, 789, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maintenon', 229, 988, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nuernberg', 633, 642, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kצln', 495, 934, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kanazawa', 589, 225, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sidney', 813, 167, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('North bethesda', 439, 949, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Warrenton', 413, 842, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Woking', 324, 173, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bloemfontein', 215, 115, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valencia', 788, 717, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ithaca', 539, 748, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('North bethesda', 584, 196, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Akron', 113, 746, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Elkins Park', 763, 593, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lake worth', 665, 472, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edinburgh', 458, 153, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Velizy Villacou', 514, 268, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Northbrook', 734, 214, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lefkosa', 939, 177, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hilversum', 962, 555, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('California', 178, 431, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Storrington', 225, 184, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Petach-Tikva', 214, 516, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Obfelden', 657, 355, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Friedrichshafe', 148, 797, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lake Oswego', 673, 585, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Johor Bahru', 966, 638, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa Cruz', 342, 522, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Rochester', 729, 479, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nepean', 144, 325, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dartmouth', 642, 334, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Francisco', 379, 229, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Edmonton', 632, 757, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Redhill', 795, 553, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brampton', 371, 493, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wehrheim', 877, 433, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Doncaster', 259, 695, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pretoria', 433, 642, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Washington', 874, 859, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('West Launceston', 174, 646, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Boucherville', 812, 667, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chambery', 156, 957, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Traralgon', 291, 546, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Westport', 978, 191, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Quיbec', 158, 353, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Roma', 826, 593, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Towson', 317, 739, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tampa', 688, 852, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dortmund', 692, 564, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fukui', 157, 427, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Altamonte Sprin', 666, 334, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Benbrook', 614, 398, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Holts Summit', 972, 832, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Libertyville', 339, 331, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lake Oswego', 773, 688, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mclean', 758, 418, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmingham', 481, 418, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barueri', 171, 376, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Soroe', 465, 334, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Banbury', 618, 214, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Parma', 624, 143, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Immenstaad', 365, 342, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Luzern', 733, 128, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bedfordshire', 472, 947, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gothenburg', 794, 843, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Erlangen', 727, 891, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('East Peoria', 346, 516, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Brugherio', 779, 861, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Elkins Park', 424, 928, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Los Alamos', 714, 248, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Horsens', 891, 463, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lippetal', 929, 694, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Albany', 724, 742, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('East Peoria', 942, 286, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santorso', 165, 734, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Den Haag', 396, 741, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Fort Lee', 182, 215, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Niigata', 468, 278, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dreieich', 785, 452, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Barueri', 411, 239, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lecanto', 823, 761, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lodi', 337, 923, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santiago', 282, 647, 'motorcycle', 'notavailable''');
commit;
prompt 100 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wageningen', 684, 274, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ann Arbor', 6981, 7725, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mapo-gu', 5921, 3725, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kingston', 5317, 7815, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dorval', 3373, 2449, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Chicago', 5325, 6894, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Issaquah', 9763, 3643, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Dalmine', 7439, 8778, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmingham', 1596, 7442, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bay Shore', 4644, 8831, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('San Mateo', 3168, 6588, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Singapore', 2715, 1939, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Toledo', 7994, 9281, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nepean', 3779, 8912, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Elche', 6388, 8845, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sendai', 7221, 9434, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Auckland', 3125, 6234, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Exeter', 4199, 5549, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Springfield', 8696, 9146, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Greenville', 4543, 8189, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oldenburg', 3561, 2818, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paisley', 4658, 6324, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Trieste', 9979, 4823, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Woodland Hills', 9415, 4562, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Stellenbosch', 2737, 4198, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ankara', 6384, 9542, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Tucson', 3691, 9537, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lowell', 9585, 1856, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hampton', 2767, 1277, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bollensen', 4598, 7894, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Olivette', 6648, 3376, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Sundsvall', 3859, 3613, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ebersberg', 5672, 5246, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waco', 9769, 1946, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Park Ridge', 5113, 6472, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Durham', 6798, 8554, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Douala', 7434, 2859, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Burlington', 8224, 5928, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oshkosh', 4728, 2399, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gaithersburg', 2554, 2157, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Immenstaad', 3431, 5171, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waterloo', 8261, 5428, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Libertyville', 6259, 6333, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Newbury', 3782, 6218, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('King of Prussia', 1196, 3557, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Padova', 9136, 3944, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Murray', 8848, 5657, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kingston', 6248, 8431, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Haverhill', 4963, 4989, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Pasadena', 9744, 5468, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paramus', 4973, 1342, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Zipf', 8846, 8368, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Charleston', 7243, 3267, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Meerbusch', 1777, 1137, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Denver', 7693, 5335, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Oberwangen', 3997, 1881, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Silverdale', 1685, 9533, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Birmingham', 4295, 4495, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Portland', 7237, 9611, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Lexington', 1687, 1279, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cedar Park', 7114, 3177, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Belmont', 4579, 3917, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Treviso', 7459, 3993, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa Clarat', 3673, 6527, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Marburg', 2328, 5588, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ashdod', 4143, 5769, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Storrington', 9356, 1517, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mississauga', 9299, 6598, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Calgary', 9854, 9593, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Woodland Hills', 4184, 2392, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Seattle', 7715, 7614, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Swannanoa', 6639, 5399, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Arlington', 1862, 3976, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Suberg', 2127, 7373, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Athens', 4511, 9481, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Nynהshamn', 6572, 4854, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Paramus', 1653, 6992, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Bollensen', 1772, 5778, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('East sussex', 5883, 9858, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Royersford', 1761, 7256, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Valladolid', 7798, 6986, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Highton', 9288, 4691, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Salvador', 8924, 4597, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Prague', 7512, 9785, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Moorestown', 2573, 6326, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Santa Fe', 5937, 1497, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Mapo-gu', 3541, 9725, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kista', 8339, 8281, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Gainesville', 9331, 5181, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Waalwijk', 6929, 1416, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kejae City', 8333, 8116, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Las Vegas', 6338, 3244, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Conshohocken', 8834, 9665, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Kevelaer', 5189, 3356, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Giessen', 7575, 5893, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Wuerzburg', 2666, 4899, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Milton', 8628, 2262, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Daejeon', 1285, 5711, 'Van', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Magstadt', 9733, 3772, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Hyderabad', 1449, 4392, 'Van', 'available');
commit;
prompt 200 records committed...
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('West Monroe', 4693, 8758, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Singapore', 4152, 1619, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Den Haag', 111, 111, 'motorcycle', 'notavailable''');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Ft. Lauderdale', 112, 112, 'motorcycle', 'available');
commit;
prompt 204 records loaded
prompt Loading EVENT...
insert into EVENT (event_id, deescription, locaation, date_time)
values (11111, 'Shooting Attack', 'Wehrheim', to_date('26-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11112, 'Shooting Attack', 'Almaty', to_date('02-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11113, 'Birth', 'Fukui', to_date('16-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11114, 'Shooting Attack', 'Cheshire', to_date('31-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11115, 'Shooting Attack', 'Sursee', to_date('03-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11116, 'Electrocution', 'Shoreline', to_date('16-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11117, 'Birth', 'Glen allen', to_date('15-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11118, 'Shooting Attack', 'Milan', to_date('30-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11119, 'Birth', 'Udine', to_date('25-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11120, 'Electrocution', 'Conshohocken', to_date('01-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11121, 'Burn', 'Zagreb', to_date('07-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11122, 'Car Accident', 'Lisboa', to_date('19-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11123, 'Shooting Attack', 'Regensburg', to_date('25-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11124, 'Heart Attack', 'Tucson', to_date('11-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11125, 'Shooting Attack', 'Almaty', to_date('01-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11126, 'Burn', 'Lexington', to_date('30-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11127, 'Birth', 'Trieste', to_date('05-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11128, 'Car Accident', 'Verwood', to_date('15-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11129, 'Birth', 'Sדo paulo', to_date('22-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11130, 'Electrocution', 'Lancaster', to_date('20-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11131, 'Heart Attack', 'Bonn', to_date('18-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11132, 'Shooting Attack', 'Maceio', to_date('12-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11133, 'Car Accident', 'Yucca', to_date('19-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11134, 'Electrocution', 'San Antonio', to_date('09-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11135, 'Shooting Attack', 'Juazeiro', to_date('25-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11136, 'Electrocution', 'Herzlia', to_date('21-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11137, 'Car Accident', 'Ann Arbor', to_date('15-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11138, 'Heart Attack', 'Hampton', to_date('09-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11139, 'Electrocution', 'Kumamoto', to_date('25-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11140, 'Birth', 'Market Harborough', to_date('29-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11141, 'Birth', 'Graz', to_date('21-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11142, 'Electrocution', 'Freiburg', to_date('21-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11143, 'Heart Attack', 'Sydney', to_date('23-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11144, 'Car Accident', 'Douala', to_date('09-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11145, 'Burn', 'Brussel', to_date('07-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11146, 'Shooting Attack', 'Conshohocken', to_date('05-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11147, 'Electrocution', 'Redwood Shores', to_date('16-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11148, 'Heart Attack', 'San Jose', to_date('15-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11149, 'Shooting Attack', 'Boulogne', to_date('15-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11150, 'Heart Attack', 'Reykjavik', to_date('19-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11151, 'Car Accident', 'Ferraz  vasconcelos', to_date('18-02-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11152, 'Electrocution', 'Brampton', to_date('08-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11153, 'Birth', 'Berkshire', to_date('05-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11154, 'Car Accident', 'Adelaide', to_date('01-11-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11155, 'Heart Attack', 'Fukuoka', to_date('11-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11156, 'Birth', 'Gifu', to_date('02-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11157, 'Shooting Attack', 'Aracruz', to_date('08-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11158, 'Electrocution', 'San Jose', to_date('07-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11159, 'Burn', 'Mapo-gu', to_date('02-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11160, 'Electrocution', 'San Diego', to_date('27-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11161, 'Heart Attack', 'Swannanoa', to_date('17-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11162, 'Burn', 'San Francisco', to_date('23-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11163, 'Heart Attack', 'St-laurent', to_date('07-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11164, 'Heart Attack', 'Paris', to_date('21-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11165, 'Electrocution', 'West Windsor', to_date('31-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11166, 'Car Accident', 'Chapel hill', to_date('23-02-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11167, 'Shooting Attack', 'Ipswich', to_date('06-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11168, 'Car Accident', 'Fountain Hills', to_date('29-07-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11169, 'Birth', 'Oklahoma city', to_date('20-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11170, 'Burn', 'Narrows', to_date('16-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11171, 'Shooting Attack', 'Yomgok-dong', to_date('16-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11172, 'Heart Attack', 'Taoyuan', to_date('30-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11173, 'Electrocution', 'Ohita', to_date('23-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11174, 'Car Accident', 'Or-yehuda', to_date('07-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11175, 'Burn', 'Piacenza', to_date('09-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11176, 'Burn', 'Green bay', to_date('30-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11177, 'Birth', 'Nordhausen', to_date('30-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11178, 'Electrocution', 'Lummen', to_date('16-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11179, 'Car Accident', 'Mclean', to_date('24-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11180, 'Birth', 'Wichita', to_date('02-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11181, 'Burn', 'Niles', to_date('14-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11182, 'Shooting Attack', 'Conshohocken', to_date('25-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11183, 'Electrocution', 'Lisbon', to_date('20-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11184, 'Birth', 'Pensacola', to_date('09-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11185, 'Burn', 'Vista', to_date('10-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11186, 'Heart Attack', 'West Launceston', to_date('06-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11187, 'Heart Attack', 'Slough', to_date('15-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11188, 'Car Accident', 'Huntington', to_date('12-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11189, 'Shooting Attack', 'Freiburg', to_date('10-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11190, 'Birth', 'Toyama', to_date('15-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11191, 'Burn', 'Park Ridge', to_date('06-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11192, 'Heart Attack', 'Dearborn', to_date('14-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11193, 'Burn', 'Johannesburg', to_date('28-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11194, 'Burn', 'Sendai', to_date('16-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11195, 'Birth', 'Belgrad', to_date('21-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11196, 'Car Accident', 'Nizhnevartovsk', to_date('24-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11197, 'Heart Attack', 'Wilmington', to_date('07-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11198, 'Heart Attack', 'Boston', to_date('20-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11199, 'Shooting Attack', 'Santa Clarat', to_date('22-01-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11200, 'Car Accident', 'Bergara', to_date('26-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11201, 'Electrocution', 'Aomori', to_date('26-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11202, 'Birth', 'Durham', to_date('29-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11203, 'Birth', 'Scottsdale', to_date('04-10-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11204, 'Birth', 'Waco', to_date('02-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11205, 'Heart Attack', 'Appenzell', to_date('21-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11206, 'Birth', 'Protvino', to_date('07-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11207, 'Car Accident', 'Dartmouth', to_date('08-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11208, 'Car Accident', 'Saudarkrokur', to_date('11-07-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11209, 'Electrocution', 'Saitama', to_date('02-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11210, 'Electrocution', 'Duluth', to_date('30-09-2023', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into EVENT (event_id, deescription, locaation, date_time)
values (11211, 'Car Accident', 'Birmingham', to_date('03-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11212, 'Heart Attack', 'Baarn', to_date('03-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11213, 'Electrocution', 'Rozenburg', to_date('13-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11214, 'Heart Attack', 'Olsztyn', to_date('10-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11215, 'Car Accident', 'Brno', to_date('08-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11216, 'Heart Attack', 'Kungens kurva', to_date('08-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11217, 'Shooting Attack', 'Pompeia', to_date('09-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11218, 'Burn', 'Sapporo', to_date('11-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11219, 'Car Accident', 'Pordenone', to_date('01-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11220, 'Shooting Attack', 'Ismaning', to_date('23-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11221, 'Electrocution', 'Palma de Mallorca', to_date('04-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11222, 'Shooting Attack', 'Abbotsford', to_date('22-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11223, 'Birth', 'Cheshire', to_date('21-01-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11224, 'Burn', 'New Hope', to_date('10-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11225, 'Burn', 'Carlingford', to_date('14-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11226, 'Birth', 'Hyderabad', to_date('13-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11227, 'Birth', 'Neuchגtel', to_date('29-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11228, 'Heart Attack', 'Paחo de Arcos', to_date('03-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11229, 'Car Accident', 'Karachi', to_date('18-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11230, 'Birth', 'Nara', to_date('07-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11231, 'Burn', 'Aberdeen', to_date('23-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11232, 'Car Accident', 'Pasadena', to_date('15-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11233, 'Shooting Attack', 'Libertyville', to_date('03-06-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11234, 'Electrocution', 'Bergen', to_date('12-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11235, 'Burn', 'Bergara', to_date('15-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11236, 'Heart Attack', 'Changwon-si', to_date('01-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11237, 'Car Accident', 'Maidenhead', to_date('18-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11238, 'Electrocution', 'London', to_date('08-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11239, 'Heart Attack', 'Irving', to_date('12-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11240, 'Car Accident', 'Nantes', to_date('23-03-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11241, 'Car Accident', 'Goteborg', to_date('18-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11242, 'Burn', 'Greenville', to_date('02-09-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11243, 'Burn', 'Toledo', to_date('15-02-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11244, 'Car Accident', 'Rochester', to_date('18-12-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11245, 'Car Accident', 'Tooele', to_date('04-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11246, 'Electrocution', 'Vanderbijlpark', to_date('27-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11247, 'Car Accident', 'West Lafayette', to_date('04-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11248, 'Car Accident', 'Dublin', to_date('21-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11249, 'Birth', 'Nashua', to_date('14-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11250, 'Heart Attack', 'Redwood City', to_date('12-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11251, 'Burn', 'Tooele', to_date('12-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11252, 'Heart Attack', 'Irkutsk', to_date('05-06-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11253, 'Burn', 'Pecs', to_date('30-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11254, 'Car Accident', 'New Hope', to_date('18-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11255, 'Birth', 'Wehrheim', to_date('01-09-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11256, 'Electrocution', 'Sacramento', to_date('26-12-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11257, 'Electrocution', 'Drogenbos', to_date('15-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11258, 'Burn', 'Peine', to_date('14-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11259, 'Heart Attack', 'Vancouver', to_date('25-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11260, 'Electrocution', 'Colombo', to_date('20-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11261, 'Shooting Attack', 'Naestved', to_date('06-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11262, 'Car Accident', 'Moorestown', to_date('06-04-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11263, 'Car Accident', 'Harrisburg', to_date('16-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11264, 'Heart Attack', 'Dunn loring', to_date('22-08-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11265, 'Heart Attack', 'Bedfordshire', to_date('28-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11266, 'Birth', 'Kozani', to_date('23-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11267, 'Shooting Attack', 'North Point', to_date('30-05-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11268, 'Electrocution', 'Stavanger', to_date('19-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11269, 'Car Accident', 'Kצln', to_date('19-05-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11270, 'Heart Attack', 'Sydney', to_date('04-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11271, 'Shooting Attack', 'Valencia', to_date('11-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11272, 'Burn', 'Caguas', to_date('01-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11273, 'Car Accident', 'Lubbock', to_date('18-01-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11274, 'Electrocution', 'Peachtree City', to_date('03-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11275, 'Burn', 'Royersford', to_date('31-07-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11276, 'Burn', 'Verdun', to_date('30-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11277, 'Heart Attack', 'Bracknell', to_date('07-11-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11278, 'Car Accident', 'Varzea grande', to_date('16-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11279, 'Birth', 'Mogi Guacu', to_date('27-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11280, 'Electrocution', 'Agoncillo', to_date('18-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11281, 'Shooting Attack', 'New Haven', to_date('04-11-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11282, 'Electrocution', 'Bremen', to_date('28-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11283, 'Heart Attack', 'Manaus', to_date('04-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11284, 'Electrocution', 'Nagasaki', to_date('19-06-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11285, 'Car Accident', 'Bad Camberg', to_date('26-09-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11286, 'Heart Attack', 'N. ft. Myers', to_date('28-12-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11287, 'Burn', 'Dreieich', to_date('27-10-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11288, 'Birth', 'Ehningen', to_date('27-06-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11289, 'Shooting Attack', 'Chiba', to_date('19-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11290, 'Heart Attack', 'Double Oak', to_date('12-10-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11291, 'Car Accident', 'Lincoln', to_date('07-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11292, 'Heart Attack', 'West Sussex', to_date('14-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11293, 'Burn', 'Wakayama', to_date('19-08-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11294, 'Burn', 'St-laurent', to_date('06-05-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11295, 'Shooting Attack', 'Bloomington', to_date('06-04-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11296, 'Burn', 'Stans', to_date('01-03-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11297, 'Car Accident', 'Pordenone', to_date('16-05-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11298, 'Heart Attack', 'Boise', to_date('11-07-2021', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11299, 'Heart Attack', 'Stoneham', to_date('10-08-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11300, 'Burn', 'Carmichael', to_date('05-04-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11301, 'Burn', 'Hayward', to_date('13-08-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11302, 'Car Accident', 'Bronx', to_date('11-10-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11303, 'Shooting Attack', 'Nicosia', to_date('11-11-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11304, 'Electrocution', 'Bruxelles', to_date('07-03-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11305, 'Burn', 'Wuerzburg', to_date('03-12-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11306, 'Shooting Attack', 'Hercules', to_date('29-01-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11307, 'Burn', 'Duisburg', to_date('08-03-2023', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11308, 'Shooting Attack', 'durham', to_date('04-09-2020', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11309, 'Car Accident', 'Wetzlar', to_date('05-02-2022', 'dd-mm-yyyy'));
insert into EVENT (event_id, deescription, locaation, date_time)
values (11310, 'Birth', 'Dalmine', to_date('31-05-2021', 'dd-mm-yyyy'));
commit;
prompt 200 records loaded
prompt Loading AMBUTOEVENT...
insert into AMBUTOEVENT (ambulance_id, event_id)
values (962, 11258);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (2127, 11242);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (729, 11224);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (377, 11276);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5189, 11125);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8924, 11193);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3431, 11199);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (589, 11141);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (726, 11241);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5937, 11137);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (339, 11164);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (642, 11113);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (624, 11269);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (877, 11294);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (113, 11111);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (813, 11149);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (584, 11114);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (329, 11179);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (823, 11123);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (156, 11264);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4693, 11152);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9415, 11140);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4543, 11208);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8333, 11231);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7994, 11160);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (5189, 11305);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (688, 11231);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (826, 11281);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (818, 11165);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7715, 11148);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (734, 11175);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (227, 11229);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (812, 11201);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7114, 11258);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3859, 11300);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (182, 11194);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (3673, 11181);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (1653, 11132);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (8628, 11223);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (939, 11154);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (9979, 11282);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (874, 11170);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (755, 11112);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (962, 11292);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (2666, 11239);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (4295, 11290);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (6798, 11180);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (632, 11173);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (7434, 11157);
insert into AMBUTOEVENT (ambulance_id, event_id)
values (2573, 11152);
commit;
prompt 50 records loaded
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1111, 'VendettaMorton', 2288823947, '75 Mazar Street', to_date('20-04-1970', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1112, 'MaureenLevy', 3138732621, '31st Street', to_date('27-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1113, 'BradleyDuvall', 6443191859, '38 Greenville', to_date('21-09-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1114, 'DylanLaBelle', 9168172696, '10 Los Alamos Road', to_date('01-06-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1115, 'ChristmasKimball', 4967763536, '4 Akron Road', to_date('08-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1116, 'TimothyWithers', 9495299979, '95 Conroy Drive', to_date('11-08-1977', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1117, 'CampbellCopeland', 9373576679, '50 Vince Drive', to_date('28-04-1972', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1118, 'VickieShand', 7656484674, '712 Frederic Street', to_date('22-06-1974', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1119, 'KevinMatheson', 4318277271, '89 Tokyo Street', to_date('17-08-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1120, 'DabneyLeary', 2273878667, '57 Morton', to_date('02-02-1979', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1121, 'ThelmaTate', 2127163775, '11 Durning Road', to_date('29-10-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1122, 'JohnFlemyng', 4563926469, '96 Doncaster', to_date('29-06-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1123, 'GabrielleMichael', 1626464159, '6 Sevenfold Street', to_date('23-10-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1124, 'PatBalk', 2788373835, '16 Charlottesville Ave', to_date('04-02-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1125, 'LuisEngland', 9681321918, '864 Weller Road', to_date('02-11-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1126, 'DennyBirch', 4684364478, '98 Cattrall Street', to_date('12-12-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1127, 'LinConnery', 4586676599, '95 Dench Road', to_date('01-02-1975', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (1128, 'RhettKleinenberg', 4917423998, '69 Fuchstal-asch Street', to_date('23-03-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2111, 'WallaceWomack', 8486653252, '81st Street', to_date('05-05-1976', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2112, 'WallaceCooper', 4647773791, '380 Chapeco Street', to_date('09-08-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2113, 'SimonAkins', 9872216193, '40 Kim Drive', to_date('01-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2114, 'JulietSorvino', 1256631547, '29 Sutherland Drive', to_date('14-01-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2115, 'LeaCoverdale', 3746792214, '51 Carmen Drive', to_date('19-12-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2116, 'DougConnelly', 2311944938, '86 Levert Street', to_date('21-12-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2117, 'TayeLithgow', 5393452387, '44 Reubens', to_date('29-06-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2118, 'PeterUnger', 7128222686, '48 Colman Street', to_date('21-05-1978', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2119, 'RosannaKilmer', 3471296222, '61st Street', to_date('24-12-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2120, 'MartinReno', 2191221263, '81 Paal Beringen Drive', to_date('04-09-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2121, 'SwoosieClinton', 1876459846, '27 Famke Street', to_date('16-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2122, 'LisaZahn', 4758387446, '34 Toledo Road', to_date('14-04-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2123, 'DonBurrows', 2379866782, '16 Freda Street', to_date('28-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2124, 'AaronWeaving', 7299827487, '65 McNarland Street', to_date('02-03-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2125, 'HiltonMazar', 6974731842, '57 Kristiansand Road', to_date('02-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2126, 'DonalLang', 7832961925, '83 New orleans Road', to_date('07-11-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2127, 'MatthewHagar', 5968915736, '50 Vince Ave', to_date('25-02-1972', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2128, 'LonnieRifkin', 3571386761, '95 Hoskins Drive', to_date('28-01-1972', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2129, 'GinoMidler', 9451994867, '34 Canal Winchester Drive', to_date('23-08-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2130, 'PamelaMason', 2131196123, '81 Dolenz Street', to_date('18-03-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2131, 'JesseKapanka', 3331756973, '80 Schneider Road', to_date('29-01-1972', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2132, 'HalleArkin', 5261212778, '63rd Street', to_date('17-11-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2133, 'BrendaMcDowell', 4797926374, '76 Nugent Street', to_date('16-07-1978', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2134, 'MarianneSchwarzenegg', 8359843724, '727 Joely Drive', to_date('16-04-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2135, 'RadeTheron', 3344582126, '739 Delafield', to_date('30-05-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2136, 'JesseBell', 5949944815, '56 Waltham Road', to_date('22-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2137, 'RodneyLavigne', 1394143931, '42nd Street', to_date('03-09-1975', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2138, 'WallyNiven', 6467871341, '152 Darmstadt Road', to_date('17-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2139, 'LarryGibson', 1852287184, '83 Keaton Street', to_date('06-05-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2140, 'DarLoggins', 1651736693, '39 Stowe Road', to_date('10-03-2004', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2141, 'GeoffreyWeaving', 9516466765, '338 Carrie Drive', to_date('15-01-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2142, 'LindseyHolland', 8583465269, '664 Ledger Blvd', to_date('21-12-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2143, 'LorraineJanney', 9598829472, '35 Addy Street', to_date('25-07-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2144, 'DebbieMorton', 2775448463, '37 Rich Road', to_date('17-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2145, 'JoelyDiCaprio', 9269917566, '84 Lindo Street', to_date('29-07-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2146, 'MenaCamp', 6392964421, '615 Louise Road', to_date('23-08-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2147, 'EthanCarradine', 7797345423, '70 Jackman Ave', to_date('18-09-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2148, 'ColmScheider', 3548982977, '2 McFadden Drive', to_date('18-11-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2149, 'RadneyZane', 3164684229, '89 Makeba Ave', to_date('26-02-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2150, 'KylieLee', 7882442638, '14 Ryan Blvd', to_date('27-07-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2151, 'JaredCarter', 5281722322, '99 Clark Drive', to_date('18-10-2004', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2152, 'DaveyClarkson', 2344859134, '11st Street', to_date('07-03-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2153, 'JuliaFrost', 5255329586, '85 Portland Ave', to_date('04-08-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2154, 'JoseLaBelle', 1261486515, '73 Judy Road', to_date('04-06-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2155, 'MarianneBridges', 8422668513, '162 Walter Road', to_date('20-07-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2156, 'AvrilNelligan', 8926415366, '82 Meryl Street', to_date('21-05-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2157, 'ElisabethCollins', 6116659425, '50 Gano Street', to_date('04-08-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2158, 'OrlandoHauser', 7462513919, '13rd Street', to_date('26-03-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2159, 'MandySchock', 9792938743, '602 Annette', to_date('13-08-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2160, 'OssieGuzman', 2491589298, '55 Merchant Ave', to_date('16-01-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2161, 'RowanEckhart', 6753993891, '31 West Windsor Street', to_date('07-08-1979', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2162, 'ColleenShocked', 2552348562, '12 Bandy Ave', to_date('16-02-1976', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2163, 'AndieRippy', 6653268851, '85 Bonham', to_date('11-09-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2164, 'MirandaRyan', 5231838969, '79 Kennedy Street', to_date('04-05-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2165, 'LucyGleeson', 9764315926, '95 Coquitlam Ave', to_date('24-03-1973', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2166, 'AlessandroCaine', 6978954526, '1 Robbie Road', to_date('16-02-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2167, 'HugoWen', 6911332618, '86 Osbourne Road', to_date('05-08-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2168, 'MartyPierce', 6356447611, '72 Sainte-Marie Drive', to_date('02-02-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2169, 'MarkSweet', 8118963792, '46 Klugh Drive', to_date('04-01-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2170, 'AnnieJamal', 7558229533, '34 Leipzig Street', to_date('11-06-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2171, 'TerenceKravitz', 3391835388, '1 Lauper Street', to_date('05-05-1982', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2172, 'SamuelHarary', 5122432388, '40 Crowell Street', to_date('14-04-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2173, 'TanyaAvalon', 3953254256, '14 Brown', to_date('03-02-1978', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2174, 'RichardLaSalle', 7988276888, '68 McElhone Road', to_date('19-08-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2175, 'LorraineDushku', 4138736382, '891 Hobson Ave', to_date('01-08-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2176, 'WilliamVai', 7883319961, '76 Springfield Ave', to_date('20-06-1979', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2177, 'RoscoSaxon', 4511243215, '53 Jay Road', to_date('24-04-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2178, 'EarlPlimpton', 4887981668, '24 Narrows', to_date('19-11-1974', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2179, 'JulieCassidy', 8669716611, '696 Mould Drive', to_date('14-02-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2180, 'DarMcFadden', 6774419146, '11 Griggs Drive', to_date('05-12-1971', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2181, 'ChristopherHershey', 9798291239, '97 Doucette Street', to_date('27-02-1976', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2182, 'OdedDiBiasio', 4762853991, '949 Hanover Street', to_date('21-03-2000', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2183, 'DeborahAddy', 3957166535, '29 Edward Drive', to_date('13-09-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2184, 'AustinWesterberg', 8464874716, '23 Richard Street', to_date('07-12-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2185, 'ArminGilliam', 7955755742, '60 Rich Road', to_date('29-05-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2186, 'AdinaSwank', 5617539391, '75 Suberg Road', to_date('22-11-1974', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2187, 'GordieMcClinton', 9971822226, '52 Sendai Road', to_date('26-12-1983', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2188, 'NaomiDeGraw', 3324457753, '1 Voight Street', to_date('29-11-1977', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2189, 'ElvisWarren', 5557574435, '5 Romijn-Stamos Ave', to_date('12-05-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2190, 'ZooeyMacht', 3485357456, '57 Dillane Drive', to_date('26-02-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2191, 'MarlonPalmer', 8837851119, '38 Franco Ave', to_date('17-10-1995', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2192, 'RorySedgwick', 3676564879, '42 DiBiasio Street', to_date('11-01-2001', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2193, 'AlanaCulkin', 5313582959, '5 Feore Street', to_date('08-05-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2194, 'BoydPleasure', 6422112564, '35 Fukuoka Street', to_date('12-10-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2195, 'PatVinton', 9362661159, '826 Peter Street', to_date('05-12-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2196, 'RebekaAlston', 7256198196, '15 Easton Road', to_date('06-01-1973', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2197, 'RickyWolf', 5842324473, '82nd Street', to_date('16-09-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2198, 'RoscoePostlethwaite', 6321992588, '631 Rebeka Drive', to_date('09-01-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2199, 'BebeDetmer', 1299894265, '41 Griffiths Road', to_date('26-03-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2200, 'OlympiaPalmer', 6534654341, '97 Minogue Drive', to_date('23-12-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2201, 'BrianGold', 2545669562, '218 Rupert Road', to_date('26-07-1999', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2202, 'MekhiBrooks', 8645536675, '38 Walker Street', to_date('06-03-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2203, 'ParkerBurke', 5825273847, '35 Rockland Street', to_date('05-08-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2204, 'OlympiaMcKean', 1136173783, '56 Travers Street', to_date('31-12-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2205, 'ColinRebhorn', 1968466966, '42nd Street', to_date('06-08-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2206, 'KaseyBall', 8192231486, '372 Romijn-Stamos Street', to_date('30-01-1988', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2207, 'WillemJohansen', 5911259986, '50 Love Street', to_date('13-08-1970', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2208, 'JulianneBeals', 3932529591, '96 Lofgren Blvd', to_date('31-07-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2209, 'PenelopeDysart', 8214395727, '26 Den Haag Drive', to_date('15-03-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2210, 'TeaQuinn', 5816939362, '548 Eat World Blvd', to_date('16-01-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2211, 'OroDevine', 8895712142, '68 Raymond Drive', to_date('16-10-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2212, 'GoranVan Damme', 7214833422, '80 Coslada Blvd', to_date('07-09-1970', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2213, 'LouGiraldo', 9284763625, '28 Derwood Drive', to_date('19-06-1975', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2214, 'LynnHersh', 6158925552, '17 Stuart', to_date('23-01-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2215, 'SwoosieMolina', 8294538558, '183 Lloyd Street', to_date('08-07-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2216, 'MariaMarley', 1374252475, '43 Sylvester Street', to_date('12-10-1978', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2217, 'ViennaStatham', 4129471387, '48 Burmester Road', to_date('30-09-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2218, 'JefferyPride', 6546483311, '54 McNeice Road', to_date('18-01-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2219, 'MaceoCurfman', 1529239667, '33 Crete Road', to_date('16-06-1973', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2220, 'JacksonStiers', 1665233321, '850 Koufu Road', to_date('23-10-1980', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2221, 'HollandDanes', 3788663248, '637 Geldof Drive', to_date('31-07-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2222, 'PatSupernaw', 8742946742, '96 Dunn Blvd', to_date('05-03-1979', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2223, 'MillieLiotta', 6857624579, '47 Ritchie Road', to_date('20-12-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2224, 'JacksonHarris', 9745549734, '13 Mnster Drive', to_date('18-02-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2225, 'RachidKlein', 9166977987, '19 Wine Drive', to_date('24-01-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2226, 'ClintTah', 3588454368, '4 Art Road', to_date('02-06-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2227, 'JesusGreen', 5624211294, '90 Milla Blvd', to_date('11-10-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2228, 'RaymondDorn', 2337495482, '724 Rachid Drive', to_date('14-05-2005', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2229, 'RipSisto', 4724785146, '656 Whitaker', to_date('18-01-1991', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2230, 'RoryFogerty', 8789345818, '651 Colman Road', to_date('19-10-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2231, 'BillyHannah', 7923442911, '43rd Street', to_date('11-08-1976', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2232, 'RheaPeterson', 2598326535, '99 Nivola Drive', to_date('24-02-1997', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2233, 'AniCummings', 7675453799, '64 Pony Drive', to_date('15-04-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2234, 'ShawnPesci', 6278666283, '31 Middleburg Heights Drive', to_date('25-03-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2235, 'MaceoVance', 3797445612, '32 Sophie Street', to_date('22-10-1996', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2236, 'KimGallant', 5366735195, '500 Womack Road', to_date('25-10-1986', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2237, 'NoraWeiland', 3422423311, '11 Heche Road', to_date('03-09-1998', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2238, 'VinKrumholtz', 5945436323, '86 Belp Street', to_date('31-03-1971', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2239, 'ShawnYoung', 2325522745, '64 Lofgren Drive', to_date('21-08-2001', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2240, 'BurtonPrinze', 6212113138, '18 Lauper Ave', to_date('16-03-1981', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2241, 'JoaquimVince', 5667788574, '79 Oak Park Street', to_date('24-08-1977', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2242, 'DonalWells', 8368452292, '461 Belushi Drive', to_date('20-07-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2243, 'ChetHenstridge', 3891378642, '72nd Street', to_date('31-05-1993', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2244, 'EmilySevigny', 3895745911, '1 Kinski Road', to_date('26-06-1989', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2245, 'ArturoLemmon', 4724668773, '42 Colman', to_date('23-04-1990', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2246, 'ChubbySample', 6227366863, '93rd Street', to_date('28-01-1973', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2247, 'SuziGray', 6443156797, '93rd Street', to_date('11-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2248, 'ColeyHaslam', 8493512669, '286 Aracruz Road', to_date('21-10-1974', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2249, 'HopeBalk', 8689841757, '47 Hal Blvd', to_date('31-05-1994', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2250, 'SamuelAbraham', 1429931289, '24 Sylvian Road', to_date('22-10-2004', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2251, 'GwynethVan Der Beek', 6474152116, '55 Laurie Drive', to_date('09-05-1992', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2252, 'JoyRyan', 6283386637, '15 Beverley Road', to_date('17-08-2003', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2253, 'JuanRatzenberger', 6538987157, '58 Nigel Drive', to_date('10-12-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2254, 'MadeleinePopper', 6142265528, '98 Goldblum Blvd', to_date('11-07-2002', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2255, 'ChristinaWeston', 5518418693, '11 Herbie Drive', to_date('07-12-1984', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2256, 'JonnyHector', 7313179197, '5 Pride Drive', to_date('21-12-1972', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2257, 'TerrenceDeGraw', 1155642425, '75 Noumea Street', to_date('23-11-1985', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2258, 'AndrewSwinton', 7238396352, '75 Nastassja Road', to_date('27-01-1979', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2259, 'AvrilGiraldo', 5289887729, '29 Mason', to_date('10-09-1987', 'dd-mm-yyyy'));
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth)
values (2260, 'TchekyShannon', 6455681894, '83 Tours Street', to_date('29-03-1978', 'dd-mm-yyyy'));
commit;
prompt 168 records loaded
prompt Loading DRIVER...
insert into DRIVER (licensenum, volunteer_id)
values (952883845, 2194);
insert into DRIVER (licensenum, volunteer_id)
values (794166689, 2201);
insert into DRIVER (licensenum, volunteer_id)
values (523634776, 2257);
insert into DRIVER (licensenum, volunteer_id)
values (563772271, 1116);
insert into DRIVER (licensenum, volunteer_id)
values (178336399, 2255);
insert into DRIVER (licensenum, volunteer_id)
values (793887641, 2206);
insert into DRIVER (licensenum, volunteer_id)
values (575784531, 2153);
insert into DRIVER (licensenum, volunteer_id)
values (813661993, 2132);
insert into DRIVER (licensenum, volunteer_id)
values (481359569, 2121);
insert into DRIVER (licensenum, volunteer_id)
values (859142831, 2213);
insert into DRIVER (licensenum, volunteer_id)
values (946397851, 1112);
insert into DRIVER (licensenum, volunteer_id)
values (549226418, 2162);
insert into DRIVER (licensenum, volunteer_id)
values (966888184, 2215);
insert into DRIVER (licensenum, volunteer_id)
values (574933144, 2154);
insert into DRIVER (licensenum, volunteer_id)
values (256749572, 2138);
insert into DRIVER (licensenum, volunteer_id)
values (128968495, 2182);
insert into DRIVER (licensenum, volunteer_id)
values (141856239, 2251);
insert into DRIVER (licensenum, volunteer_id)
values (128429121, 2126);
insert into DRIVER (licensenum, volunteer_id)
values (153685955, 2120);
insert into DRIVER (licensenum, volunteer_id)
values (945991412, 2123);
insert into DRIVER (licensenum, volunteer_id)
values (244571765, 1113);
insert into DRIVER (licensenum, volunteer_id)
values (565934274, 2254);
insert into DRIVER (licensenum, volunteer_id)
values (894651879, 2227);
insert into DRIVER (licensenum, volunteer_id)
values (149889347, 2228);
insert into DRIVER (licensenum, volunteer_id)
values (739971317, 2119);
insert into DRIVER (licensenum, volunteer_id)
values (327786514, 2166);
insert into DRIVER (licensenum, volunteer_id)
values (716945449, 2124);
insert into DRIVER (licensenum, volunteer_id)
values (442871125, 2245);
insert into DRIVER (licensenum, volunteer_id)
values (456782238, 2159);
insert into DRIVER (licensenum, volunteer_id)
values (712621331, 2196);
insert into DRIVER (licensenum, volunteer_id)
values (961457662, 2232);
insert into DRIVER (licensenum, volunteer_id)
values (663488237, 2223);
insert into DRIVER (licensenum, volunteer_id)
values (495671491, 1118);
insert into DRIVER (licensenum, volunteer_id)
values (556114873, 2157);
insert into DRIVER (licensenum, volunteer_id)
values (791827148, 2178);
insert into DRIVER (licensenum, volunteer_id)
values (785399257, 2146);
insert into DRIVER (licensenum, volunteer_id)
values (142269531, 2233);
insert into DRIVER (licensenum, volunteer_id)
values (637936811, 2175);
insert into DRIVER (licensenum, volunteer_id)
values (972953863, 2236);
insert into DRIVER (licensenum, volunteer_id)
values (751728996, 2179);
insert into DRIVER (licensenum, volunteer_id)
values (975764477, 2127);
insert into DRIVER (licensenum, volunteer_id)
values (862115641, 2189);
insert into DRIVER (licensenum, volunteer_id)
values (974688497, 2122);
insert into DRIVER (licensenum, volunteer_id)
values (724754172, 2203);
insert into DRIVER (licensenum, volunteer_id)
values (333397454, 2230);
insert into DRIVER (licensenum, volunteer_id)
values (495568851, 2242);
insert into DRIVER (licensenum, volunteer_id)
values (967565425, 2136);
insert into DRIVER (licensenum, volunteer_id)
values (738528846, 2247);
insert into DRIVER (licensenum, volunteer_id)
values (178897743, 2229);
insert into DRIVER (licensenum, volunteer_id)
values (713149588, 2151);
insert into DRIVER (licensenum, volunteer_id)
values (143387954, 2130);
insert into DRIVER (licensenum, volunteer_id)
values (197517939, 1117);
insert into DRIVER (licensenum, volunteer_id)
values (325867219, 2218);
insert into DRIVER (licensenum, volunteer_id)
values (638214519, 2193);
insert into DRIVER (licensenum, volunteer_id)
values (357632218, 2171);
insert into DRIVER (licensenum, volunteer_id)
values (189667624, 2249);
insert into DRIVER (licensenum, volunteer_id)
values (298786671, 1125);
insert into DRIVER (licensenum, volunteer_id)
values (917389861, 2256);
insert into DRIVER (licensenum, volunteer_id)
values (233424977, 2149);
insert into DRIVER (licensenum, volunteer_id)
values (368347344, 2224);
insert into DRIVER (licensenum, volunteer_id)
values (146477899, 2243);
insert into DRIVER (licensenum, volunteer_id)
values (899224867, 2184);
insert into DRIVER (licensenum, volunteer_id)
values (167969813, 2177);
insert into DRIVER (licensenum, volunteer_id)
values (847464381, 2180);
insert into DRIVER (licensenum, volunteer_id)
values (323661631, 2152);
insert into DRIVER (licensenum, volunteer_id)
values (776536826, 2199);
insert into DRIVER (licensenum, volunteer_id)
values (128836954, 2250);
insert into DRIVER (licensenum, volunteer_id)
values (737398576, 2168);
insert into DRIVER (licensenum, volunteer_id)
values (566917326, 2143);
insert into DRIVER (licensenum, volunteer_id)
values (285471448, 2145);
insert into DRIVER (licensenum, volunteer_id)
values (842232715, 2158);
commit;
prompt 71 records loaded
prompt Loading PARAMEDIC...
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 1, 2198);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 8, 2254);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 4, 1121);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 1, 2158);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 3, 2242);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 1, 2212);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, 2187);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, 2138);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, 2160);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, 2140);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, 2230);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 8, 2136);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, 1111);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 1, 2217);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, 2194);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, 2191);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, 2241);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, 2166);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, 2232);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 8, 2218);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 2, 2161);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, 2223);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, 2128);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, 2181);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, 2180);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 2, 2250);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 2, 2225);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, 2131);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 9, 2143);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, 2147);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 3, 2244);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 8, 2246);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 4, 2154);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 9, 2145);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 4, 1120);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, 2234);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 9, 2126);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, 2155);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 6, 1117);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 6, 2178);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, 2135);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, 2170);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 5, 2124);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, 1123);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 5, 2165);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 7, 2219);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Tel Aviv University', 1, 2156);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 3, 2240);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 6, 2164);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 3, 1125);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 5, 2127);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, 2239);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Technion', 7, 2150);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Hebrew University', 8, 2174);
insert into PARAMEDIC (medical_degree, seniority, volunteer_id)
values ('Ariel University', 3, 2220);
commit;
prompt 55 records loaded
prompt Loading SHIFT...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11111, to_date('25-06-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11305, 2212);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11112, to_date('28-03-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11243, 2147);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11113, to_date('17-12-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11216, 2164);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11114, to_date('28-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11262, 2135);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11115, to_date('27-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11282, 1120);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11116, to_date('29-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11132, 2230);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11117, to_date('22-08-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11305, 2170);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11118, to_date('02-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11259, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11119, to_date('29-07-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11111, 2174);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11120, to_date('23-01-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11151, 2145);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11121, to_date('23-09-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11134, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11122, to_date('11-01-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11246, 1125);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11123, to_date('08-02-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11131, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11124, to_date('14-11-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11167, 2170);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11125, to_date('05-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11227, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11126, to_date('01-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11222, 2223);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11127, to_date('17-05-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11296, 2225);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11128, to_date('25-09-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11208, 2254);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11129, to_date('19-09-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11147, 2187);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11130, to_date('07-05-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11161, 2143);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11131, to_date('30-07-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11115, 2128);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11132, to_date('23-05-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11277, 2145);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11133, to_date('10-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11126, 2138);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11134, to_date('10-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11178, 2140);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11135, to_date('17-11-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11165, 2219);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11136, to_date('14-04-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11298, 2187);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11137, to_date('23-12-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11137, 2191);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11138, to_date('28-09-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11294, 2143);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11139, to_date('22-09-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11155, 2194);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11140, to_date('11-09-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11284, 2147);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11141, to_date('19-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11245, 2223);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11142, to_date('25-11-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11285, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11143, to_date('23-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11281, 2218);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11144, to_date('02-07-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11218, 2128);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11145, to_date('14-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11279, 2232);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11146, to_date('23-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11164, 2181);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11147, to_date('14-03-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11254, 2156);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11148, to_date('06-10-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11252, 2244);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11149, to_date('09-04-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11135, 2166);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11150, to_date('08-08-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11305, 2241);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11151, to_date('02-11-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11236, 2140);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11152, to_date('25-04-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11220, 2198);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11153, to_date('13-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11280, 2230);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11154, to_date('07-08-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11234, 2217);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11155, to_date('05-04-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11169, 2170);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11156, to_date('13-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11152, 2178);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11157, to_date('04-03-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11251, 2147);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11158, to_date('23-10-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11207, 1111);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11159, to_date('18-07-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11231, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11160, to_date('23-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11308, 2241);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11161, to_date('31-10-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11222, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11162, to_date('18-09-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11300, 2158);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11163, to_date('12-03-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11200, 2158);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11164, to_date('23-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11298, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11165, to_date('09-06-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11144, 2170);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11166, to_date('11-02-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11229, 2194);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11167, to_date('21-04-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11169, 1125);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11168, to_date('02-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11114, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11169, to_date('22-04-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11215, 2158);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11170, to_date('16-05-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11129, 1121);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11171, to_date('02-01-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11284, 2239);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11172, to_date('03-07-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11146, 2160);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11173, to_date('21-08-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11285, 2138);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11174, to_date('23-01-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11200, 2219);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11175, to_date('07-09-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11254, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11176, to_date('12-06-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11112, 2194);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11177, to_date('15-06-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11274, 2154);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11178, to_date('13-09-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11165, 2160);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11179, to_date('03-05-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11205, 2165);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11180, to_date('10-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11249, 2170);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11181, to_date('10-04-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11284, 2164);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11182, to_date('12-04-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11130, 2234);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11183, to_date('29-07-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11115, 2145);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11184, to_date('02-02-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11221, 2135);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11185, to_date('08-07-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11195, 2178);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11186, to_date('09-04-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11301, 2232);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11187, to_date('26-08-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11122, 2225);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11188, to_date('27-08-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11182, 2230);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11189, to_date('15-07-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11129, 2232);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11190, to_date('12-10-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11256, 2239);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11191, to_date('31-12-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11229, 2174);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11192, to_date('17-10-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11148, 2254);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11193, to_date('05-04-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11256, 2180);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11194, to_date('26-07-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11306, 2194);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11195, to_date('01-09-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11200, 2198);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11196, to_date('03-03-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11222, 2135);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11197, to_date('21-04-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11243, 2187);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11198, to_date('27-07-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11159, 2166);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11199, to_date('27-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11269, 2174);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11200, to_date('14-10-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11310, 2191);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11201, to_date('06-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11118, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11202, to_date('11-09-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11120, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11203, to_date('12-01-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11161, 2161);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11204, to_date('05-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11198, 2165);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11205, to_date('12-05-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11140, 1123);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11206, to_date('21-06-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11134, 2187);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11207, to_date('03-10-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11151, 2218);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11208, to_date('31-03-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11308, 2154);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11209, to_date('13-06-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11150, 2124);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11210, to_date('05-05-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11211, 2128);
commit;
prompt 100 records committed...
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11211, to_date('01-04-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11143, 2158);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11212, to_date('25-05-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11301, 2242);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11213, to_date('02-12-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11307, 2170);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11214, to_date('19-03-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11231, 2191);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11215, to_date('11-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11208, 2136);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11216, to_date('11-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11167, 2174);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11217, to_date('12-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11160, 2135);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11218, to_date('28-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11189, 2246);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11219, to_date('15-11-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11271, 2218);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11220, to_date('08-09-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11250, 2156);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11221, to_date('03-05-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11289, 2181);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11222, to_date('08-10-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11150, 2164);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11223, to_date('21-01-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11264, 2254);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11224, to_date('20-08-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11143, 2225);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11225, to_date('23-05-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11139, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11226, to_date('17-05-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11293, 2156);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11227, to_date('01-12-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11148, 2180);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11228, to_date('20-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11231, 2232);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11229, to_date('14-02-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11193, 2164);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11230, to_date('08-12-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11209, 2136);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11231, to_date('04-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11228, 2131);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11232, to_date('21-06-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11283, 2166);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11233, to_date('09-09-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11217, 2135);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11234, to_date('12-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11130, 1125);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11235, to_date('20-07-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11247, 2128);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11236, to_date('10-12-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11191, 2138);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11237, to_date('07-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11199, 2143);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11238, to_date('09-03-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11163, 2166);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11239, to_date('01-08-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11198, 2242);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11240, to_date('20-08-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11155, 2174);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11241, to_date('23-05-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11237, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11242, to_date('28-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11283, 2234);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11243, to_date('07-01-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11228, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11244, to_date('04-07-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11299, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11245, to_date('15-04-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11289, 2223);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11246, to_date('23-09-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11294, 2217);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11247, to_date('29-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11280, 2181);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11248, to_date('30-12-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11139, 2246);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11249, to_date('27-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11136, 2145);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11250, to_date('12-10-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11178, 2240);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11251, to_date('30-10-2022', 'dd-mm-yyyy'), '00:00', '06:00', 11153, 2138);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11252, to_date('18-08-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11165, 2124);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11253, to_date('07-11-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11183, 2147);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11254, to_date('11-11-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11161, 2135);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11255, to_date('09-05-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11112, 1117);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11256, to_date('07-07-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11278, 2138);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11257, to_date('04-06-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11137, 2161);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11258, to_date('02-09-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11214, 2143);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11259, to_date('06-03-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11230, 2181);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11260, to_date('07-12-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11226, 2160);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11261, to_date('21-11-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11292, 2240);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11262, to_date('27-07-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11210, 2154);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11263, to_date('23-01-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11310, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11264, to_date('16-02-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11295, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11265, to_date('26-03-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11161, 2240);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11266, to_date('02-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11160, 2246);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11267, to_date('15-08-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11254, 2217);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11268, to_date('01-08-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11291, 2136);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11269, to_date('15-04-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11280, 2138);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11270, to_date('29-04-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11251, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11271, to_date('16-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11223, 2155);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11272, to_date('26-11-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11169, 2140);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11273, to_date('21-11-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11241, 2155);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11274, to_date('17-12-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11208, 2161);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11275, to_date('11-01-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11173, 1123);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11276, to_date('12-07-2020', 'dd-mm-yyyy'), '12:00', '06:00', 11251, 2155);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11277, to_date('11-04-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11243, 2131);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11278, to_date('15-03-2020', 'dd-mm-yyyy'), '00:00', '18:00', 11195, 2166);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11279, to_date('06-08-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11196, 2166);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11280, to_date('09-06-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11278, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11281, to_date('10-09-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11161, 2155);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11282, to_date('20-09-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11291, 2155);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11283, to_date('27-09-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11157, 2127);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11284, to_date('20-01-2023', 'dd-mm-yyyy'), '12:00', '06:00', 11151, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11285, to_date('05-03-2020', 'dd-mm-yyyy'), '12:00', '18:00', 11295, 2242);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11286, to_date('20-03-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11249, 2181);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11287, to_date('31-10-2022', 'dd-mm-yyyy'), '12:00', '18:00', 11153, 2219);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11288, to_date('07-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11298, 2147);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11289, to_date('15-05-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11297, 2242);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11290, to_date('20-01-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11265, 2242);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11291, to_date('28-12-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11186, 2219);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11292, to_date('12-07-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11223, 2180);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11293, to_date('26-05-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11168, 2187);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11294, to_date('17-11-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11184, 2127);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11295, to_date('06-11-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11285, 2250);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11296, to_date('23-12-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11271, 2218);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11297, to_date('10-09-2021', 'dd-mm-yyyy'), '00:00', '18:00', 11276, 2150);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11298, to_date('24-12-2022', 'dd-mm-yyyy'), '12:00', '06:00', 11154, 2160);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11299, to_date('17-08-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11147, 2161);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11300, to_date('13-06-2022', 'dd-mm-yyyy'), '00:00', '18:00', 11280, 2128);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11301, to_date('07-09-2023', 'dd-mm-yyyy'), '00:00', '18:00', 11231, 2230);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11302, to_date('25-01-2023', 'dd-mm-yyyy'), '12:00', '18:00', 11258, 1125);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11303, to_date('24-12-2023', 'dd-mm-yyyy'), '00:00', '06:00', 11258, 2218);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11304, to_date('28-11-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11231, 2212);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11305, to_date('12-05-2021', 'dd-mm-yyyy'), '00:00', '06:00', 11244, 2127);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11306, to_date('15-02-2021', 'dd-mm-yyyy'), '12:00', '18:00', 11251, 2212);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11307, to_date('27-12-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11245, 2131);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11308, to_date('13-09-2021', 'dd-mm-yyyy'), '12:00', '06:00', 11281, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11309, to_date('02-08-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11111, 2220);
insert into SHIFT (shift_id_, daate, starttime, endtime, event_id, volunteer_id)
values (11310, to_date('03-02-2020', 'dd-mm-yyyy'), '00:00', '06:00', 11201, 2242);
commit;
prompt 200 records loaded
prompt Loading DRIVERINSHIFT...
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2189, 11220);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2196, 11247);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2228, 11200);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2171, 11277);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2206, 11240);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2230, 11310);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2138, 11113);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2154, 11181);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2171, 11244);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (1112, 11179);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2257, 11268);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2257, 11281);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2121, 11185);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2230, 11179);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2193, 11244);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2232, 11167);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2126, 11117);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2159, 11173);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2227, 11186);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2151, 11285);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2154, 11225);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2255, 11176);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2206, 11185);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2152, 11258);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2257, 11261);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2157, 11284);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2250, 11270);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2230, 11122);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2130, 11191);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2199, 11115);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2245, 11217);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2162, 11269);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2230, 11260);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2151, 11158);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2166, 11165);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2168, 11309);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2251, 11266);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2158, 11244);
insert into DRIVERINSHIFT (volunteer_id, shift_id_)
values (2171, 11247);
commit;
prompt 39 records loaded
prompt Loading DRIVERTOAMBU...
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2199, 536);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2180, 9763);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2243, 9854);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2194, 5921);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1112, 734);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2249, 2127);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2182, 3168);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2255, 165);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2249, 699);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2138, 3125);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2123, 2737);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2196, 962);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2136, 5113);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2199, 157);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2180, 468);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2256, 158);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2215, 632);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2180, 481);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2145, 1449);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1125, 178);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1117, 4511);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2215, 624);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1125, 826);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2256, 6648);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2149, 4511);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2171, 282);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2151, 433);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2215, 2737);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2249, 4295);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2162, 657);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2132, 174);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2184, 2666);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2203, 4184);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2256, 337);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2249, 7798);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2194, 688);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2162, 8628);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2254, 1761);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2178, 1862);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1113, 4693);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2130, 891);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2196, 8848);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2177, 1777);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2138, 8924);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2171, 4693);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2145, 666);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2171, 379);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2194, 5672);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2126, 2737);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2146, 365);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2242, 8846);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2146, 4658);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2224, 4143);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2229, 379);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2127, 4184);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2193, 112);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2250, 337);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (1117, 733);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2166, 495);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2157, 371);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2236, 826);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2227, 4693);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2255, 4658);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2254, 763);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2224, 7693);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2151, 666);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2218, 7798);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2184, 632);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2218, 9585);
insert into DRIVERTOAMBU (volunteer_id, ambulance_id)
values (2123, 3561);
commit;
prompt 70 records loaded
prompt Loading MEDIC...
insert into MEDIC (seniority, volunteer_id)
values (6, 2223);
insert into MEDIC (seniority, volunteer_id)
values (8, 2238);
insert into MEDIC (seniority, volunteer_id)
values (1, 2222);
insert into MEDIC (seniority, volunteer_id)
values (1, 2224);
insert into MEDIC (seniority, volunteer_id)
values (4, 2199);
insert into MEDIC (seniority, volunteer_id)
values (3, 2178);
insert into MEDIC (seniority, volunteer_id)
values (4, 1117);
insert into MEDIC (seniority, volunteer_id)
values (4, 2150);
insert into MEDIC (seniority, volunteer_id)
values (1, 2163);
insert into MEDIC (seniority, volunteer_id)
values (5, 2157);
insert into MEDIC (seniority, volunteer_id)
values (1, 2119);
insert into MEDIC (seniority, volunteer_id)
values (9, 2129);
insert into MEDIC (seniority, volunteer_id)
values (2, 2218);
insert into MEDIC (seniority, volunteer_id)
values (9, 2193);
insert into MEDIC (seniority, volunteer_id)
values (9, 2140);
insert into MEDIC (seniority, volunteer_id)
values (7, 2160);
insert into MEDIC (seniority, volunteer_id)
values (1, 2251);
insert into MEDIC (seniority, volunteer_id)
values (2, 2233);
insert into MEDIC (seniority, volunteer_id)
values (7, 2162);
insert into MEDIC (seniority, volunteer_id)
values (6, 2175);
insert into MEDIC (seniority, volunteer_id)
values (9, 2194);
insert into MEDIC (seniority, volunteer_id)
values (5, 2229);
insert into MEDIC (seniority, volunteer_id)
values (7, 2166);
insert into MEDIC (seniority, volunteer_id)
values (2, 2250);
insert into MEDIC (seniority, volunteer_id)
values (4, 1122);
insert into MEDIC (seniority, volunteer_id)
values (2, 2116);
insert into MEDIC (seniority, volunteer_id)
values (3, 2244);
insert into MEDIC (seniority, volunteer_id)
values (2, 2171);
insert into MEDIC (seniority, volunteer_id)
values (2, 2187);
insert into MEDIC (seniority, volunteer_id)
values (1, 1126);
insert into MEDIC (seniority, volunteer_id)
values (2, 2137);
insert into MEDIC (seniority, volunteer_id)
values (1, 2145);
insert into MEDIC (seniority, volunteer_id)
values (2, 2245);
insert into MEDIC (seniority, volunteer_id)
values (2, 1125);
insert into MEDIC (seniority, volunteer_id)
values (2, 2180);
insert into MEDIC (seniority, volunteer_id)
values (1, 2219);
insert into MEDIC (seniority, volunteer_id)
values (1, 1115);
insert into MEDIC (seniority, volunteer_id)
values (5, 2133);
insert into MEDIC (seniority, volunteer_id)
values (5, 2242);
insert into MEDIC (seniority, volunteer_id)
values (2, 2134);
insert into MEDIC (seniority, volunteer_id)
values (1, 1119);
insert into MEDIC (seniority, volunteer_id)
values (1, 2130);
insert into MEDIC (seniority, volunteer_id)
values (3, 2227);
insert into MEDIC (seniority, volunteer_id)
values (1, 2252);
insert into MEDIC (seniority, volunteer_id)
values (7, 2131);
insert into MEDIC (seniority, volunteer_id)
values (4, 2198);
insert into MEDIC (seniority, volunteer_id)
values (7, 2179);
insert into MEDIC (seniority, volunteer_id)
values (8, 2184);
insert into MEDIC (seniority, volunteer_id)
values (5, 1113);
insert into MEDIC (seniority, volunteer_id)
values (9, 2257);
insert into MEDIC (seniority, volunteer_id)
values (1, 2225);
insert into MEDIC (seniority, volunteer_id)
values (9, 2177);
insert into MEDIC (seniority, volunteer_id)
values (8, 2243);
insert into MEDIC (seniority, volunteer_id)
values (1, 1123);
insert into MEDIC (seniority, volunteer_id)
values (2, 1116);
commit;
prompt 55 records loaded
prompt Loading MADICINSHIFT...
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11274, 2222);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11246, 2257);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11114, 1123);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11236, 2229);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11248, 2251);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11261, 2177);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11155, 2134);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11227, 2180);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11287, 1125);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11134, 2245);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11266, 2218);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11133, 2219);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11277, 2162);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11222, 2179);
insert into MADICINSHIFT (shift_id_, volunteer_id)
values (11229, 2252);
commit;
prompt 15 records loaded
prompt Enabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT enable constraint SYS_C008266;
alter table AMBUTOEVENT enable constraint SYS_C008267;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C008253;
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C008249;
prompt Enabling foreign key constraints for SHIFT...
alter table SHIFT enable constraint SYS_C008275;
alter table SHIFT enable constraint SYS_C008276;
prompt Enabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable constraint SYS_C008285;
alter table DRIVERINSHIFT enable constraint SYS_C008286;
prompt Enabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable constraint SYS_C008261;
alter table DRIVERTOAMBU enable constraint SYS_C008262;
prompt Enabling foreign key constraints for MEDIC...
alter table MEDIC enable constraint SYS_C008257;
prompt Enabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT enable constraint SYS_C008280;
alter table MADICINSHIFT enable constraint SYS_C008281;
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
set feedback on
set define on
prompt Done.
