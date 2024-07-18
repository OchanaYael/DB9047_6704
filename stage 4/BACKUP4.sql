prompt PL/SQL Developer import file
prompt Created on יום חמישי 18 יולי 2024 by חני סקורי
set feedback off
set define off
prompt Creating VOLUNTEER...
create table VOLUNTEER
(
  volunteer_id VARCHAR2(20) not null,
  naame        VARCHAR2(35) not null,
  phonnum      INTEGER not null,
  address      VARCHAR2(60) not null,
  dateofbirth  DATE not null,
  teemail      VARCHAR2(255)
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

prompt Creating OUREVENT...
create table OUREVENT
(
  event_id          INTEGER not null,
  deescription      VARCHAR2(60) not null,
  locaation         VARCHAR2(30) not null,
  date_time         DATE not null,
  shift_id_         INTEGER not null,
  evresponsibillity VARCHAR2(255)
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
alter table OUREVENT
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
alter table OUREVENT
  add foreign key (SHIFT_ID_)
  references SHIFT (SHIFT_ID_);

prompt Creating ACTIN...
create table ACTIN
(
  teid VARCHAR2(20) not null,
  evid INTEGER not null
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
alter table ACTIN
  add primary key (TEID, EVID)
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
alter table ACTIN
  add constraint FK_ACTIN_VOLUNTEER foreign key (TEID)
  references VOLUNTEER (VOLUNTEER_ID);
alter table ACTIN
  add constraint FK_OUR_EVENT_ID foreign key (EVID)
  references OUREVENT (EVENT_ID);

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
  references OUREVENT (EVENT_ID);

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

prompt Creating EMERGENBODIES...
create table EMERGENBODIES
(
  boname         VARCHAR2(255) not null,
  boid           INTEGER not null,
  bophone        VARCHAR2(15) not null,
  evid           INTEGER not null,
  readinesslevel VARCHAR2(50)
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
alter table EMERGENBODIES
  add primary key (BOID)
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
alter table EMERGENBODIES
  add constraint FK_OUR_EVENT_IDD foreign key (EVID)
  references OUREVENT (EVENT_ID);

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

prompt Creating EMERGENCYDRILL...
create table EMERGENCYDRILL
(
  emdrdate              DATE not null,
  emdrid                INTEGER not null,
  emdrdurationminutes   INTEGER not null,
  emdremergencytype     VARCHAR2(255) not null,
  emdrlocation          VARCHAR2(255) not null,
  emdrparticipantscount INTEGER not null,
  emdraddress           VARCHAR2(255) not null,
  driver_id             VARCHAR2(20),
  medic_id              VARCHAR2(20),
  paramedic_id          VARCHAR2(20)
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
alter table EMERGENCYDRILL
  add primary key (EMDRID)
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
alter table EMERGENCYDRILL
  add constraint FK_EMERGENCYDRILL_DRIVER foreign key (DRIVER_ID)
  references DRIVER (VOLUNTEER_ID);
alter table EMERGENCYDRILL
  add constraint FK_EMERGENCYDRILL_MEDIC foreign key (MEDIC_ID)
  references MEDIC (VOLUNTEER_ID);
alter table EMERGENCYDRILL
  add constraint FK_EMERGENCYDRILL_PARMEDIC foreign key (PARAMEDIC_ID)
  references PARAMEDIC (VOLUNTEER_ID);

prompt Creating EVDEBRIEFING...
create table EVDEBRIEFING
(
  debid            INTEGER not null,
  deresponsibility VARCHAR2(255) not null,
  destatus         INTEGER not null,
  deconclusion     VARCHAR2(255) not null
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
alter table EVDEBRIEFING
  add primary key (DEBID)
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

prompt Creating PRACTICING...
create table PRACTICING
(
  emdrid INTEGER not null,
  teid   VARCHAR2(20) not null
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
alter table PRACTICING
  add primary key (EMDRID, TEID)
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
alter table PRACTICING
  add constraint FK_PRACTICING_VOLUNTEER foreign key (TEID)
  references VOLUNTEER (VOLUNTEER_ID);
alter table PRACTICING
  add foreign key (EMDRID)
  references EMERGENCYDRILL (EMDRID);

prompt Creating WORKER...
create table WORKER
(
  wosalary INTEGER not null,
  teid     VARCHAR2(20) not null
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
alter table WORKER
  add primary key (TEID)
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
alter table WORKER
  add constraint FK_WORKER_VOLUNTEER foreign key (TEID)
  references VOLUNTEER (VOLUNTEER_ID);

prompt Creating REOPRTEV...
create table REOPRTEV
(
  teid  VARCHAR2(20) not null,
  debid INTEGER not null
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
alter table REOPRTEV
  add primary key (TEID, DEBID)
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
alter table REOPRTEV
  add foreign key (TEID)
  references WORKER (TEID);
alter table REOPRTEV
  add foreign key (DEBID)
  references EVDEBRIEFING (DEBID);

prompt Creating TAKINGPART...
create table TAKINGPART
(
  boid   INTEGER not null,
  emdrid INTEGER not null
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
alter table TAKINGPART
  add primary key (BOID, EMDRID)
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
alter table TAKINGPART
  add foreign key (EMDRID)
  references EMERGENCYDRILL (EMDRID);
alter table TAKINGPART
  add foreign key (BOID)
  references EMERGENBODIES (BOID);

prompt Disabling triggers for VOLUNTEER...
alter table VOLUNTEER disable all triggers;
prompt Disabling triggers for PARAMEDIC...
alter table PARAMEDIC disable all triggers;
prompt Disabling triggers for SHIFT...
alter table SHIFT disable all triggers;
prompt Disabling triggers for OUREVENT...
alter table OUREVENT disable all triggers;
prompt Disabling triggers for ACTIN...
alter table ACTIN disable all triggers;
prompt Disabling triggers for AMBULANS...
alter table AMBULANS disable all triggers;
prompt Disabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT disable all triggers;
prompt Disabling triggers for DRIVER...
alter table DRIVER disable all triggers;
prompt Disabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable all triggers;
prompt Disabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable all triggers;
prompt Disabling triggers for EMERGENBODIES...
alter table EMERGENBODIES disable all triggers;
prompt Disabling triggers for MEDIC...
alter table MEDIC disable all triggers;
prompt Disabling triggers for EMERGENCYDRILL...
alter table EMERGENCYDRILL disable all triggers;
prompt Disabling triggers for EVDEBRIEFING...
alter table EVDEBRIEFING disable all triggers;
prompt Disabling triggers for MADICINSHIFT...
alter table MADICINSHIFT disable all triggers;
prompt Disabling triggers for PRACTICING...
alter table PRACTICING disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for REOPRTEV...
alter table REOPRTEV disable all triggers;
prompt Disabling triggers for TAKINGPART...
alter table TAKINGPART disable all triggers;
prompt Disabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC disable constraint SYS_C0012654;
prompt Disabling foreign key constraints for SHIFT...
alter table SHIFT disable constraint SYS_C0012661;
prompt Disabling foreign key constraints for OUREVENT...
alter table OUREVENT disable constraint SYS_C0012668;
prompt Disabling foreign key constraints for ACTIN...
alter table ACTIN disable constraint FK_ACTIN_VOLUNTEER;
alter table ACTIN disable constraint FK_OUR_EVENT_ID;
prompt Disabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT disable constraint SYS_C0012672;
alter table AMBUTOEVENT disable constraint SYS_C0012673;
prompt Disabling foreign key constraints for DRIVER...
alter table DRIVER disable constraint SYS_C0012677;
prompt Disabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT disable constraint SYS_C0012681;
alter table DRIVERINSHIFT disable constraint SYS_C0012682;
prompt Disabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU disable constraint SYS_C0012686;
alter table DRIVERTOAMBU disable constraint SYS_C0012687;
prompt Disabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES disable constraint FK_OUR_EVENT_IDD;
prompt Disabling foreign key constraints for MEDIC...
alter table MEDIC disable constraint SYS_C0012691;
prompt Disabling foreign key constraints for EMERGENCYDRILL...
alter table EMERGENCYDRILL disable constraint FK_EMERGENCYDRILL_DRIVER;
alter table EMERGENCYDRILL disable constraint FK_EMERGENCYDRILL_MEDIC;
alter table EMERGENCYDRILL disable constraint FK_EMERGENCYDRILL_PARMEDIC;
prompt Disabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT disable constraint SYS_C0012695;
alter table MADICINSHIFT disable constraint SYS_C0012696;
prompt Disabling foreign key constraints for PRACTICING...
alter table PRACTICING disable constraint FK_PRACTICING_VOLUNTEER;
alter table PRACTICING disable constraint SYS_C0012743;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint FK_WORKER_VOLUNTEER;
prompt Disabling foreign key constraints for REOPRTEV...
alter table REOPRTEV disable constraint SYS_C0012752;
alter table REOPRTEV disable constraint SYS_C0012753;
prompt Disabling foreign key constraints for TAKINGPART...
alter table TAKINGPART disable constraint SYS_C0012757;
alter table TAKINGPART disable constraint SYS_C0012758;
prompt Deleting TAKINGPART...
delete from TAKINGPART;
commit;
prompt Deleting REOPRTEV...
delete from REOPRTEV;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting PRACTICING...
delete from PRACTICING;
commit;
prompt Deleting MADICINSHIFT...
delete from MADICINSHIFT;
commit;
prompt Deleting EVDEBRIEFING...
delete from EVDEBRIEFING;
commit;
prompt Deleting EMERGENCYDRILL...
delete from EMERGENCYDRILL;
commit;
prompt Deleting MEDIC...
delete from MEDIC;
commit;
prompt Deleting EMERGENBODIES...
delete from EMERGENBODIES;
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
prompt Deleting AMBULANS...
delete from AMBULANS;
commit;
prompt Deleting ACTIN...
delete from ACTIN;
commit;
prompt Deleting OUREVENT...
delete from OUREVENT;
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
prompt Loading VOLUNTEER...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('1', 'John Doe', 1234567890, '123 Herzl St, Tel Aviv', to_date('01-01-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('2', 'Jane Smith', 2345678901, '456 Ben Yehuda St, Jerusalem', to_date('02-02-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('3', 'Emily Jones', 3456789012, '789 Hanassi St, Haifa', to_date('03-03-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('4', 'Michael Brown', 4567890123, '101 David Ben Gurion Blvd, Beersheba', to_date('04-04-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('5', 'Sarah Davis', 5678901234, '202 Rothschild Blvd, Rishon LeZion', to_date('05-05-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('6', 'David Wilson', 6789012345, '303 Jabotinsky St, Petah Tikva', to_date('06-06-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('7', 'Laura Martinez', 7890123456, '404 Bialik St, Ashdod', to_date('07-07-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('8', 'James Garcia', 8901234567, '505 Herzl St, Netanya', to_date('08-08-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('9', 'Emma Anderson', 9012345678, '606 Weizmann St, Holon', to_date('09-09-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('10', 'Daniel Taylor', 1234567809, '707 Jabotinsky St, Bnei Brak', to_date('10-10-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11111', 'KurtFisher', 4972396788, '41 Franks Ave', to_date('07-05-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11112', 'ChazzDayne', 8763362161, '881 Brandt Street', to_date('04-05-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11113', 'AntonioVicious', 8515778176, '82 Garner Drive', to_date('12-04-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11114', 'IlleanaEnglund', 6755578227, '11 Douglas Road', to_date('01-06-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11115', 'DenisCollette', 7632578449, '66 Calgary Road', to_date('05-03-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11116', 'RobertCoburn', 3653938363, '62 Alpharetta Road', to_date('19-01-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11117', 'AntonioMacNeil', 5467244281, '2 Hatfield Street', to_date('11-01-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11118', 'KidMorton', 1158721895, '82 Syracuse Ave', to_date('01-07-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11119', 'TemueraBroza', 8469688441, '97 Embeth Street', to_date('20-01-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11120', 'NilsGano', 3826123758, '35 Spector Road', to_date('28-05-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11121', 'GilbertRonstadt', 3214577468, '92 Holly Road', to_date('02-12-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11122', 'JeroenShandling', 2152391251, '14 Imbruglia Street', to_date('26-09-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11123', 'KaseyGreene', 6729879512, '12nd Street', to_date('29-08-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11124', 'TramaineBerkeley', 6468629339, '92 Lorraine Drive', to_date('16-08-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11125', 'RoscoeBeckinsale', 9425549363, '47 Hawn Drive', to_date('15-07-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11126', 'BarryMichael', 8766891857, '75 Mandrell Street', to_date('21-10-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11127', 'OssieLennox', 3993667811, '53 Jackson', to_date('19-02-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11128', 'JuniorSoul', 6766172186, '25 Donovan Street', to_date('07-11-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11129', 'MosNelson', 3655386595, '45 Judd Blvd', to_date('20-04-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11130', 'CevinJackman', 1153428164, '63 Sandoval Drive', to_date('10-11-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11131', 'VincentFichtner', 8541314722, '345 Schlieren', to_date('11-06-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11132', 'ChaleeSampson', 5473322267, '72 Malcolm Drive', to_date('25-10-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11133', 'CeCeDiCaprio', 9369769488, '86 Aykroyd', to_date('02-12-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11134', 'JoshuaRossellini', 9845931291, '42 Chazz Road', to_date('21-03-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11135', 'Bobbyde Lancie', 8572624826, '82 Lindley', to_date('28-04-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11136', 'TiaChan', 7275696323, '99 Beckinsale Road', to_date('28-05-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11137', 'DonalAbraham', 7935533854, '61 Griffith', to_date('17-01-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11138', 'PatriciaDiBiasio', 2516673514, '13rd Street', to_date('09-05-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11139', 'DebbieHackman', 1163639298, '5 Cloris Drive', to_date('20-10-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11140', 'KingLerner', 6894829446, '45 Randal Street', to_date('30-12-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11141', 'WaymanCreek', 2489353759, '92nd Street', to_date('26-05-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11142', 'SydneyHanks', 7273543563, '21 Orange Road', to_date('31-01-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11143', 'NilsPaul', 2946561221, '37 Monterey Road', to_date('26-09-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11144', 'PragaD''Onofrio', 9684852994, '90 Steven Road', to_date('24-02-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11145', 'WaymanGriffin', 9627287343, '45 Cheshire Street', to_date('13-03-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11146', 'ShannynSalonga', 1687378646, '31 Morgan Ave', to_date('16-12-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11147', 'JaneaneSchwarzenegge', 2714346883, '61st Street', to_date('06-02-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11148', 'AngieMartin', 3446959319, '42nd Street', to_date('22-04-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11149', 'LoreenaKadison', 2145286218, '37 McClinton Drive', to_date('10-05-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11150', 'ThoraViterelli', 4413772679, '76 Stocksbridge Drive', to_date('02-06-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11151', 'MariePayne', 6449436267, '64 Treviso Blvd', to_date('05-06-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11152', 'OlgaCara', 8326941235, '77 Butler Ave', to_date('01-08-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11153', 'SeannDuvall', 2157393779, '242 Anderson Drive', to_date('03-10-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11154', 'DiamondGordon', 8822363394, '121 Gin Street', to_date('10-06-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11155', 'JoeyCrimson', 4348623846, '78 Bernex Ave', to_date('21-11-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11156', 'KatieHolly', 8292278113, '710 Todd Street', to_date('26-03-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11157', 'HilaryChecker', 6441542643, '889 Pordenone Street', to_date('15-07-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11158', 'WayneFaithfull', 3788482575, '63 Mira Blvd', to_date('19-06-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11159', 'RonNielsen', 3244547162, '58 Stigers', to_date('12-05-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11160', 'JoseBarkin', 6789684185, '18 Ronstadt Street', to_date('19-06-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11161', 'LaurieCoverdale', 7552524153, '978 Balin Street', to_date('13-06-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11162', 'ChazzSchock', 1556341177, '37 Slmea Ave', to_date('16-07-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11163', 'RichieGetty', 5596996384, '94 Crimson Road', to_date('14-09-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11164', 'KennethBarrymore', 5221294875, '62 Candy Road', to_date('06-10-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11165', 'NicoleMcGregor', 7418381995, '63 Freiburg Road', to_date('28-09-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11166', 'DanielMcDiarmid', 8165617832, '196 Glover Street', to_date('25-08-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11167', 'MeredithHerrmann', 8225557193, '24 Gliwice Road', to_date('25-12-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11168', 'JuliaWaite', 4239354138, '80 Stanley Street', to_date('03-12-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11169', 'HowardGarr', 7149142836, '28 Biehn Street', to_date('04-12-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11170', 'BenicioRowlands', 8367869263, '21st Street', to_date('18-10-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11171', 'ThinLange', 9769361812, '96 Xander Street', to_date('12-08-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11172', 'JayEdmunds', 5845211542, '63 Meyer', to_date('01-01-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11173', 'PattyBalin', 9597913681, '57 Fox Drive', to_date('27-12-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11174', 'ColeyNunn', 3598785369, '10 Claymont Ave', to_date('20-07-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11175', 'TanyaDerringer', 6679817771, '42nd Street', to_date('25-04-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11176', 'ChadRankin', 7177665352, '52 Fisher Road', to_date('13-11-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11177', 'ArturoLuPone', 5938352517, '21st Street', to_date('19-12-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11178', 'LanceDownie', 7218147989, '93 Irons Street', to_date('10-02-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11179', 'ToshiroPalminteri', 5213982158, '57 Witt Road', to_date('31-08-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11180', 'RipRizzo', 6352383651, '50 Washington Road', to_date('27-12-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11181', 'EdPride', 4316819482, '1 Elizabeth Road', to_date('05-05-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11182', 'NikkaJessee', 9671472531, '100 Melvin Ave', to_date('08-05-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11183', 'ElisabethStormare', 4151719476, '53 Spector Street', to_date('20-04-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11184', 'RobWainwright', 8877363564, '52 Forest Road', to_date('18-07-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11185', 'VingHenstridge', 5412876567, '73rd Street', to_date('28-07-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11186', 'MarkTodd', 2783662721, '31 Hayes Road', to_date('30-01-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11187', 'FayeDonovan', 5139293981, '54 Everett Drive', to_date('28-03-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11188', 'RoyKoyana', 9837565658, '7 Shelton Ave', to_date('11-12-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11189', 'ChubbyLangella', 4917515341, '1 Shocked Road', to_date('13-12-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11190', 'Ming-NaRapaport', 8224699672, '51 Johnson Drive', to_date('25-06-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11191', 'GatesHeron', 7421569554, '13 Steagall Road', to_date('08-05-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11192', 'NanciConroy', 6527669129, '430 Gertner Street', to_date('29-07-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11193', 'HarryMitra', 9772537568, '27 Blanchett Drive', to_date('12-02-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11194', 'JudiSanchez', 6671487736, '97 Elias Street', to_date('20-07-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11195', 'Francesvon Sydow', 5599137813, '25 Cardiff Street', to_date('04-12-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11196', 'BlairShannon', 2624541394, '48 Oxford Blvd', to_date('09-09-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11197', 'GiancarloFord', 3118379162, '42nd Street', to_date('20-04-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11198', 'JefferyNielsen', 3474758151, '48 Palin Road', to_date('11-03-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11199', 'SallySoul', 8153733483, '12 Marburg Drive', to_date('23-12-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11200', 'RuthUggams', 1422564138, '38 Kevn', to_date('24-10-1998', 'dd-mm-yyyy'), null);
commit;
prompt 100 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11201', 'AngieNegbaur', 3145175935, '52nd Street', to_date('25-12-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11202', 'AnnaTucker', 8646698362, '30 Holland Blvd', to_date('02-12-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11203', 'Jonny LeeBarkin', 6885122299, '20 Reynolds Blvd', to_date('13-04-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11204', 'WillieGray', 9149624945, '602 Stevie Drive', to_date('21-12-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11205', 'LoreenaSaucedo', 8944449574, '220 Purley Road', to_date('20-11-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11206', 'DustinSossamon', 3978734723, '41 Duisburg', to_date('17-08-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11207', 'EdieHynde', 8832438715, '17 Freddy', to_date('08-10-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11208', 'AlexRomijn-Stamos', 8951674731, '54 Wetzlar Street', to_date('12-06-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11209', 'HalleSteiger', 3854158734, '79 Helen Street', to_date('07-04-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11210', 'GarryRodriguez', 2215849864, '62nd Street', to_date('21-10-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11211', 'PhilipRomijn-Stamos', 6288647927, '33 Murray Ave', to_date('18-09-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11212', 'HeatherSanta Rosa', 5265991299, '390 Mraz Drive', to_date('12-04-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11213', 'JoannaGilliam', 1852182232, '25 Drogenbos', to_date('01-01-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11214', 'RobertaGill', 5786942243, '95 Nivola', to_date('19-08-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11215', 'FredericSwank', 8154659574, '48 LuPone', to_date('11-03-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11216', 'SteveBrando', 7899861691, '40 Loggia Road', to_date('08-02-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11217', 'GiancarloWright', 7411985774, '61st Street', to_date('19-08-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11218', 'JaimeCrouch', 6493982889, '59 de Lancie Street', to_date('17-09-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11219', 'PowersTurner', 9783348128, '89 Lauren', to_date('05-12-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11220', 'TimSchwimmer', 5882133165, '31 Spencer', to_date('31-12-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11221', 'ChetWeiland', 8515112286, '988 Boone Street', to_date('17-06-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11222', 'KeanuCochran', 7629882319, '19 Helen Street', to_date('18-09-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11223', 'NikkaMcCabe', 5893866678, '45 Watson Road', to_date('13-03-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11224', 'BretMould', 8429541885, '93rd Street', to_date('13-02-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11225', 'SonaBreslin', 1547642358, '31 Carlisle Road', to_date('12-11-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11226', 'OliverVan Damme', 1437687231, '21 Coltrane Street', to_date('09-01-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11227', 'EarlBuffalo', 1712948545, '83 Reubens Blvd', to_date('13-10-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11228', 'ReginaRoth', 2361174256, '941 Maxwell', to_date('06-05-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11229', 'TreyPleasure', 6838476722, '42 Nivola Blvd', to_date('21-08-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11230', 'GarySaucedo', 6198818941, '65 Avenged Blvd', to_date('18-01-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11231', 'CurtisJudd', 9635435429, '44 Wilmington Blvd', to_date('24-11-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11232', 'MerrileeVaughan', 6724966681, '5 Balk Street', to_date('14-08-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11233', 'DanPhillips', 4917727476, '93rd Street', to_date('15-10-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11234', 'LorettaDel Toro', 3427822471, '921 Edmunds Road', to_date('28-09-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11235', 'WesleyLee', 7655636619, '75 Murphy Road', to_date('29-08-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11236', 'HarveyCassidy', 9896611115, '13rd Street', to_date('07-10-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11237', 'PattyImperioli', 7916147822, '56 Fender Street', to_date('08-11-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11238', 'Mary BethMelvin', 4284795986, '68 Chely Road', to_date('13-10-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11239', 'CurtisShaw', 9846113411, '553 South Jordan Road', to_date('10-08-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11240', 'SuziHoliday', 3112242554, '95 San Jose Blvd', to_date('19-06-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11241', 'HoraceBeck', 4463698952, '45 Cleese Road', to_date('17-11-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11242', 'BrendaKristofferson', 1276694876, '53 Donelly Road', to_date('13-06-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11243', 'TemueraMargulies', 5354375995, '7 Bogguss', to_date('27-06-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11244', 'NigelHorton', 6763739473, '66 Place Road', to_date('05-06-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11245', 'VendettaBurton', 7871727777, '56 Juno Beach Drive', to_date('09-10-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11246', 'JillShandling', 4273217477, '53 Ruth Street', to_date('10-04-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11247', 'BuddyOszajca', 4145464524, '64 Bosco Road', to_date('01-09-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11248', 'DaveyHagerty', 1598395588, '8 Dooley Road', to_date('02-05-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11249', 'SeanMellencamp', 7682295877, '530 Baldwin Road', to_date('11-01-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11250', 'CaseyMacDonald', 5413751229, '192 Rockwell Ave', to_date('30-04-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11251', 'QuentinDiBiasio', 5998625929, '6 Imbruglia Ave', to_date('25-07-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11252', 'DylanQuinlan', 2136157745, '91 Ebersdorf', to_date('05-01-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11253', 'GaryBiehn', 2273667171, '15 Noumea Street', to_date('08-11-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11254', 'MykeltiChapman', 1655332134, '866 Aida Road', to_date('13-07-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11255', 'LaurenSalonga', 5559313273, '88 Lenny Street', to_date('18-10-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11256', 'JenaConnick', 2134639812, '42nd Street', to_date('28-01-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11257', 'HarveyBlaine', 9165396336, '21 Heald Street', to_date('05-12-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11258', 'DorryCrow', 2182541729, '761 Reeves Street', to_date('15-01-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11259', 'CarlosZellweger', 9125884925, '23rd Street', to_date('07-07-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11260', 'HarrisBaez', 1127838666, '29 Bellevue Street', to_date('10-08-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11261', 'ClayMohr', 5831955934, '48 Herne Drive', to_date('04-07-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11262', 'PabloMoraz', 4752186163, '57 Terrence Street', to_date('06-05-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11263', 'AndreaTillis', 8495142328, '13rd Street', to_date('13-04-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11264', 'TomCampbell', 1835936389, '77 Fukui Street', to_date('07-04-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11265', 'AlanOszajca', 6268471276, '19 Spader Road', to_date('21-10-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11266', 'SallyGiannini', 7586384938, '58 Richie Street', to_date('06-06-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11267', 'JulietteLucas', 7427444783, '99 DiCaprio Street', to_date('31-01-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11268', 'LionelPleasence', 2962777679, '20 Luzern Blvd', to_date('07-06-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11269', 'LilaQuatro', 7492925166, '951 Shearer Road', to_date('24-07-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11270', 'OlgaBurton', 2757625777, '33 Edenbridge Road', to_date('10-03-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11271', 'MinniePeterson', 3383564254, '99 Bolzano Road', to_date('13-04-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11272', 'AlecPerry', 6283355638, '64 Bellevue Road', to_date('02-02-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11273', 'ArmandDerringer', 5422191886, '96 Hershey Street', to_date('19-02-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11274', 'Jonny LeeScaggs', 8173944586, '98 Parish Blvd', to_date('20-05-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11275', 'MillaSpiner', 7631796737, '36 Murdock Drive', to_date('26-11-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11276', 'TaylorSample', 3819965465, '46 Neneh Street', to_date('24-03-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11277', 'ForestVannelli', 5523459959, '50 Hugo Street', to_date('20-06-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11278', 'ChubbyMalkovich', 3144761185, '53 Scarlett Road', to_date('01-10-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11279', 'Ianvon Sydow', 5394219349, '92 Pamela Blvd', to_date('12-08-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11280', 'JefferyCarter', 1358799943, '18 Leimen Blvd', to_date('16-06-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11281', 'BelindaPosener', 1268256254, '66 Patricia Road', to_date('02-11-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11282', 'JonathanCaldwell', 8759176478, '17 Fred Street', to_date('16-08-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11283', 'GabrielleBonneville', 2575731157, '207 Woods Street', to_date('09-10-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11284', 'ToriFarrell', 5382514257, '94 Dalley Blvd', to_date('12-11-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11285', 'NinaEnglish', 2465582118, '91 Rains Road', to_date('24-10-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11286', 'RichardMcNarland', 7871984855, '56 Tempest Street', to_date('20-09-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11287', 'LeonardoBaker', 4877558791, '28 Buffalo Road', to_date('02-11-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11288', 'PragaConnery', 9297455533, '737 Herne Drive', to_date('03-07-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11289', 'VernSecada', 3146893443, '56 Jody Ave', to_date('05-07-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11290', 'DarLawrence', 7789186592, '571 Brittany Road', to_date('04-10-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11291', 'AdamSnider', 3756432823, '18 Trey Drive', to_date('27-12-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11292', 'PeterIngram', 6957362885, '659 Reisterstown Drive', to_date('31-12-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11293', 'LarenzJeffreys', 1947764149, '73rd Street', to_date('09-10-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11294', 'RichHedaya', 3232933299, '29 Birch Road', to_date('27-09-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11295', 'NeilRispoli', 7258232966, '3 L''union Drive', to_date('12-06-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11296', 'LatinBogguss', 8115399958, '31st Street', to_date('07-08-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11297', 'DonnaReid', 5919799314, '49 Davidson', to_date('18-12-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11298', 'GenaLineback', 8463578662, '12nd Street', to_date('19-02-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11299', 'AnthonyMcGovern', 1716749966, '38 McCready Drive', to_date('19-06-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11300', 'EthanAli', 8422729418, '24 Paul Road', to_date('25-03-1982', 'dd-mm-yyyy'), null);
commit;
prompt 200 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11301', 'SpencerScorsese', 4429662495, '73 Jake Street', to_date('02-07-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11302', 'RemySchock', 5295472773, '49 Rocklin Blvd', to_date('28-06-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11303', 'CaseyColman', 1282561492, '95 Garfunkel Street', to_date('21-10-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11304', 'RichRemar', 3943557299, '41st Street', to_date('23-09-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11305', 'CrystalRonstadt', 9874326721, '41 Red Blvd', to_date('16-12-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11306', 'BernardMaxwell', 2841929475, '78 Baez Drive', to_date('31-10-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11307', 'AndraeMcDowall', 8148251636, '30 Fort McMurray Drive', to_date('07-01-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11308', 'MickeyRush', 6475298477, '60 Zappacosta Road', to_date('09-09-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11309', 'LionelGambon', 9672279979, '14 Lynne Drive', to_date('13-04-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11310', 'LennyGary', 8769446872, '85 Kasey Street', to_date('08-10-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11311', 'DermotRaye', 9228465537, '84 Victoria Drive', to_date('27-02-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11312', 'MerrillRucker', 6313354222, '64 West Chester Road', to_date('17-08-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11313', 'MelanieLucien', 4596661568, '79 Sarasota Drive', to_date('04-05-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11314', 'MartinPesci', 7257274139, '98 Fort Lewis Road', to_date('10-12-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11315', 'TalvinMahoney', 5889276856, '71st Street', to_date('31-01-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11316', 'DorryScaggs', 3236671988, '76 Toyama Blvd', to_date('19-08-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11317', 'LorenKravitz', 1858254545, '429 Adams Road', to_date('02-11-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11318', 'ThinWarren', 4881941892, '786 Mint Street', to_date('10-11-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11319', 'DonnaTilly', 6486443168, '83rd Street', to_date('07-01-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11320', 'GaryDonovan', 7184959493, '68 Houma Road', to_date('29-10-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11321', 'OlympiaThurman', 6462441761, '69 Barkin Drive', to_date('25-03-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11322', 'GeenaHaynes', 4142545916, '656 Matthau Road', to_date('19-04-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11323', 'LeonBaranski', 2584643514, '15 Firth Street', to_date('17-07-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11324', 'KirstenTyson', 1389634842, '35 Lisbon Road', to_date('12-08-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11325', 'PaulNapolitano', 5927326367, '100 Teng Street', to_date('29-09-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11326', 'AlfieHartnett', 7276235186, '4 Wainwright Ave', to_date('20-07-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11327', 'StockardBuckingham', 7313873469, '84 Tate', to_date('08-04-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11328', 'Carrie-AnneShort', 4295854935, '65 England Ave', to_date('12-11-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11329', 'JaniceDeGraw', 8795658114, '75 Elizabeth Street', to_date('10-10-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11330', 'EmilyMinogue', 7584396887, '122 Steve Drive', to_date('14-04-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11331', 'LeoCraig', 9662113697, '80 Bernard Ave', to_date('09-01-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11332', 'VernFender', 9422414774, '63rd Street', to_date('17-05-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11333', 'JulietteShelton', 7628275462, '150 Yorn Street', to_date('26-07-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11334', 'ReneGilliam', 7638975449, '32 April Road', to_date('24-11-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11335', 'RandallCraven', 7441618887, '1000 Buckingham Street', to_date('31-07-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11336', 'BrothersKirshner', 6295164596, '524 Todd Drive', to_date('20-10-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11337', 'BernieClarkson', 3837463883, '52 Ramat Gan Road', to_date('08-05-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11338', 'KevnBachman', 9582484263, '73 Conners Road', to_date('06-11-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11339', 'KurtwoodDysart', 9267278434, '19 Murray Drive', to_date('10-08-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11340', 'GilbertTucker', 9387649936, '80 Page', to_date('26-10-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11341', 'EmmQuaid', 9677322483, '64 Delafield Drive', to_date('16-10-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11342', 'SalKlugh', 9761975322, '9 Connery Street', to_date('10-11-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11343', 'EttaFlatts', 7641363399, '11st Street', to_date('05-01-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11344', 'PetulaCronin', 5234197161, '35 Lang Ave', to_date('08-07-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11345', 'ElizaHerrmann', 1617273648, '36 Christina Blvd', to_date('16-06-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11346', 'DaryleYoung', 3624784872, '70 Newton Road', to_date('27-05-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11347', 'RobbyWarden', 9491922254, '54 Sellers Street', to_date('10-01-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11348', 'NikkiBeals', 1117489983, '84 Seatle Ave', to_date('20-10-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11349', 'RoddyHead', 5712217264, '315 Burr Ridge Street', to_date('27-04-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11350', 'SolomonOates', 8386812531, '100 Balin Street', to_date('28-07-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11351', 'ElizaJohnson', 2685736379, '16 Folds Road', to_date('22-04-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11352', 'TalMacy', 3544888469, '98 Portman', to_date('21-03-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11353', 'BettySteenburgen', 2283725973, '71 Reinhold Ave', to_date('06-08-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11354', 'RosieZahn', 1486716479, '53 Reykjavik Drive', to_date('11-05-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11355', 'RhysDavidson', 6777199336, '33 Maria Street', to_date('06-09-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11356', 'SylvesterRhymes', 9216556444, '53 Nigel Street', to_date('28-12-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11357', 'HoraceTankard', 5895411356, '30 Costner Drive', to_date('12-12-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11358', 'ErnestJones', 3821348847, '59 Rachael Ave', to_date('07-01-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11359', 'FrankGugino', 6566182953, '40 Andre', to_date('08-03-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11360', 'AimeeSweeney', 6371142676, '95 Parm Drive', to_date('26-03-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11361', 'DonnaLarter', 2236113959, '65 Huntington Blvd', to_date('30-07-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11362', 'GuyFeore', 9433588399, '22 Slater Drive', to_date('18-03-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11363', 'DelbertJanssen', 6547587977, '16 Westport Street', to_date('07-04-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11364', 'SelmaBurstyn', 2617453522, '83 Malone Road', to_date('06-07-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11365', 'ChadTwilley', 1343883818, '419 Loring', to_date('07-11-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11366', 'LionelWinter', 6266373276, '52nd Street', to_date('07-03-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11367', 'GwynethBlack', 4954499392, '448 Chirignago Blvd', to_date('21-05-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11368', 'WaymanHolm', 8873135368, '57 Wiest Blvd', to_date('16-03-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11369', 'SimonBorgnine', 2518299446, '8 Nakai Street', to_date('30-01-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11370', 'PenelopeKeener', 1283241868, '10 Miller Ave', to_date('10-08-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11371', 'RowanLovitz', 1646818973, '26 Colon Street', to_date('22-10-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11372', 'KyleAmos', 4723753131, '11st Street', to_date('01-02-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11373', 'KimHartnett', 1341181679, '43 Rio Rancho Ave', to_date('08-05-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11374', 'AnitaBedelia', 6577572478, '61 North Yorkshire', to_date('01-07-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11375', 'HazelSchwimmer', 8898562559, '53 Himmelman Road', to_date('08-03-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11376', 'MikiRippy', 6183324834, '10 Abbotsford Blvd', to_date('27-04-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11377', 'DavyGrier', 3624266257, '35 Leon Drive', to_date('24-08-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11378', 'ChristmasOsbourne', 6948672823, '34 Ali', to_date('17-01-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11379', 'JavonDerringer', 8343176162, '994 Christopher Road', to_date('27-10-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11380', 'RobertConnery', 4467125994, '981 Huntsville Blvd', to_date('08-08-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11381', 'DeanShearer', 8323552885, '82 Conners Street', to_date('13-11-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11382', 'Chant׳™Darren', 7594335184, '11st Street', to_date('19-07-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11383', 'BebeFarrell', 6631199796, '63rd Street', to_date('22-09-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11384', 'CubaViterelli', 2555647394, '45 Geena Drive', to_date('27-11-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11385', 'CledusMcCracken', 9592564444, '21 Cromwell', to_date('07-08-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11386', 'AshleyLaBelle', 6246117872, '183 Sepulveda Road', to_date('28-12-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11387', 'CleaKeeslar', 6381596652, '89 Hjallerup', to_date('09-03-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11388', 'NikkiLoring', 5586112378, '51 Renee', to_date('25-01-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11389', 'HopeStevens', 5996151147, '245 Rain Drive', to_date('06-08-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11390', 'NatalieKattan', 8638579942, '17 Vince Ave', to_date('16-10-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11391', 'AniPitney', 1454122348, '973 Bush Blvd', to_date('18-07-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11392', 'EdieLaurie', 8621868229, '62nd Street', to_date('29-01-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11393', 'CledusUggams', 8355595454, '89 Redwood City', to_date('03-01-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11394', 'VinceNuman', 7225378417, '50 Numan Street', to_date('16-12-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11395', 'SamanthaDepp', 5386415138, '12 Bobby Street', to_date('08-10-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11396', 'OmarFavreau', 2819951976, '904 Bloomington Street', to_date('17-12-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11397', 'MarkTobolowsky', 2127858724, '33 Warwick Road', to_date('14-12-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11398', 'TiaPollack', 2777239137, '41 Mahood Street', to_date('16-09-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11399', 'TimMcDonnell', 1343344755, '882 Moriarty Road', to_date('30-10-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11400', 'HiltonPressly', 2961522612, '81 Aimee Street', to_date('21-12-1998', 'dd-mm-yyyy'), null);
commit;
prompt 300 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11401', 'SydneyLoggia', 1487971931, '65 Hudson', to_date('10-12-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11402', 'TerenceWinwood', 4342499797, '67 Zeta-Jones Road', to_date('02-10-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11403', 'RutgerArjona', 1877526428, '736 Johansen Road', to_date('13-01-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11404', 'OwenTucker', 5897674828, '79 Liev Blvd', to_date('10-02-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11405', 'DelroyDuschel', 3945638395, '59 Def Road', to_date('11-06-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11406', 'JonHoliday', 3237539611, '97 Chinlund Road', to_date('21-01-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11407', 'RowanFichtner', 6789626866, '55 Kumamoto Road', to_date('20-07-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11408', 'MikoMcDowell', 7946729991, '41 Pelvic Drive', to_date('29-03-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11409', 'IceLofgren', 8431278188, '891 Bruce Street', to_date('16-11-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11410', 'DermotSedgwick', 5392224173, '9 Philip Street', to_date('30-10-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11411', 'SonnyDunaway', 2912167172, '10 Hagar', to_date('05-11-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11412', 'OlgaFarrell', 5289636899, '91st Street', to_date('30-05-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11413', 'AidanPatton', 7333757547, '75 Leoni Drive', to_date('04-04-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11414', 'EmilyDonovan', 6632242137, '956 Oakenfold Drive', to_date('09-06-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11415', 'AniWhitley', 4124678598, '386 Bradford Street', to_date('06-08-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11416', 'BobbiRedgrave', 2853479799, '91 Queen Road', to_date('21-07-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11417', 'MosWitherspoon', 2524577564, '40 Vega Drive', to_date('27-04-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11418', 'LindaLynne', 7521772895, '51 Leon Road', to_date('25-07-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11419', 'CarrieManning', 2677816988, '75 Shaw Ave', to_date('26-05-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11420', 'KaronPlummer', 9266478921, '30 Dortmund Street', to_date('26-07-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11421', 'Carrie-AnneClarkson', 5526615162, '18 Root Street', to_date('27-07-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11422', 'DarArmstrong', 9641483722, '862 Santa Clarat Road', to_date('06-02-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11423', 'CarlKweller', 3997715137, '72 Chirignago Road', to_date('03-11-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11424', 'JonathanFurtado', 3551457455, '58 Gold Street', to_date('16-04-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11425', 'AliciaEngland', 4271722983, '30 Cedar Rapids Blvd', to_date('07-07-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11426', 'ChadMurray', 2356816447, '97 Mifune Road', to_date('10-07-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11427', 'PamButler', 4899799229, '9 Swarthmore Road', to_date('28-01-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11428', 'JuniorHirsch', 5818439775, '27 Torn Street', to_date('20-06-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11429', 'GoranFlemyng', 1184997153, '63 Kirkwood Road', to_date('19-04-1995', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11430', 'FatsEvans', 4661462873, '87 Cuenca Street', to_date('06-09-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11431', 'DesmondO''Hara', 7996274963, '63rd Street', to_date('13-12-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11432', 'SallySatriani', 8373227794, '37 Milsons Point Ave', to_date('26-02-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11433', 'ShelbyClinton', 5946632286, '55 Neuwirth Drive', to_date('18-06-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11434', 'BrendanSingletary', 4969159622, '29 Apple Ave', to_date('13-11-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11435', 'DrewLemmon', 1934448168, '11 Neuch׳’tel Road', to_date('06-02-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11436', 'RitchieBeckinsale', 9714543366, '99 Lane Street', to_date('03-07-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11437', 'KirkFisher', 8169113127, '126 Trey Blvd', to_date('24-12-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11438', 'KimMorrison', 5998961519, '100 Jordan Drive', to_date('14-10-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11439', 'Ming-NaCallow', 4773346726, '661 Phifer Street', to_date('28-02-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11440', 'RonnyWeller', 6622778654, '63 Caine Drive', to_date('31-05-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11441', 'EdgarMcDowall', 3484764671, '324 Cross Ave', to_date('27-11-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11442', 'ZooeyWells', 5292974226, '37 Indianapolis Drive', to_date('23-09-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11443', 'SeannBreslin', 2278386237, '37 Mira Drive', to_date('27-01-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11444', 'RutgerRapaport', 2285594435, '18 Kristin Street', to_date('16-07-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11445', 'DariusPryce', 4189962718, '80 Frampton Blvd', to_date('21-08-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11446', 'MirandaHeslov', 8664792159, '93rd Street', to_date('29-04-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11447', 'CleaLillard', 9937994467, '48 Gelsenkirchen', to_date('11-06-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11448', 'TeriRoy Parnell', 9779186136, '365 Patillo', to_date('02-02-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11449', 'RhettHanks', 9731472489, '85 Hudson Street', to_date('09-08-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11450', 'CyndiDunst', 8679243227, '36 Fishburne Street', to_date('20-09-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11451', 'AlanRibisi', 6779135849, '72nd Street', to_date('15-06-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11452', 'CampbellWard', 5827116141, '73 Charlottesville Road', to_date('25-07-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11453', 'DavisDetmer', 9788369319, '77 Rhett Drive', to_date('03-02-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11454', 'NoraVisnjic', 3926562483, '68 Collette Street', to_date('01-11-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11455', 'SallyFrancis', 2756693523, '32 Peet Drive', to_date('06-08-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11456', 'MickyNegbaur', 1468887249, '96 Sherman Blvd', to_date('23-09-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11457', 'KieferDavid', 9581762796, '44 Isaac Street', to_date('12-09-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11458', 'LaraMonk', 1551868771, '28 Canberra', to_date('11-07-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11459', 'OzzyMars', 7178546868, '8 Nancy Drive', to_date('06-09-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11460', 'RonLucas', 9431525531, '48 Horizon Street', to_date('22-11-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11461', 'SherylParker', 3958122732, '99 Assante Ave', to_date('07-02-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11462', 'ChaleeJay', 6843538673, '535 Andy Street', to_date('17-07-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11463', 'LisaDeLuise', 8985496791, '40 El Dorado Hills', to_date('20-12-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11464', 'RuebenHerrmann', 4385165991, '39 Diffie Street', to_date('07-05-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11465', 'DennisGarr', 6255942223, '48 Banderas Street', to_date('19-04-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11466', 'CevinDeschanel', 1464576795, '23 Murdock Street', to_date('01-10-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11467', 'DebraGosdin', 9497798716, '57 Melrose Road', to_date('14-12-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11468', 'MarlonStudi', 7394463752, '23 Fiona Road', to_date('07-07-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11469', 'HeathStallone', 4422893739, '13 Callow Road', to_date('26-09-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11470', 'JaneaneApplegate', 3223484456, '201 Bonnie Road', to_date('27-06-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11471', 'SamTripplehorn', 3832436414, '45 Cromwell Road', to_date('18-03-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11472', 'NickySingh', 5827792647, '942 Frankfurt am Main Street', to_date('27-09-1999', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11473', 'ElvisWeaving', 1586734145, '57 Willie Road', to_date('20-01-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11474', 'RosarioNivola', 8323556233, '20 Wheel Road', to_date('18-08-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11475', 'BrianDamon', 9378135397, '58 Santa Cruz Blvd', to_date('23-12-1988', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11476', 'CarlosQuinn', 8779345262, '923 Haslam Drive', to_date('03-01-1981', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11477', 'BuffyMidler', 9288236744, '14 Jolie Road', to_date('18-08-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11478', 'HikaruPiven', 9985311633, '68 Woods Road', to_date('29-12-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11479', 'MykeltiGlenn', 3678391211, '50 Lucy Blvd', to_date('05-05-1980', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11480', 'LeonardoKidman', 5329819731, '42nd Street', to_date('25-11-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11481', 'MinnieVanian', 3972943959, '90 Bacharach Street', to_date('21-03-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11482', 'RickyCollie', 2621288396, '30 Stone Street', to_date('29-01-1989', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11483', 'JoanDillane', 3431264313, '98 Lewin Drive', to_date('21-03-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11484', 'RemyLerner', 4355549267, '93 Elvis Road', to_date('10-09-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11485', 'RitaSteenburgen', 5249466113, '37 Cornell Road', to_date('20-08-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11486', 'GuyRauhofer', 2453767318, '83 Brooks Ave', to_date('12-08-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11487', 'MillieDushku', 2198356837, '96 Wichita', to_date('17-09-2000', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11488', 'JoelyColtrane', 9131126553, '87 Brock Road', to_date('10-03-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11489', 'HeatherBasinger', 2782163832, '124 Rhett Drive', to_date('18-03-1983', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11490', 'MarlonWopat', 3646924699, '197 Rundgren Street', to_date('11-09-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11491', 'HexHead', 8853984959, '95 Guy Drive', to_date('09-11-1992', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11492', 'SylvesterFerrer', 5859215994, '58 Brendan Road', to_date('13-01-1986', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11493', 'CarlosDiehl', 2591691236, '68 Arnold Street', to_date('19-02-2003', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11494', 'JudgeHagerty', 9542915567, '69 Sander Road', to_date('08-12-1994', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11495', 'DanielBerry', 3852144255, '8 Gandolfini Road', to_date('20-12-1984', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11496', 'EmmaTomlin', 5986292993, '90 Affleck Street', to_date('14-04-1993', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11497', 'TomMacy', 4191231536, '87 Rhett Road', to_date('25-10-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11498', 'MikiIngram', 4935644356, '4 Taipei Street', to_date('13-04-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11499', 'JacksonHerrmann', 3349294234, '57 Nik Drive', to_date('03-01-1998', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11500', 'EmmaStreep', 1535352449, '92 Broderick Road', to_date('21-05-1992', 'dd-mm-yyyy'), null);
commit;
prompt 400 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11501', 'JesseBarnett', 9874779884, '684 Bruxelles Drive', to_date('19-10-2001', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11502', 'HaroldBanderas', 8476693764, '3 Nuernberg Road', to_date('11-06-1991', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11503', 'AdinaBenet', 9673263494, '40 Balin Street', to_date('15-08-1990', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11504', 'DarGarofalo', 8556286819, '59 Moreno Street', to_date('22-05-1996', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11505', 'RussellRyder', 2255854576, '168 Liu Road', to_date('10-04-1982', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11506', 'JeffVai', 2455654458, '95 Herndon Road', to_date('30-12-2002', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11507', 'KimberlyGarner', 3474639121, '67 McGowan Ave', to_date('05-02-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11508', 'ColmBragg', 4952148794, '55 Jessica Street', to_date('21-11-1987', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11509', 'LennyLaPaglia', 8773424341, '65 Colon Street', to_date('18-08-1997', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11510', 'BuddyBrandt', 7198876241, '52 Rooker Street', to_date('14-02-1985', 'dd-mm-yyyy'), null);
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('100', 'Teddie', 7188656696, '9553 Valley Edge Plaza', to_date('17-11-2064', 'dd-mm-yyyy'), 'tbattrum2r@google.cn');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('101', 'Tierney', 1608653208, '7430 Loeprich Way', to_date('09-01-2280', 'dd-mm-yyyy'), 'tlightewood2s@businesswire.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('102', 'Lelah', 9753110878, '08 Quincy Terrace', to_date('19-06-2185', 'dd-mm-yyyy'), 'lthurbon2t@reuters.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('103', 'Daisie', 6608325465, '7 Barnett Crossing', to_date('21-12-2032', 'dd-mm-yyyy'), 'ddakhov2u@addthis.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('104', 'Erna', 9293621340, '20 Hoard Trail', to_date('28-02-2108', 'dd-mm-yyyy'), 'egarbutt2v@trellian.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('105', 'Dion', 5068778049, '76101 Aberg Lane', to_date('16-04-1981', 'dd-mm-yyyy'), 'dfirbank2w@nps.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('106', 'Tod', 2931447719, '4769 Tennessee Avenue', to_date('29-01-1982', 'dd-mm-yyyy'), 'tdannell2x@ucoz.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('107', 'Doyle', 5528746831, '2 Tomscot Way', to_date('20-05-2242', 'dd-mm-yyyy'), 'dbradforth2y@devhub.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('108', 'Vania', 8546120186, '11 Pine View Crossing', to_date('07-02-2042', 'dd-mm-yyyy'), 'vscotfurth2z@indiegogo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('109', 'Valentin', 8548415208, '2 Kingsford Avenue', to_date('03-02-2040', 'dd-mm-yyyy'), 'vcurryer30@salon.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('11', 'Edyth', 6912766012, '9 David Place', to_date('07-09-2225', 'dd-mm-yyyy'), 'esellersa@soundcloud.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('110', 'Jarid', 4083144632, '1583 Mallory Street', to_date('17-07-2311', 'dd-mm-yyyy'), 'jtrenfield31@google.cn');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('111', 'Hyacintha', 5872674970, '2 Tony Place', to_date('08-01-2096', 'dd-mm-yyyy'), 'htry32@nifty.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('112', 'Loreen', 5112192628, '2 Fieldstone Trail', to_date('28-02-2040', 'dd-mm-yyyy'), 'leatttok33@walmart.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('113', 'Kordula', 3981071850, '34274 Dakota Pass', to_date('22-06-2140', 'dd-mm-yyyy'), 'kcolliss34@redcross.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('114', 'Pier', 2172079799, '70 Di Loreto Crossing', to_date('06-12-2215', 'dd-mm-yyyy'), 'prahl35@drupal.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('115', 'Wynn', 7736552066, '4328 Pine View Lane', to_date('18-11-2000', 'dd-mm-yyyy'), 'wpepys36@vk.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('116', 'Malinda', 9885529427, '6 Lerdahl Parkway', to_date('14-10-2172', 'dd-mm-yyyy'), 'mbelloch37@archive.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('117', 'Anetta', 4317298060, '996 Lighthouse Bay Court', to_date('28-12-2191', 'dd-mm-yyyy'), 'abertenshaw38@bigcartel.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('118', 'Rosie', 4506643548, '0706 Russell Terrace', to_date('05-03-2164', 'dd-mm-yyyy'), 'rnelius39@odnoklassniki.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('119', 'Lorene', 3165032255, '0 Pierstorff Point', to_date('15-07-2143', 'dd-mm-yyyy'), 'lcapstick3a@wp.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('12', 'Mitchell', 7256486113, '1784 Straubel Way', to_date('16-01-2284', 'dd-mm-yyyy'), 'mfookesb@bluehost.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('120', 'Georgine', 1052470908, '898 Judy Junction', to_date('14-07-2165', 'dd-mm-yyyy'), 'gtomlins3b@dagondesign.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('121', 'Rozanna', 3669401525, '45 Elka Trail', to_date('19-07-2153', 'dd-mm-yyyy'), 'rhannigane3c@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('122', 'Lazarus', 8727481987, '1 Sugar Park', to_date('25-09-2157', 'dd-mm-yyyy'), 'lcouchman3d@google.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('123', 'Brittani', 5764585301, '3 Arrowood Parkway', to_date('07-06-2075', 'dd-mm-yyyy'), 'baldred3e@usatoday.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('124', 'Cornie', 5905698736, '6 Bluejay Point', to_date('07-09-2203', 'dd-mm-yyyy'), 'ctoffanelli3f@disqus.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('125', 'Zeke', 7981437665, '2 Sherman Plaza', to_date('09-02-2052', 'dd-mm-yyyy'), 'zgidney3g@timesonline.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('126', 'Kathie', 7545279889, '1102 Myrtle Pass', to_date('03-09-2034', 'dd-mm-yyyy'), 'kscotcher3h@cbsnews.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('127', 'Miguela', 8927593222, '3635 Bobwhite Lane', to_date('03-08-2322', 'dd-mm-yyyy'), 'mmccoughan3i@who.int');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('128', 'Bennie', 1408920912, '7 La Follette Crossing', to_date('06-01-2222', 'dd-mm-yyyy'), 'bearp3j@tinyurl.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('129', 'Karlotte', 2998459377, '3 Declaration Hill', to_date('12-01-2013', 'dd-mm-yyyy'), 'kpennicott3k@phpbb.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('13', 'Corrie', 8873045445, '09 Di Loreto Hill', to_date('05-01-1986', 'dd-mm-yyyy'), 'cstagc@msu.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('130', 'Elianora', 5044169254, '902 Chive Plaza', to_date('24-08-2032', 'dd-mm-yyyy'), 'epaskerful3l@skyrock.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('131', 'Brnaba', 8052052261, '76 Fisk Point', to_date('22-07-2159', 'dd-mm-yyyy'), 'bkalf3m@slideshare.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('132', 'Etta', 1803638625, '5 Lake View Plaza', to_date('19-10-2237', 'dd-mm-yyyy'), 'eroper3n@hp.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('133', 'Lauri', 3588287986, '3 Bunting Plaza', to_date('28-06-2306', 'dd-mm-yyyy'), 'lravenshaw3o@jalbum.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('134', 'Lita', 9214822346, '8 Rockefeller Way', to_date('06-08-2189', 'dd-mm-yyyy'), 'ldick3p@latimes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('135', 'Florenza', 4327814899, '0787 Garrison Court', to_date('12-04-2137', 'dd-mm-yyyy'), 'fwashbrook3q@state.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('136', 'Junie', 1114563102, '8 Debs Crossing', to_date('10-12-2133', 'dd-mm-yyyy'), 'jevans3r@prweb.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('137', 'Biron', 9635611238, '04815 Pine View Street', to_date('20-01-2246', 'dd-mm-yyyy'), 'brollinson3s@pcworld.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('138', 'Ian', 6073993235, '0242 Evergreen Lane', to_date('18-12-2093', 'dd-mm-yyyy'), 'ipython3t@purevolume.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('139', 'Virgie', 7382605442, '2350 Reinke Parkway', to_date('13-11-2104', 'dd-mm-yyyy'), 'vbangham3u@wiley.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('14', 'Merci', 2164419280, '5928 Crowley Junction', to_date('29-06-2090', 'dd-mm-yyyy'), 'mmabeyd@indiegogo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('140', 'Cass', 3887707881, '842 Bayside Terrace', to_date('12-04-2147', 'dd-mm-yyyy'), 'cbirchett3v@squidoo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('141', 'Sephira', 8109499770, '7 Maryland Place', to_date('12-04-2061', 'dd-mm-yyyy'), 'skuschel3w@mysql.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('142', 'Nowell', 2701548770, '9 Clemons Crossing', to_date('17-05-2318', 'dd-mm-yyyy'), 'nwhiteland3x@indiegogo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('143', 'Andy', 4725392853, '1708 Stoughton Lane', to_date('07-07-2217', 'dd-mm-yyyy'), 'alaws3y@accuweather.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('144', 'Corey', 3054360805, '966 Meadow Vale Way', to_date('08-05-2167', 'dd-mm-yyyy'), 'cpopov3z@topsy.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('145', 'Laurie', 1386064731, '18 Kipling Hill', to_date('25-02-2197', 'dd-mm-yyyy'), 'lcaustic40@state.tx.us');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('146', 'Dorena', 8444244220, '1062 Vidon Alley', to_date('04-09-2091', 'dd-mm-yyyy'), 'dchilds41@reddit.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('147', 'Bambie', 8625390605, '94452 Kinsman Parkway', to_date('20-04-2260', 'dd-mm-yyyy'), 'bturpin42@chronoengine.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('148', 'Dorrie', 3906271377, '06104 Arapahoe Point', to_date('11-12-2129', 'dd-mm-yyyy'), 'dmorcomb43@hibu.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('149', 'Emmaline', 8194903856, '581 Maple Hill', to_date('18-12-2084', 'dd-mm-yyyy'), 'eburgess44@stumbleupon.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('15', 'Minette', 6917163924, '45044 Crownhardt Road', to_date('13-05-2172', 'dd-mm-yyyy'), 'mcoultharde@aol.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('150', 'Milzie', 5366639844, '08572 Fairfield Pass', to_date('08-11-2115', 'dd-mm-yyyy'), 'msemble45@spiegel.de');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('151', 'Wain', 3943821491, '25 Springview Crossing', to_date('14-06-1994', 'dd-mm-yyyy'), 'wcardiff46@dailymail.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('152', 'Bailey', 9578581788, '7254 Homewood Place', to_date('06-08-2023', 'dd-mm-yyyy'), 'bheeran47@comsenz.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('153', 'Latashia', 6434853299, '54236 Miller Way', to_date('18-02-2001', 'dd-mm-yyyy'), 'lguiducci48@huffingtonpost.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('154', 'Nicole', 1892190378, '56519 3rd Plaza', to_date('11-02-2133', 'dd-mm-yyyy'), 'npawfoot49@google.com.br');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('155', 'Francesco', 8523819251, '96040 Park Meadow Road', to_date('26-07-2288', 'dd-mm-yyyy'), 'fguinan4a@csmonitor.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('156', 'Winnah', 6324267987, '7001 Boyd Crossing', to_date('15-05-2002', 'dd-mm-yyyy'), 'wdecourt4b@is.gd');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('157', 'Geraldine', 2722810782, '11 Hanson Avenue', to_date('23-02-2240', 'dd-mm-yyyy'), 'gkilbee4c@twitpic.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('158', 'Abbi', 8364141925, '56 Longview Parkway', to_date('18-10-2025', 'dd-mm-yyyy'), 'atook4d@yelp.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('159', 'Roderigo', 7558090007, '1440 Namekagon Trail', to_date('31-05-2000', 'dd-mm-yyyy'), 'rblandamore4e@nba.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('16', 'Jacky', 5883721705, '5264 Oak Valley Circle', to_date('23-03-2076', 'dd-mm-yyyy'), 'jhurrenf@netvibes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('160', 'Patty', 5258260135, '386 Hanover Park', to_date('30-04-2014', 'dd-mm-yyyy'), 'pstorcke4f@delicious.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('161', 'Yettie', 9836544603, '89752 Haas Drive', to_date('24-09-2034', 'dd-mm-yyyy'), 'ycowerd4g@virginia.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('162', 'Baillie', 8548782324, '9652 Twin Pines Pass', to_date('05-03-2072', 'dd-mm-yyyy'), 'brosenbarg4h@sina.com.cn');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('163', 'Dalia', 3273344023, '23 Killdeer Park', to_date('29-11-2299', 'dd-mm-yyyy'), 'ddigiorgio4i@naver.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('164', 'Anastassia', 9039538267, '13320 Sachtjen Plaza', to_date('26-10-2016', 'dd-mm-yyyy'), 'abaldi4j@trellian.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('165', 'Selig', 6827445844, '38523 Del Mar Lane', to_date('18-05-2171', 'dd-mm-yyyy'), 'shebborne4k@springer.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('166', 'Phaedra', 2808788858, '75247 Birchwood Way', to_date('23-04-2253', 'dd-mm-yyyy'), 'pgrinin4l@phpbb.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('167', 'Winona', 4432935738, '997 Memorial Center', to_date('09-02-2194', 'dd-mm-yyyy'), 'wfarmer4m@joomla.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('168', 'Lexi', 3044844081, '034 Erie Point', to_date('07-10-2056', 'dd-mm-yyyy'), 'lcanet4n@bravesites.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('169', 'Rik', 3937737518, '353 Laurel Way', to_date('18-02-1980', 'dd-mm-yyyy'), 'rmcavey4o@hexun.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('17', 'Clarie', 6892343553, '38 Melody Drive', to_date('22-11-2123', 'dd-mm-yyyy'), 'cquartlyg@salon.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('170', 'Leslie', 7154754127, '3900 Havey Drive', to_date('03-10-2125', 'dd-mm-yyyy'), 'lheninghem4p@mtv.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('171', 'Roxine', 5622090300, '12694 Anzinger Trail', to_date('22-04-1990', 'dd-mm-yyyy'), 'rgudger4q@sciencedirect.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('172', 'Darci', 4929683045, '70383 Stone Corner Alley', to_date('12-04-2273', 'dd-mm-yyyy'), 'dmacpadene4r@networksolutions.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('173', 'Bret', 4686320377, '96498 Del Sol Parkway', to_date('15-10-2152', 'dd-mm-yyyy'), 'biacovozzo4s@edublogs.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('174', 'Matt', 3011826945, '1 Summer Ridge Point', to_date('16-04-2031', 'dd-mm-yyyy'), 'mhuthart4t@stumbleupon.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('175', 'Job', 8599763073, '1 Florence Center', to_date('14-02-2003', 'dd-mm-yyyy'), 'jhedlestone4u@deviantart.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('176', 'Mirilla', 5961954432, '535 Stephen Hill', to_date('10-12-2020', 'dd-mm-yyyy'), 'mmarsden4v@buzzfeed.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('177', 'Mylo', 5633485485, '8 Michigan Alley', to_date('01-06-2269', 'dd-mm-yyyy'), 'mpoxon4w@shareasale.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('178', 'Janka', 7449701602, '8 Comanche Street', to_date('22-12-2005', 'dd-mm-yyyy'), 'jlasselle4x@npr.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('179', 'Ibrahim', 4251345682, '2 Milwaukee Lane', to_date('13-11-2003', 'dd-mm-yyyy'), 'icolchett4y@mayoclinic.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('18', 'Jaymie', 4903107989, '175 Spaight Center', to_date('25-06-2324', 'dd-mm-yyyy'), 'jdunabieh@free.fr');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('180', 'Eben', 8838527356, '07850 Jenna Parkway', to_date('30-01-2157', 'dd-mm-yyyy'), 'eperry4z@homestead.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('181', 'Nollie', 1352073421, '6 Esker Drive', to_date('14-07-2170', 'dd-mm-yyyy'), 'nsmedmoor50@phpbb.com');
commit;
prompt 500 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('182', 'Darrick', 9547804092, '27 Vidon Court', to_date('11-04-1987', 'dd-mm-yyyy'), 'dstaining51@shinystat.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('183', 'Stearne', 8374431242, '6 Park Meadow Avenue', to_date('14-08-2265', 'dd-mm-yyyy'), 'slonghorne52@photobucket.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('184', 'Dacey', 3197847620, '8752 Kenwood Parkway', to_date('04-03-2034', 'dd-mm-yyyy'), 'dclerke53@dot.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('185', 'Domini', 4563432012, '94 Johnson Center', to_date('07-10-2185', 'dd-mm-yyyy'), 'dweatherdon54@un.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('186', 'Freeland', 2447209319, '1213 Westridge Terrace', to_date('13-05-2118', 'dd-mm-yyyy'), 'fsoughton55@list-manage.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('187', 'Wyn', 2634090386, '7970 Dakota Crossing', to_date('05-03-2260', 'dd-mm-yyyy'), 'wannetts56@technorati.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('188', 'Roderich', 6704634269, '29 Clove Road', to_date('15-11-2216', 'dd-mm-yyyy'), 'randrzejczak57@yandex.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('189', 'Drucy', 2466994865, '6 Debs Plaza', to_date('28-05-2235', 'dd-mm-yyyy'), 'dkarpychev58@networkadvertising.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('19', 'Devina', 6474464499, '31 6th Center', to_date('31-05-2063', 'dd-mm-yyyy'), 'dpiscoi@adobe.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('190', 'Kane', 6787117598, '02796 Porter Pass', to_date('13-09-2157', 'dd-mm-yyyy'), 'kkondratovich59@behance.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('191', 'Alan', 3174330604, '2905 Birchwood Plaza', to_date('11-04-2168', 'dd-mm-yyyy'), 'aivashkin5a@behance.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('192', 'Hadlee', 5195806008, '724 Armistice Way', to_date('17-10-2300', 'dd-mm-yyyy'), 'hbartram5b@diigo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('193', 'Birgit', 9207939000, '38414 Hintze Crossing', to_date('24-02-2186', 'dd-mm-yyyy'), 'bsonschein5c@comsenz.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('194', 'Findley', 4022470937, '954 Mosinee Point', to_date('06-01-2075', 'dd-mm-yyyy'), 'fderoeck5d@g.co');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('195', 'Giffy', 3814367646, '9790 Sunbrook Pass', to_date('07-02-2184', 'dd-mm-yyyy'), 'gvankov5e@fda.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('196', 'Robb', 9264537907, '135 Oriole Court', to_date('30-08-2252', 'dd-mm-yyyy'), 'rradborne5f@china.com.cn');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('197', 'Haleigh', 5563516284, '004 Moland Center', to_date('02-12-2241', 'dd-mm-yyyy'), 'hsparkes5g@digg.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('198', 'Natalie', 4445324734, '13 Bayside Plaza', to_date('11-11-2081', 'dd-mm-yyyy'), 'ntremayle5h@google.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('199', 'Deeyn', 3388401260, '2476 Nancy Avenue', to_date('15-02-2244', 'dd-mm-yyyy'), 'dtoler5i@nytimes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('20', 'Joel', 6434765823, '1 Farwell Park', to_date('24-12-2274', 'dd-mm-yyyy'), 'jsyrettj@theguardian.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('200', 'Oren', 2568183719, '13 Truax Court', to_date('17-04-2197', 'dd-mm-yyyy'), 'oshoebrook5j@imageshack.us');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('201', 'Christalle', 8403034961, '55 Barnett Trail', to_date('10-06-2237', 'dd-mm-yyyy'), 'caudsley5k@wikimedia.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('202', 'Nicolai', 1085385082, '6525 Anzinger Center', to_date('12-08-2270', 'dd-mm-yyyy'), 'ncolaton5l@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('203', 'Gwendolen', 1763557854, '2227 Butternut Point', to_date('17-06-2073', 'dd-mm-yyyy'), 'gtams5m@gnu.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('204', 'Barrie', 9856494245, '308 Golf Way', to_date('05-10-2257', 'dd-mm-yyyy'), 'bloosely5n@unblog.fr');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('205', 'Sauveur', 4248695235, '2209 Eliot Park', to_date('24-02-2167', 'dd-mm-yyyy'), 'skliesl5o@surveymonkey.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('206', 'Nealy', 8137452962, '69221 Cordelia Drive', to_date('31-07-2017', 'dd-mm-yyyy'), 'nayrs5p@fotki.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('207', 'Ariella', 2597816862, '09 Sommers Crossing', to_date('18-07-2064', 'dd-mm-yyyy'), 'abeven5q@wikipedia.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('208', 'Jenni', 9512088154, '4 Maple Avenue', to_date('23-07-2290', 'dd-mm-yyyy'), 'jmarages5r@msn.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('209', 'Court', 9996613767, '878 Waubesa Junction', to_date('04-02-2159', 'dd-mm-yyyy'), 'cskeffington5s@oaic.gov.au');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('21', 'Evin', 7359191798, '4 Kings Avenue', to_date('08-07-2275', 'dd-mm-yyyy'), 'ewhiteoakk@trellian.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('210', 'Ulick', 3132109113, '75 Lawn Avenue', to_date('10-06-2312', 'dd-mm-yyyy'), 'uweeden5t@phpbb.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('211', 'Siusan', 4349471077, '239 Moose Circle', to_date('17-06-2179', 'dd-mm-yyyy'), 'slorkin5u@surveymonkey.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('212', 'Stavro', 3687448393, '55613 Hauk Center', to_date('01-12-2080', 'dd-mm-yyyy'), 'snouch5v@bluehost.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('213', 'Efren', 2654668692, '78836 Banding Point', to_date('29-01-2033', 'dd-mm-yyyy'), 'echazerand5w@amazon.de');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('214', 'Hatti', 8003547927, '10 Graceland Point', to_date('15-01-2286', 'dd-mm-yyyy'), 'hraddon5x@cdc.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('215', 'Althea', 1534961953, '9 Upham Crossing', to_date('04-07-2068', 'dd-mm-yyyy'), 'abelleny5y@live.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('216', 'Shela', 1043893653, '2 Homewood Road', to_date('04-07-2240', 'dd-mm-yyyy'), 'saxe5z@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('217', 'Florinda', 3194788344, '6278 Sachtjen Parkway', to_date('20-07-2210', 'dd-mm-yyyy'), 'fklauber60@myspace.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('218', 'Eleni', 2941828183, '21079 North Place', to_date('29-04-2230', 'dd-mm-yyyy'), 'eplumstead61@usa.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('219', 'Araldo', 8162791580, '1749 Comanche Lane', to_date('12-09-2253', 'dd-mm-yyyy'), 'apilkinton62@edublogs.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('22', 'Kariotta', 6304522511, '1 Saint Paul Place', to_date('02-11-2138', 'dd-mm-yyyy'), 'kguyerl@printfriendly.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('220', 'Mireille', 5972176754, '76301 Armistice Center', to_date('06-01-2077', 'dd-mm-yyyy'), 'mmahaffey63@nytimes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('221', 'Otto', 1357889673, '8365 Reindahl Alley', to_date('31-03-2081', 'dd-mm-yyyy'), 'ostubbins64@archive.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('222', 'Yehudi', 2111181511, '22986 Katie Place', to_date('16-08-2032', 'dd-mm-yyyy'), 'ysloegrave65@technorati.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('223', 'Garrik', 3203755705, '4 Granby Way', to_date('20-10-2027', 'dd-mm-yyyy'), 'ggodball66@1und1.de');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('224', 'Mariann', 1119121544, '9081 Mesta Crossing', to_date('16-04-2186', 'dd-mm-yyyy'), 'mglaze67@google.com.au');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('225', 'Lazaro', 9769520858, '6514 Cody Alley', to_date('12-10-2220', 'dd-mm-yyyy'), 'lcoakley68@dot.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('226', 'Clemence', 7887695483, '446 Dryden Terrace', to_date('31-05-2194', 'dd-mm-yyyy'), 'cheggman69@yolasite.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('227', 'Kipp', 5136937325, '413 Eastwood Alley', to_date('06-03-2196', 'dd-mm-yyyy'), 'kcrosson6a@si.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('228', 'Phillie', 5377891991, '1 Buhler Place', to_date('11-12-2064', 'dd-mm-yyyy'), 'psebert6b@ovh.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('229', 'Gerry', 9535397240, '902 Menomonie Street', to_date('27-02-2133', 'dd-mm-yyyy'), 'gkarpe6c@wired.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('23', 'Ronalda', 1251907763, '73 Arrowood Center', to_date('04-09-2327', 'dd-mm-yyyy'), 'rfortunm@webnode.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('230', 'Florina', 9941221166, '853 Dunning Center', to_date('03-04-2267', 'dd-mm-yyyy'), 'fpease6d@yelp.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('231', 'Lara', 3189522194, '224 Spohn Place', to_date('30-03-2238', 'dd-mm-yyyy'), 'lmcgarrell6e@seesaa.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('232', 'Elvina', 9849792273, '6 Wayridge Crossing', to_date('04-02-2177', 'dd-mm-yyyy'), 'efellibrand6f@disqus.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('233', 'Pauline', 2911498707, '837 West Avenue', to_date('05-08-2296', 'dd-mm-yyyy'), 'pfoyston6g@ftc.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('234', 'Gianna', 3893756681, '0 Transport Pass', to_date('02-05-2097', 'dd-mm-yyyy'), 'gtremlett6h@facebook.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('235', 'Ange', 7371167360, '19289 Reinke Avenue', to_date('30-01-2085', 'dd-mm-yyyy'), 'avedenichev6i@scientificamerican.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('236', 'Haskel', 4132057022, '9 Ryan Crossing', to_date('03-12-2007', 'dd-mm-yyyy'), 'hstitch6j@squarespace.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('237', 'Ebeneser', 5233846140, '4 Monument Way', to_date('10-11-2024', 'dd-mm-yyyy'), 'ecorain6k@zimbio.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('238', 'Burr', 1841701308, '56 Jenna Street', to_date('27-05-2000', 'dd-mm-yyyy'), 'bportugal6l@wisc.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('239', 'Dudley', 1013377880, '656 Northwestern Trail', to_date('20-12-1994', 'dd-mm-yyyy'), 'dmccarrison6m@hud.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('24', 'Shina', 6451485870, '089 Luster Pass', to_date('21-07-2247', 'dd-mm-yyyy'), 'sbromheadn@usgs.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('240', 'Brad', 1816380284, '12 Waubesa Road', to_date('07-02-2015', 'dd-mm-yyyy'), 'bleonardi6n@163.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('241', 'Markus', 6367174451, '92 Fuller Place', to_date('16-01-2101', 'dd-mm-yyyy'), 'mattac6o@ow.ly');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('242', 'Brannon', 2239081193, '3670 Toban Terrace', to_date('16-11-2109', 'dd-mm-yyyy'), 'bsmee6p@independent.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('243', 'Gunther', 2548053691, '9359 South Court', to_date('19-10-2317', 'dd-mm-yyyy'), 'gseamarke6q@4shared.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('244', 'Adolphus', 2387971571, '95 Drewry Court', to_date('27-06-2288', 'dd-mm-yyyy'), 'acallen6r@berkeley.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('245', 'Alexandro', 3107207898, '792 Mosinee Alley', to_date('24-12-2113', 'dd-mm-yyyy'), 'aclaypoole6s@com.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('246', 'Gusta', 7567729083, '9 Bluestem Pass', to_date('16-10-2256', 'dd-mm-yyyy'), 'gchallens6t@google.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('247', 'Brennan', 3572181036, '2813 Aberg Junction', to_date('17-07-2211', 'dd-mm-yyyy'), 'bgodber6u@trellian.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('248', 'Odie', 4862973906, '25 Ludington Hill', to_date('08-12-2066', 'dd-mm-yyyy'), 'owhannel6v@lycos.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('249', 'Nerta', 2041534495, '95672 Muir Pass', to_date('08-05-2325', 'dd-mm-yyyy'), 'nmacalpyne6w@businessweek.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('25', 'Sheelagh', 6235591116, '390 Artisan Drive', to_date('02-12-2252', 'dd-mm-yyyy'), 'sgoricko@hc360.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('250', 'Marcel', 1606930410, '892 Esker Plaza', to_date('16-01-2108', 'dd-mm-yyyy'), 'mdeek6x@ftc.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('251', 'Corrie', 5999284394, '906 Iowa Avenue', to_date('02-12-1999', 'dd-mm-yyyy'), 'ccolquete6y@clickbank.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('252', 'Harland', 4015076064, '94 Valley Edge Lane', to_date('28-05-1993', 'dd-mm-yyyy'), 'hflorentine6z@pinterest.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('253', 'Shelli', 7563943018, '7 Ramsey Place', to_date('30-06-2134', 'dd-mm-yyyy'), 'sslora70@dailymail.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('254', 'Francklyn', 3009159064, '55 Bowman Park', to_date('06-12-2291', 'dd-mm-yyyy'), 'fguitel71@bloglovin.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('255', 'Carlynne', 7845617125, '1431 West Plaza', to_date('27-10-2053', 'dd-mm-yyyy'), 'chartmann72@thetimes.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('256', 'Colan', 6167454392, '23 Butterfield Place', to_date('16-06-2128', 'dd-mm-yyyy'), 'caisthorpe73@nps.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('257', 'Carlyn', 5006360298, '247 Springs Place', to_date('08-04-2135', 'dd-mm-yyyy'), 'clingwood74@shutterfly.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('258', 'Sidoney', 8335967734, '6 Scott Road', to_date('25-08-2289', 'dd-mm-yyyy'), 'spyzer75@prlog.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('259', 'Davide', 5297463022, '38569 Meadow Ridge Parkway', to_date('12-12-1992', 'dd-mm-yyyy'), 'dhunnam76@msu.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('26', 'Laryssa', 1591742973, '8420 Lerdahl Hill', to_date('28-12-2320', 'dd-mm-yyyy'), 'lschwartzp@wordpress.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('260', 'Chaddy', 3721560932, '50551 Katie Road', to_date('25-04-2320', 'dd-mm-yyyy'), 'cchilcott77@plala.or.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('261', 'Silvano', 3852023805, '90 Starling Lane', to_date('03-11-2304', 'dd-mm-yyyy'), 'scoolbear78@usnews.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('262', 'Vilma', 6517889404, '8 Pawling Terrace', to_date('18-10-2322', 'dd-mm-yyyy'), 'vwhalebelly79@cloudflare.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('263', 'Liza', 6374188350, '3 Starling Road', to_date('22-11-2137', 'dd-mm-yyyy'), 'lbrolan7a@about.me');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('264', 'Freddy', 6027018625, '6280 Blaine Terrace', to_date('06-12-2125', 'dd-mm-yyyy'), 'fhinken7b@csmonitor.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('265', 'Rube', 3695618103, '49 Vernon Lane', to_date('06-01-2080', 'dd-mm-yyyy'), 'rpentin7c@google.fr');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('266', 'Sebastien', 9948606293, '99 Fordem Avenue', to_date('20-07-2284', 'dd-mm-yyyy'), 'sbreckin7d@smugmug.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('267', 'Oran', 8934266834, '592 Comanche Center', to_date('06-11-2108', 'dd-mm-yyyy'), 'oreims7e@istockphoto.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('268', 'Jilli', 2124623212, '445 Daystar Road', to_date('12-12-2077', 'dd-mm-yyyy'), 'jglauber7f@seattletimes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('269', 'Dagny', 6232166776, '7 Kensington Point', to_date('15-06-2306', 'dd-mm-yyyy'), 'dloblie7g@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('27', 'Karyn', 1144554622, '1809 Dovetail Avenue', to_date('09-11-2236', 'dd-mm-yyyy'), 'kalltimesq@theatlantic.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('270', 'Bruis', 6689014969, '7483 Fieldstone Avenue', to_date('26-06-2083', 'dd-mm-yyyy'), 'bcamel7h@phoca.cz');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('271', 'Brooke', 6118857041, '46578 Harbort Crossing', to_date('13-08-2275', 'dd-mm-yyyy'), 'bglas7i@tripod.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('272', 'Renee', 6327645705, '73 Mallard Place', to_date('30-10-1981', 'dd-mm-yyyy'), 'rwitterick7j@cyberchimps.com');
commit;
prompt 600 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('273', 'Piotr', 7501827121, '4158 Crownhardt Junction', to_date('10-06-2010', 'dd-mm-yyyy'), 'pwoodwin7k@addthis.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('274', 'Ellerey', 5417499149, '2 Emmet Way', to_date('26-09-2241', 'dd-mm-yyyy'), 'egayden7l@tinypic.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('275', 'Leopold', 4301650315, '7 Bay Parkway', to_date('29-09-2035', 'dd-mm-yyyy'), 'lbattelle7m@1und1.de');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('276', 'Brunhilde', 8644618785, '1 Darwin Court', to_date('28-03-2215', 'dd-mm-yyyy'), 'blutz7n@homestead.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('277', 'Kathie', 7878224596, '934 Waubesa Drive', to_date('04-06-2309', 'dd-mm-yyyy'), 'kodonohoe7o@ihg.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('278', 'Way', 3604624990, '141 Lillian Drive', to_date('07-05-2259', 'dd-mm-yyyy'), 'wdagnan7p@hexun.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('279', 'Bradney', 2063351322, '24037 Grayhawk Hill', to_date('26-03-2273', 'dd-mm-yyyy'), 'bcrighton7q@ted.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('28', 'Kylie', 5163725514, '0 Holy Cross Lane', to_date('18-08-2013', 'dd-mm-yyyy'), 'khaselgrover@seesaa.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('280', 'De', 4895644357, '48 Nelson Place', to_date('14-05-2216', 'dd-mm-yyyy'), 'dsharples7r@naver.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('281', 'Ole', 1372350338, '2 Myrtle Drive', to_date('19-06-2322', 'dd-mm-yyyy'), 'owooland7s@apache.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('282', 'Tersina', 1377587884, '8 Pepper Wood Circle', to_date('08-02-2216', 'dd-mm-yyyy'), 'tmix7t@usnews.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('283', 'Linell', 4507352186, '3 Independence Alley', to_date('10-05-2078', 'dd-mm-yyyy'), 'lwardingly7u@instagram.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('284', 'Tobie', 6125976216, '18 Vidon Trail', to_date('29-08-2287', 'dd-mm-yyyy'), 'tgate7v@canalblog.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('285', 'Aluino', 1704910160, '4 5th Circle', to_date('04-06-2229', 'dd-mm-yyyy'), 'amathouse7w@patch.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('286', 'Clayborn', 8251682058, '47 Forest Drive', to_date('27-01-2312', 'dd-mm-yyyy'), 'canthony7x@va.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('287', 'Chad', 4492196380, '0 Petterle Road', to_date('24-07-2325', 'dd-mm-yyyy'), 'cniccols7y@npr.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('288', 'Dulcy', 1681817798, '65704 Declaration Crossing', to_date('07-02-2102', 'dd-mm-yyyy'), 'dgrevatt7z@examiner.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('289', 'Adolphus', 8726186197, '750 Sugar Point', to_date('22-03-2057', 'dd-mm-yyyy'), 'adarinton80@bluehost.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('29', 'Lyle', 6566220015, '52324 Autumn Leaf Way', to_date('11-03-2288', 'dd-mm-yyyy'), 'lraywoods@telegraph.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('290', 'Harman', 1661494209, '39961 Cottonwood Trail', to_date('13-01-2098', 'dd-mm-yyyy'), 'hgariff81@nasa.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('291', 'Catha', 7888663849, '47012 Karstens Lane', to_date('23-06-1998', 'dd-mm-yyyy'), 'cfarlane82@eventbrite.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('292', 'Eberhard', 9055885458, '7 Corben Place', to_date('10-12-1999', 'dd-mm-yyyy'), 'echitson83@lulu.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('293', 'Rik', 3468325840, '92 Goodland Junction', to_date('09-06-1993', 'dd-mm-yyyy'), 'rverbrugge84@exblog.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('294', 'Ozzie', 1533386883, '18291 Fremont Avenue', to_date('13-11-2152', 'dd-mm-yyyy'), 'onaisbit85@bloglovin.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('295', 'Farrel', 8746184557, '6 Nobel Park', to_date('15-01-2161', 'dd-mm-yyyy'), 'fdingsdale86@issuu.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('296', 'Beverley', 9789461682, '2 Mallard Place', to_date('24-01-2201', 'dd-mm-yyyy'), 'bsim87@cocolog-nifty.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('297', 'Suzanne', 5447877420, '7 Bunting Court', to_date('30-08-2064', 'dd-mm-yyyy'), 'sbrightie88@bloglines.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('298', 'Irwin', 2782680753, '1 Dottie Alley', to_date('18-11-2096', 'dd-mm-yyyy'), 'ifullick89@blogger.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('299', 'Romonda', 2335223867, '5365 Stoughton Lane', to_date('03-09-2036', 'dd-mm-yyyy'), 'rharfoot8a@japanpost.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('30', 'Ashlin', 8484737222, '80758 Golf Course Center', to_date('07-02-2148', 'dd-mm-yyyy'), 'ayewdallt@deliciousdays.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('300', 'Fonz', 4248551415, '28 Hoepker Park', to_date('02-09-2090', 'dd-mm-yyyy'), 'ffardo8b@privacy.gov.au');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('301', 'Erek', 7171367923, '2 Farmco Way', to_date('07-07-2010', 'dd-mm-yyyy'), 'eesmonde8c@cornell.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('302', 'Fonz', 4783190374, '34 Emmet Alley', to_date('24-05-2157', 'dd-mm-yyyy'), 'fklassman8d@go.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('303', 'Heloise', 7378347130, '596 Gale Court', to_date('09-10-2068', 'dd-mm-yyyy'), 'hpavitt8e@slashdot.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('304', 'Loraine', 5693233768, '6 Logan Point', to_date('10-01-2006', 'dd-mm-yyyy'), 'lmacdaid8f@psu.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('305', 'Scott', 9192583603, '9 Jenifer Circle', to_date('06-01-2020', 'dd-mm-yyyy'), 'sfairleigh8g@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('306', 'Vaughan', 9808340989, '36939 Lakewood Plaza', to_date('02-09-2055', 'dd-mm-yyyy'), 'vstart8h@zimbio.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('307', 'Brock', 5069047349, '4 Straubel Parkway', to_date('24-08-2228', 'dd-mm-yyyy'), 'bitzkovitch8i@cisco.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('308', 'Giacinta', 9807432152, '7843 Grasskamp Parkway', to_date('27-02-2114', 'dd-mm-yyyy'), 'gmorling8j@oakley.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('309', 'Tami', 4893223161, '7606 Northfield Trail', to_date('07-07-2221', 'dd-mm-yyyy'), 'tpuig8k@discovery.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('31', 'Dido', 6166133936, '888 Crest Line Place', to_date('08-05-2254', 'dd-mm-yyyy'), 'dkaradzasu@issuu.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('310', 'Ellette', 9488842354, '9408 South Lane', to_date('17-04-1997', 'dd-mm-yyyy'), 'esijmons8l@newyorker.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('311', 'Latisha', 6686575350, '60773 Dexter Street', to_date('23-01-2015', 'dd-mm-yyyy'), 'loffell8m@usgs.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('312', 'Polly', 7117113818, '2537 Golden Leaf Point', to_date('21-12-2127', 'dd-mm-yyyy'), 'pcampkin8n@yandex.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('313', 'Petra', 7092886034, '11 Clarendon Hill', to_date('29-12-2175', 'dd-mm-yyyy'), 'pthredder8o@gmpg.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('314', 'Konstantin', 1493958722, '511 Elmside Place', to_date('24-04-2091', 'dd-mm-yyyy'), 'kguilaem8p@cisco.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('315', 'Sayre', 1753280591, '06 Oak Valley Center', to_date('19-03-2278', 'dd-mm-yyyy'), 'sscouller8q@comcast.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('316', 'Agnes', 9469452117, '5 Rutledge Pass', to_date('02-07-2204', 'dd-mm-yyyy'), 'aleggon8r@weather.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('317', 'Barth', 2295878709, '09 Lakewood Junction', to_date('08-02-2305', 'dd-mm-yyyy'), 'bdyment8s@howstuffworks.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('318', 'Baryram', 6898111457, '7094 Upham Road', to_date('09-09-2133', 'dd-mm-yyyy'), 'bbrodhead8t@mediafire.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('319', 'Nicolai', 4028405260, '17 Tennessee Point', to_date('15-01-2248', 'dd-mm-yyyy'), 'nsawyer8u@yellowpages.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('32', 'Aura', 5848704764, '95 Westend Way', to_date('07-06-2115', 'dd-mm-yyyy'), 'aflavellev@google.pl');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('320', 'Sanford', 4777764478, '24859 Helena Park', to_date('30-03-2157', 'dd-mm-yyyy'), 'stousy8v@mac.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('321', 'Genevieve', 4011592426, '78 Hoffman Court', to_date('29-10-2052', 'dd-mm-yyyy'), 'ghenaughan8w@biblegateway.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('322', 'Ernesto', 6426662895, '53 2nd Plaza', to_date('01-05-2127', 'dd-mm-yyyy'), 'epaulusch8x@linkedin.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('323', 'Burr', 6267585201, '58 Gerald Trail', to_date('22-11-2097', 'dd-mm-yyyy'), 'bgoosnell8y@sourceforge.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('324', 'Arabela', 6893635173, '6 Hoepker Circle', to_date('25-11-2319', 'dd-mm-yyyy'), 'adudill8z@cpanel.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('325', 'Ginni', 9888706545, '85 Starling Pass', to_date('11-05-2256', 'dd-mm-yyyy'), 'gbenny90@taobao.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('326', 'Ellyn', 1252323473, '164 Schiller Street', to_date('23-11-2106', 'dd-mm-yyyy'), 'eshevels91@tumblr.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('327', 'Bennie', 4347024066, '9297 Kedzie Plaza', to_date('26-11-2202', 'dd-mm-yyyy'), 'bottiwill92@cornell.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('328', 'Pauline', 3136955718, '9381 Graedel Circle', to_date('09-02-2095', 'dd-mm-yyyy'), 'phugonin93@hibu.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('329', 'Carlo', 7517455885, '1080 Florence Street', to_date('10-11-2008', 'dd-mm-yyyy'), 'cspringtorp94@reverbnation.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('33', 'Lusa', 2279419324, '7057 Mallard Pass', to_date('31-10-2249', 'dd-mm-yyyy'), 'lcabralw@utexas.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('330', 'Betteanne', 2143138544, '6 Mayfield Street', to_date('04-06-2092', 'dd-mm-yyyy'), 'bspridgeon95@cargocollective.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('331', 'Kerk', 1165311245, '93 Tennessee Alley', to_date('30-11-2325', 'dd-mm-yyyy'), 'kpasby96@accuweather.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('332', 'Beatrice', 6183907876, '81157 Elmside Center', to_date('06-03-1990', 'dd-mm-yyyy'), 'brobe97@newyorker.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('333', 'Donovan', 3146539420, '22 Manitowish Trail', to_date('23-12-2086', 'dd-mm-yyyy'), 'dhellyer98@blinklist.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('334', 'Lukas', 9554708107, '58323 Eastlawn Drive', to_date('30-03-2012', 'dd-mm-yyyy'), 'lforrestall99@de.vu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('335', 'Francisco', 5723562239, '11 Southridge Way', to_date('27-05-2242', 'dd-mm-yyyy'), 'fduckfield9a@timesonline.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('336', 'Amelita', 8319364174, '81467 Ramsey Center', to_date('19-09-2012', 'dd-mm-yyyy'), 'asickling9b@smugmug.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('337', 'Goldina', 8294736400, '05 Burning Wood Point', to_date('13-10-2291', 'dd-mm-yyyy'), 'ghulstrom9c@imgur.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('338', 'Carolina', 6859198710, '911 Summerview Circle', to_date('05-01-2327', 'dd-mm-yyyy'), 'cifill9d@sitemeter.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('339', 'Kimberlyn', 8518911288, '48 Scofield Street', to_date('21-01-2072', 'dd-mm-yyyy'), 'kyakovlev9e@scribd.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('34', 'Kev', 5913686023, '7303 Glacier Hill Lane', to_date('13-05-2110', 'dd-mm-yyyy'), 'kwalesax@yellowbook.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('340', 'Sanson', 1659304202, '038 Troy Circle', to_date('05-03-2121', 'dd-mm-yyyy'), 'snorthway9f@yandex.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('341', 'Barthel', 1385452740, '50951 Melby Terrace', to_date('16-05-2329', 'dd-mm-yyyy'), 'bbernath9g@163.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('342', 'Cesaro', 8161079797, '720 Thierer Terrace', to_date('11-11-2010', 'dd-mm-yyyy'), 'cwaine9h@usgs.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('343', 'Mable', 6909836609, '28 Gerald Place', to_date('29-01-2250', 'dd-mm-yyyy'), 'mdrysdall9i@g.co');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('344', 'Keven', 1416017123, '094 Sloan Trail', to_date('23-03-2253', 'dd-mm-yyyy'), 'kcleminshaw9j@examiner.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('345', 'Fitz', 7516768287, '66 Jenna Park', to_date('11-05-2209', 'dd-mm-yyyy'), 'fbenley9k@bbc.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('346', 'Shirleen', 3149787662, '6370 Oneill Center', to_date('10-09-2296', 'dd-mm-yyyy'), 'sbrinklow9l@indiatimes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('347', 'Janeta', 3982198307, '9012 Grasskamp Street', to_date('12-06-2224', 'dd-mm-yyyy'), 'jtabrett9m@yahoo.co.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('348', 'Veronique', 3818232182, '308 Dahle Point', to_date('21-07-2318', 'dd-mm-yyyy'), 'vlies9n@abc.net.au');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('349', 'Cass', 4992579222, '12292 Briar Crest Center', to_date('27-07-2306', 'dd-mm-yyyy'), 'cpechacek9o@squarespace.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('35', 'Agathe', 9823540804, '8 La Follette Avenue', to_date('26-05-2276', 'dd-mm-yyyy'), 'aduffreey@apache.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('350', 'Sean', 1432109152, '1 Weeping Birch Circle', to_date('26-04-2079', 'dd-mm-yyyy'), 'sburroughes9p@timesonline.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('351', 'Hobey', 4921610419, '0 Longview Circle', to_date('19-07-2028', 'dd-mm-yyyy'), 'hbottomley9q@wikipedia.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('352', 'Jorrie', 4796117629, '70 Fair Oaks Center', to_date('01-07-2137', 'dd-mm-yyyy'), 'jdwire9r@com.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('353', 'Oren', 8749693422, '366 Becker Junction', to_date('22-03-2244', 'dd-mm-yyyy'), 'odrayn9s@delicious.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('354', 'Sullivan', 5907385084, '7 High Crossing Drive', to_date('30-07-2154', 'dd-mm-yyyy'), 'scowell9t@alibaba.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('355', 'Nance', 6108442623, '51375 Spohn Court', to_date('21-10-2080', 'dd-mm-yyyy'), 'ndanslow9u@nationalgeographic.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('356', 'Burk', 6781033259, '930 Columbus Circle', to_date('17-11-2286', 'dd-mm-yyyy'), 'bmasedon9v@twitter.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('357', 'Marnie', 8445434476, '8 Talisman Terrace', to_date('18-04-2284', 'dd-mm-yyyy'), 'mfakeley9w@businessweek.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('358', 'Ab', 4968760651, '029 Kedzie Terrace', to_date('06-09-2291', 'dd-mm-yyyy'), 'ahutton9x@wp.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('359', 'Sansone', 1264358044, '4 Scoville Alley', to_date('22-02-2121', 'dd-mm-yyyy'), 'sfidoe9y@ucoz.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('36', 'Whittaker', 9494794439, '86341 Linden Parkway', to_date('29-08-2112', 'dd-mm-yyyy'), 'wshoebottomz@seattletimes.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('360', 'Wit', 2647575806, '28711 Blue Bill Park Junction', to_date('17-11-2048', 'dd-mm-yyyy'), 'wguslon9z@blogger.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('361', 'Catherine', 2811981761, '15 Summit Circle', to_date('07-02-2168', 'dd-mm-yyyy'), 'cwilcota0@qq.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('362', 'Susi', 4891276218, '04 Old Gate Circle', to_date('19-10-2224', 'dd-mm-yyyy'), 'sduminia1@scribd.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('363', 'Tymon', 1422201861, '2145 Butternut Point', to_date('04-05-2124', 'dd-mm-yyyy'), 'tblunsena2@nba.com');
commit;
prompt 700 records committed...
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('364', 'Monroe', 6732973533, '836 Hoffman Way', to_date('01-07-2328', 'dd-mm-yyyy'), 'mguillouxa3@yolasite.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('365', 'Waylin', 9282280382, '550 Anniversary Crossing', to_date('18-07-2029', 'dd-mm-yyyy'), 'wdelorta4@wix.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('366', 'Van', 5124469968, '9 Main Avenue', to_date('21-06-2277', 'dd-mm-yyyy'), 'vbroadeya5@spiegel.de');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('367', 'Enrico', 9365591082, '37 Randy Plaza', to_date('10-09-2160', 'dd-mm-yyyy'), 'egheorghea6@a8.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('368', 'Jens', 4131458095, '2870 Melrose Avenue', to_date('05-01-2138', 'dd-mm-yyyy'), 'jcoverlyna7@is.gd');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('369', 'Renae', 3928953079, '1115 Cody Pass', to_date('23-07-2088', 'dd-mm-yyyy'), 'rpfeiffera8@shutterfly.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('37', 'Melony', 3515494371, '93 Drewry Way', to_date('25-11-1981', 'dd-mm-yyyy'), 'msansbury10@wordpress.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('370', 'Jana', 1841666837, '542 Maple Wood Circle', to_date('05-07-2020', 'dd-mm-yyyy'), 'jjergera9@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('371', 'Abraham', 6819858934, '74 Monterey Avenue', to_date('01-12-1995', 'dd-mm-yyyy'), 'acheeldaa@yandex.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('372', 'Cyrillus', 9624421755, '037 Ludington Alley', to_date('19-09-2304', 'dd-mm-yyyy'), 'cstovingab@ucoz.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('373', 'Neille', 9096365177, '394 Browning Pass', to_date('23-07-2164', 'dd-mm-yyyy'), 'nrussilllac@about.me');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('374', 'Kele', 8596527370, '29820 Clarendon Crossing', to_date('10-05-2168', 'dd-mm-yyyy'), 'kshrievesad@google.com.hk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('375', 'Jacky', 3785879474, '0719 Dayton Lane', to_date('15-09-2080', 'dd-mm-yyyy'), 'jcarruthersae@upenn.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('376', 'Jamie', 7016798671, '6 Macpherson Terrace', to_date('11-03-2282', 'dd-mm-yyyy'), 'jrahlofaf@bluehost.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('377', 'Tab', 1928932914, '2414 Fairfield Drive', to_date('06-04-2094', 'dd-mm-yyyy'), 'tostrichag@bloglines.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('378', 'Thibaut', 9401337213, '28107 Dahle Point', to_date('31-07-1992', 'dd-mm-yyyy'), 'tdietscheah@zdnet.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('379', 'Aldridge', 5504030840, '74298 Mcguire Alley', to_date('08-09-2308', 'dd-mm-yyyy'), 'abunnellai@prweb.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('38', 'Sigismond', 2369812415, '2614 Ohio Alley', to_date('24-03-2155', 'dd-mm-yyyy'), 'sloffhead11@timesonline.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('380', 'Charleen', 6872052422, '2 Tomscot Circle', to_date('01-03-2233', 'dd-mm-yyyy'), 'cconingaj@indiegogo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('381', 'Pietrek', 1652119045, '59 Continental Court', to_date('22-03-2206', 'dd-mm-yyyy'), 'psimukovak@joomla.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('382', 'Anestassia', 4161315580, '675 Mendota Alley', to_date('16-06-2251', 'dd-mm-yyyy'), 'againsfordal@cornell.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('383', 'Nalani', 4237367558, '22445 Londonderry Parkway', to_date('13-08-2252', 'dd-mm-yyyy'), 'ncalwayam@reddit.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('384', 'Fredric', 5783973260, '5 Nobel Street', to_date('01-02-2273', 'dd-mm-yyyy'), 'fgobyan@istockphoto.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('39', 'Shermie', 3318858151, '68 Everett Avenue', to_date('18-09-2288', 'dd-mm-yyyy'), 'spetegrew12@uiuc.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('40', 'Cordey', 5526655260, '54439 Anhalt Terrace', to_date('22-11-2315', 'dd-mm-yyyy'), 'cbrafield13@wikipedia.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('41', 'Terrence', 5504606023, '6224 Messerschmidt Street', to_date('04-01-2000', 'dd-mm-yyyy'), 'tcretney14@census.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('42', 'Latashia', 7449013116, '97273 Memorial Point', to_date('25-06-2007', 'dd-mm-yyyy'), 'lcohani15@freewebs.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('43', 'Margaux', 8465691204, '800 Bultman Terrace', to_date('18-03-2086', 'dd-mm-yyyy'), 'mhowen16@census.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('44', 'Haydon', 4672768979, '95163 Hoffman Parkway', to_date('30-09-2029', 'dd-mm-yyyy'), 'hcrosland17@pinterest.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('45', 'Christen', 5928212005, '05053 Bellgrove Center', to_date('30-11-2128', 'dd-mm-yyyy'), 'clegalle18@salon.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('46', 'Roberto', 5014712037, '78 Warner Center', to_date('11-09-2128', 'dd-mm-yyyy'), 'rverheyden19@sakura.ne.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('47', 'Shirlene', 6338757055, '46632 Loomis Center', to_date('07-02-2103', 'dd-mm-yyyy'), 'shefford1a@cyberchimps.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('48', 'Elbert', 9868441294, '3 Old Shore Street', to_date('30-10-2218', 'dd-mm-yyyy'), 'esmithen1b@creativecommons.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('49', 'Danie', 1951366674, '73188 Bunker Hill Street', to_date('14-12-2085', 'dd-mm-yyyy'), 'dmurrie1c@paypal.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('50', 'Thornton', 8313053915, '55 Rigney Street', to_date('01-06-2141', 'dd-mm-yyyy'), 'tinstock1d@ustream.tv');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('51', 'Fancie', 5512589154, '8728 Melrose Circle', to_date('08-02-1987', 'dd-mm-yyyy'), 'fwaldren1e@ehow.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('52', 'Fannie', 5346610112, '3 Springs Way', to_date('16-09-2147', 'dd-mm-yyyy'), 'fgransden1f@wikia.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('53', 'Hettie', 7514303860, '07276 Dawn Plaza', to_date('28-04-2084', 'dd-mm-yyyy'), 'hmactrustam1g@unc.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('54', 'Roderick', 1603991246, '0 Coolidge Point', to_date('02-11-2268', 'dd-mm-yyyy'), 'rleacy1h@zimbio.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('55', 'Willyt', 9185659720, '7 Oak Valley Place', to_date('30-11-2154', 'dd-mm-yyyy'), 'wyukhov1i@netscape.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('56', 'Irvin', 9049178465, '567 Sunfield Place', to_date('26-11-2066', 'dd-mm-yyyy'), 'igaiford1j@house.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('57', 'Jorry', 2857778462, '168 Cambridge Parkway', to_date('11-04-2237', 'dd-mm-yyyy'), 'jraiker1k@over-blog.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('58', 'Jasun', 3845173714, '3938 Delaware Street', to_date('08-04-2226', 'dd-mm-yyyy'), 'jferentz1l@g.co');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('59', 'Barbabra', 3524441177, '63 Warbler Trail', to_date('31-07-2014', 'dd-mm-yyyy'), 'btethcote1m@google.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('60', 'Ruthann', 3028460511, '22 Dennis Lane', to_date('20-11-2287', 'dd-mm-yyyy'), 'rcrammy1n@symantec.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('61', 'Timothee', 3828524992, '2 Vahlen Center', to_date('07-08-2065', 'dd-mm-yyyy'), 'tcottel1o@sohu.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('62', 'Gloriane', 9352840470, '3777 Corscot Drive', to_date('24-06-2092', 'dd-mm-yyyy'), 'gvials1p@tiny.cc');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('63', 'Noelyn', 4399302993, '13929 Menomonie Center', to_date('06-08-2291', 'dd-mm-yyyy'), 'njosifovitz1q@senate.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('64', 'Marcile', 2328622964, '0182 New Castle Place', to_date('14-12-2315', 'dd-mm-yyyy'), 'mhuyhton1r@uiuc.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('65', 'Shaine', 8152508455, '896 Vera Parkway', to_date('30-08-2138', 'dd-mm-yyyy'), 'smccard1s@cpanel.net');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('66', 'Kore', 2967029781, '03577 Haas Trail', to_date('27-04-2172', 'dd-mm-yyyy'), 'kglassford1t@soundcloud.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('67', 'Adelbert', 6041150956, '8682 Cascade Street', to_date('10-12-2066', 'dd-mm-yyyy'), 'atrenholm1u@scribd.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('68', 'Fraze', 6123819548, '8780 Butterfield Lane', to_date('02-12-1987', 'dd-mm-yyyy'), 'fgrieves1v@umich.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('69', 'Hettie', 2377240860, '07 Eagan Way', to_date('23-09-2265', 'dd-mm-yyyy'), 'hgrindle1w@livejournal.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('70', 'Jackie', 2828374024, '84 Badeau Road', to_date('27-04-2131', 'dd-mm-yyyy'), 'jjury1x@globo.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('71', 'Kaile', 6502452832, '48936 Hanover Crossing', to_date('10-05-2062', 'dd-mm-yyyy'), 'kvamplew1y@amazon.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('72', 'Lotta', 1664831168, '055 Tennessee Lane', to_date('27-11-2143', 'dd-mm-yyyy'), 'lcomino1z@auda.org.au');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('73', 'Merralee', 1203132102, '11 Glendale Hill', to_date('14-03-2002', 'dd-mm-yyyy'), 'mvaun20@stumbleupon.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('74', 'Bard', 7683223786, '9 Lighthouse Bay Way', to_date('19-08-2169', 'dd-mm-yyyy'), 'bgittus21@hostgator.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('75', 'Bibbie', 5841042820, '08870 Menomonie Court', to_date('26-09-2324', 'dd-mm-yyyy'), 'bneve22@gravatar.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('76', 'Juditha', 1987475798, '3 Scoville Center', to_date('01-09-2074', 'dd-mm-yyyy'), 'jison23@japanpost.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('77', 'Annalise', 8554554818, '8 Debra Point', to_date('16-07-2287', 'dd-mm-yyyy'), 'afrean24@tripadvisor.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('78', 'Winfield', 6436835680, '9092 Sachtjen Avenue', to_date('06-01-2101', 'dd-mm-yyyy'), 'wspinnace25@weather.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('79', 'Norbie', 3294038705, '50 Elmside Park', to_date('14-08-2136', 'dd-mm-yyyy'), 'nmcconnal26@reference.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('80', 'Lee', 2181851852, '40 Fisk Place', to_date('10-02-2009', 'dd-mm-yyyy'), 'lelgar27@state.gov');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('81', 'Cornelius', 7713727063, '03237 Granby Road', to_date('24-08-2132', 'dd-mm-yyyy'), 'cbrimicombe28@ebay.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('82', 'Doralynn', 6269120021, '62401 6th Plaza', to_date('21-12-2243', 'dd-mm-yyyy'), 'dtyson29@uiuc.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('83', 'Stern', 8849468501, '96 Ronald Regan Crossing', to_date('05-05-2181', 'dd-mm-yyyy'), 'ssparkes2a@opensource.org');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('84', 'Bordy', 2628179196, '72747 Larry Drive', to_date('03-10-2042', 'dd-mm-yyyy'), 'bbowbrick2b@mtv.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('85', 'Devinne', 7101082109, '5 Laurel Street', to_date('06-03-2087', 'dd-mm-yyyy'), 'dvandevelde2c@ebay.co.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('86', 'Broderick', 6197329382, '29 Merchant Street', to_date('02-07-2079', 'dd-mm-yyyy'), 'bculver2d@msu.edu');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('87', 'Devi', 3715054096, '8128 Packers Center', to_date('06-05-2202', 'dd-mm-yyyy'), 'dbanham2e@t.co');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('88', 'Persis', 3721247693, '4 Troy Court', to_date('07-05-2157', 'dd-mm-yyyy'), 'pbirley2f@pen.io');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('89', 'Flynn', 9129835445, '434 Anniversary Circle', to_date('13-11-2006', 'dd-mm-yyyy'), 'ffontelles2g@comsenz.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('90', 'Elysia', 5309073056, '7 Randy Drive', to_date('27-12-2310', 'dd-mm-yyyy'), 'eriping2h@t-online.de');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('91', 'Zsazsa', 2767820098, '7 Starling Terrace', to_date('14-10-2070', 'dd-mm-yyyy'), 'zpenvarden2i@mediafire.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('92', 'Glynda', 9485529511, '969 West Terrace', to_date('05-07-2067', 'dd-mm-yyyy'), 'gdadd2j@mtv.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('93', 'Theodora', 2405602245, '1791 Gerald Alley', to_date('19-09-2267', 'dd-mm-yyyy'), 'tscinelli2k@yahoo.co.jp');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('94', 'Kial', 8355800159, '6443 Buell Street', to_date('21-07-2250', 'dd-mm-yyyy'), 'kgamlyn2l@example.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('95', 'Regan', 5077661137, '96739 Menomonie Circle', to_date('30-01-2302', 'dd-mm-yyyy'), 'rabbe2m@odnoklassniki.ru');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('96', 'Hildagarde', 6409358469, '05 Waywood Parkway', to_date('04-09-2158', 'dd-mm-yyyy'), 'hslocomb2n@theguardian.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('97', 'Penelope', 6172571471, '0820 Fairfield Drive', to_date('23-10-2199', 'dd-mm-yyyy'), 'pcongrave2o@yelp.com');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('98', 'Nehemiah', 9148847818, '74 Laurel Way', to_date('27-02-2173', 'dd-mm-yyyy'), 'nmallinder2p@gov.uk');
insert into VOLUNTEER (volunteer_id, naame, phonnum, address, dateofbirth, teemail)
values ('99', 'Shaine', 1155590445, '67174 Calypso Parkway', to_date('03-09-2037', 'dd-mm-yyyy'), 'sreal2q@businessinsider.com');
commit;
prompt 784 records loaded
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
prompt Loading OUREVENT...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (1, 'Birth', 'Tel Aviv', to_date('01-01-2024', 'dd-mm-yyyy'), 1, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (2, 'Burn', 'Jerusalem', to_date('01-02-2024', 'dd-mm-yyyy'), 2, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (3, 'Shooting Attack', 'Haifa', to_date('01-03-2024', 'dd-mm-yyyy'), 3, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (4, 'Car Accident', 'Beersheba', to_date('01-04-2024', 'dd-mm-yyyy'), 4, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (5, 'Heart Attack', 'Rishon LeZion', to_date('01-05-2024', 'dd-mm-yyyy'), 5, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (6, 'Stroke', 'Petah Tikva', to_date('01-06-2024', 'dd-mm-yyyy'), 6, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (7, 'Drowning', 'Ashdod', to_date('01-07-2024', 'dd-mm-yyyy'), 7, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (8, 'Electrocution', 'Netanya', to_date('01-08-2024', 'dd-mm-yyyy'), 8, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (9, 'Fall Injury', 'Holon', to_date('01-09-2024', 'dd-mm-yyyy'), 9, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (10, 'Poisoning', 'Bnei Brak', to_date('01-10-2024', 'dd-mm-yyyy'), 10, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11111, 'Shooting Attack', 'Biella', to_date('12-08-2020', 'dd-mm-yyyy'), 11143, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11112, 'Burn', 'Maidstone', to_date('22-11-2020', 'dd-mm-yyyy'), 11266, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11113, 'Burn', 'Recife', to_date('11-07-2023', 'dd-mm-yyyy'), 11200, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11114, 'Birth', 'Charlottesville', to_date('28-01-2020', 'dd-mm-yyyy'), 11378, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11115, 'Fall Injury', 'Lisbon', to_date('17-06-2023', 'dd-mm-yyyy'), 11243, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11116, 'Car Accident', 'Malm׳¦', to_date('10-12-2023', 'dd-mm-yyyy'), 11, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11117, 'Birth', 'Dinslaken', to_date('19-03-2021', 'dd-mm-yyyy'), 11500, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11118, 'Car Accident', 'Tallahassee', to_date('13-10-2023', 'dd-mm-yyyy'), 11346, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11119, 'Poisoning', 'Dortmund', to_date('28-04-2023', 'dd-mm-yyyy'), 11286, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11120, 'Fall Injury', 'Juazeiro', to_date('17-05-2023', 'dd-mm-yyyy'), 11305, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11121, 'Fall Injury', 'Singapore', to_date('18-09-2023', 'dd-mm-yyyy'), 11357, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11122, 'Birth', 'Foster City', to_date('10-10-2021', 'dd-mm-yyyy'), 11317, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11123, 'Poisoning', 'Media', to_date('09-09-2022', 'dd-mm-yyyy'), 11270, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11124, 'Shooting Attack', 'Colorado Springs', to_date('11-03-2020', 'dd-mm-yyyy'), 11150, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11125, 'Shooting Attack', 'The Woodlands', to_date('07-07-2020', 'dd-mm-yyyy'), 11187, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11126, 'Fall Injury', 'Hanover', to_date('06-12-2020', 'dd-mm-yyyy'), 11208, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11127, 'Birth', 'Kanazawa', to_date('20-08-2021', 'dd-mm-yyyy'), 11392, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11128, 'Car Accident', 'Di Savigliano', to_date('14-09-2020', 'dd-mm-yyyy'), 11237, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11129, 'Birth', 'Bloomington', to_date('18-10-2020', 'dd-mm-yyyy'), 11358, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11130, 'Fall Injury', 'Ramat Gan', to_date('29-12-2022', 'dd-mm-yyyy'), 11425, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11131, 'Burn', 'Sao caetano do sul', to_date('20-06-2023', 'dd-mm-yyyy'), 11469, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11132, 'Burn', 'Holderbank', to_date('05-03-2021', 'dd-mm-yyyy'), 11271, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11133, 'Birth', 'Vallauris', to_date('24-06-2021', 'dd-mm-yyyy'), 12, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11134, 'Birth', 'Marietta', to_date('06-05-2021', 'dd-mm-yyyy'), 11420, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11135, 'Fall Injury', 'Kuraby', to_date('02-09-2023', 'dd-mm-yyyy'), 11432, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11136, 'Shooting Attack', 'Johor Bahru', to_date('09-12-2021', 'dd-mm-yyyy'), 11404, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11137, 'Poisoning', 'Naestved', to_date('14-06-2021', 'dd-mm-yyyy'), 11334, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11138, 'Fall Injury', 'Portland', to_date('28-11-2020', 'dd-mm-yyyy'), 11262, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11139, 'Shooting Attack', 'Pacific Grove', to_date('02-12-2023', 'dd-mm-yyyy'), 11195, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11140, 'Car Accident', 'Darmstadt', to_date('11-12-2022', 'dd-mm-yyyy'), 11246, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11141, 'Poisoning', 'Rockland', to_date('26-12-2023', 'dd-mm-yyyy'), 11430, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11142, 'Poisoning', 'Boulogne', to_date('13-08-2021', 'dd-mm-yyyy'), 11364, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11143, 'Fall Injury', 'Wehrheim', to_date('15-04-2020', 'dd-mm-yyyy'), 11141, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11144, 'Car Accident', 'Bethesda', to_date('17-08-2022', 'dd-mm-yyyy'), 11418, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11145, 'Fall Injury', 'Courbevoie', to_date('28-04-2023', 'dd-mm-yyyy'), 11308, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11146, 'Fall Injury', 'Berlin-Adlershof', to_date('12-10-2022', 'dd-mm-yyyy'), 11159, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11147, 'Birth', 'Elche', to_date('01-09-2021', 'dd-mm-yyyy'), 11389, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11148, 'Shooting Attack', 'Chambery', to_date('19-08-2021', 'dd-mm-yyyy'), 11410, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11149, 'Shooting Attack', 'Corona', to_date('18-07-2020', 'dd-mm-yyyy'), 11286, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11150, 'Shooting Attack', 'Olympia', to_date('11-11-2021', 'dd-mm-yyyy'), 11135, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11151, 'Birth', 'Cerritos', to_date('22-11-2020', 'dd-mm-yyyy'), 11270, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11152, 'Poisoning', 'Spring City', to_date('28-01-2021', 'dd-mm-yyyy'), 11135, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11153, 'Birth', 'Knoxville', to_date('10-03-2020', 'dd-mm-yyyy'), 11434, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11154, 'Poisoning', 'Sundsvall', to_date('14-09-2022', 'dd-mm-yyyy'), 11124, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11155, 'Fall Injury', 'Istanbul', to_date('19-09-2021', 'dd-mm-yyyy'), 11262, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11156, 'Poisoning', 'Oxford', to_date('01-11-2022', 'dd-mm-yyyy'), 11427, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11157, 'Poisoning', 'Hochwald', to_date('02-06-2022', 'dd-mm-yyyy'), 11470, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11158, 'Burn', 'Warsaw', to_date('25-02-2020', 'dd-mm-yyyy'), 11343, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11159, 'Car Accident', 'Irkutsk', to_date('23-11-2020', 'dd-mm-yyyy'), 11387, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11160, 'Fall Injury', 'Mount Laurel', to_date('09-02-2020', 'dd-mm-yyyy'), 11396, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11161, 'Birth', 'Foster City', to_date('03-06-2021', 'dd-mm-yyyy'), 11134, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11162, 'Birth', 'Bristol', to_date('06-02-2020', 'dd-mm-yyyy'), 11331, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11163, 'Fall Injury', 'Hines', to_date('01-11-2023', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11164, 'Burn', 'Pearland', to_date('05-09-2023', 'dd-mm-yyyy'), 11387, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11165, 'Shooting Attack', 'Mantova', to_date('11-10-2022', 'dd-mm-yyyy'), 11239, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11166, 'Shooting Attack', 'Blue bell', to_date('16-01-2020', 'dd-mm-yyyy'), 11349, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11167, 'Burn', 'Manaus', to_date('10-10-2022', 'dd-mm-yyyy'), 11408, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11168, 'Birth', 'Koppl', to_date('23-06-2021', 'dd-mm-yyyy'), 11247, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11169, 'Fall Injury', 'Carson City', to_date('19-04-2022', 'dd-mm-yyyy'), 11314, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11170, 'Poisoning', 'Vancouver', to_date('27-04-2020', 'dd-mm-yyyy'), 11131, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11171, 'Poisoning', 'Casselberry', to_date('25-01-2020', 'dd-mm-yyyy'), 11242, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11172, 'Fall Injury', 'Osaka', to_date('21-09-2023', 'dd-mm-yyyy'), 11224, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11173, 'Fall Injury', 'Moorestown', to_date('06-03-2021', 'dd-mm-yyyy'), 11246, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11174, 'Car Accident', 'Salzburg', to_date('07-07-2021', 'dd-mm-yyyy'), 11255, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11175, 'Fall Injury', 'Gothenburg', to_date('19-09-2020', 'dd-mm-yyyy'), 11199, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11176, 'Poisoning', 'Matsuyama', to_date('17-01-2023', 'dd-mm-yyyy'), 11363, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11177, 'Shooting Attack', 'Clark', to_date('08-10-2022', 'dd-mm-yyyy'), 11240, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11178, 'Poisoning', 'Americana', to_date('24-05-2020', 'dd-mm-yyyy'), 11418, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11179, 'Fall Injury', 'Olympia', to_date('08-07-2021', 'dd-mm-yyyy'), 11399, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11180, 'Shooting Attack', 'Macclesfield', to_date('13-01-2021', 'dd-mm-yyyy'), 11268, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11181, 'Fall Injury', 'Gen׳˜ve', to_date('12-11-2021', 'dd-mm-yyyy'), 11404, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11182, 'Shooting Attack', 'Wן¢•rzburg', to_date('03-02-2023', 'dd-mm-yyyy'), 11269, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11183, 'Fall Injury', 'Grapevine', to_date('01-03-2020', 'dd-mm-yyyy'), 11270, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11184, 'Car Accident', 'Long Island City', to_date('15-03-2023', 'dd-mm-yyyy'), 11428, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11185, 'Car Accident', 'Regina', to_date('17-01-2020', 'dd-mm-yyyy'), 11116, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11186, 'Poisoning', 'Padova', to_date('12-04-2022', 'dd-mm-yyyy'), 11489, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11187, 'Fall Injury', 'Mainz-kastel', to_date('07-07-2020', 'dd-mm-yyyy'), 11373, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11188, 'Poisoning', 'Redwood Shores', to_date('02-05-2021', 'dd-mm-yyyy'), 11133, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11189, 'Car Accident', 'Cuenca', to_date('29-11-2022', 'dd-mm-yyyy'), 11165, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11190, 'Burn', 'Biel', to_date('24-10-2021', 'dd-mm-yyyy'), 11452, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11191, 'Birth', 'O''fallon', to_date('27-04-2020', 'dd-mm-yyyy'), 11111, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11192, 'Fall Injury', 'Sao caetano do sul', to_date('17-05-2023', 'dd-mm-yyyy'), 11198, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11193, 'Shooting Attack', 'North Yorkshire', to_date('03-06-2021', 'dd-mm-yyyy'), 11117, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11194, 'Fall Injury', 'Cherepovets', to_date('16-04-2021', 'dd-mm-yyyy'), 11449, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11195, 'Fall Injury', 'Fukui', to_date('10-06-2021', 'dd-mm-yyyy'), 11182, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11196, 'Fall Injury', 'Streamwood', to_date('19-02-2020', 'dd-mm-yyyy'), 11361, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11197, 'Birth', 'Buffalo Grove', to_date('25-12-2021', 'dd-mm-yyyy'), 11208, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11198, 'Birth', 'Oyten', to_date('25-04-2022', 'dd-mm-yyyy'), 11446, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11199, 'Fall Injury', 'Caguas', to_date('14-12-2022', 'dd-mm-yyyy'), 11432, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11200, 'Birth', 'East Peoria', to_date('15-04-2023', 'dd-mm-yyyy'), 11395, null);
commit;
prompt 100 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11201, 'Burn', 'Protvino', to_date('27-08-2020', 'dd-mm-yyyy'), 11474, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11202, 'Fall Injury', 'Southampton', to_date('17-05-2020', 'dd-mm-yyyy'), 11224, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11203, 'Fall Injury', 'California', to_date('30-08-2020', 'dd-mm-yyyy'), 11214, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11204, 'Fall Injury', 'Uden', to_date('12-10-2021', 'dd-mm-yyyy'), 11336, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11205, 'Fall Injury', 'Trieste', to_date('19-07-2020', 'dd-mm-yyyy'), 11234, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11206, 'Burn', 'Fort McMurray', to_date('12-06-2020', 'dd-mm-yyyy'), 11370, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11207, 'Shooting Attack', 'Lippetal', to_date('12-01-2020', 'dd-mm-yyyy'), 11228, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11208, 'Poisoning', 'Algermissen', to_date('29-11-2023', 'dd-mm-yyyy'), 2, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11209, 'Birth', 'Fairbanks', to_date('06-03-2022', 'dd-mm-yyyy'), 11292, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11210, 'Fall Injury', 'Zuerich', to_date('13-05-2020', 'dd-mm-yyyy'), 11374, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11211, 'Birth', 'Chapeco', to_date('14-01-2021', 'dd-mm-yyyy'), 11429, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11212, 'Shooting Attack', 'Peine', to_date('18-03-2022', 'dd-mm-yyyy'), 11272, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11213, 'Shooting Attack', 'Goiania', to_date('24-04-2020', 'dd-mm-yyyy'), 11281, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11214, 'Car Accident', 'Cypress', to_date('23-05-2022', 'dd-mm-yyyy'), 11394, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11215, 'Shooting Attack', 'Hayward', to_date('29-12-2023', 'dd-mm-yyyy'), 11477, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11216, 'Car Accident', 'Raleigh', to_date('19-11-2021', 'dd-mm-yyyy'), 11270, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11217, 'Fall Injury', 'Takapuna', to_date('12-07-2021', 'dd-mm-yyyy'), 11389, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11218, 'Birth', 'Fornacette', to_date('25-05-2022', 'dd-mm-yyyy'), 13, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11219, 'Fall Injury', 'K׳¨benhavn', to_date('02-04-2023', 'dd-mm-yyyy'), 11399, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11220, 'Fall Injury', 'Buenos Aires', to_date('09-02-2020', 'dd-mm-yyyy'), 11271, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11221, 'Shooting Attack', 'Coldmeece', to_date('06-05-2021', 'dd-mm-yyyy'), 11319, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11222, 'Burn', 'Suwon-city', to_date('04-01-2021', 'dd-mm-yyyy'), 11264, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11223, 'Burn', 'Santana do parna׳ba', to_date('05-10-2023', 'dd-mm-yyyy'), 11326, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11224, 'Birth', 'San Jose', to_date('28-07-2022', 'dd-mm-yyyy'), 11433, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11225, 'Birth', 'Towson', to_date('21-05-2023', 'dd-mm-yyyy'), 11214, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11226, 'Birth', 'Gummersbach', to_date('08-02-2020', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11227, 'Burn', 'Paisley', to_date('15-10-2020', 'dd-mm-yyyy'), 11132, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11228, 'Poisoning', 'Milwaukee', to_date('01-12-2020', 'dd-mm-yyyy'), 11494, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11229, 'Birth', 'Brisbane', to_date('10-11-2023', 'dd-mm-yyyy'), 11367, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11230, 'Fall Injury', 'Media', to_date('18-10-2021', 'dd-mm-yyyy'), 11403, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11231, 'Shooting Attack', 'Courbevoie', to_date('04-11-2023', 'dd-mm-yyyy'), 11189, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11232, 'Burn', 'Key Biscayne', to_date('25-05-2023', 'dd-mm-yyyy'), 11265, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11233, 'Birth', 'Freising', to_date('24-07-2020', 'dd-mm-yyyy'), 11263, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11234, 'Burn', 'Juneau', to_date('01-09-2022', 'dd-mm-yyyy'), 11214, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11235, 'Car Accident', 'Pusan-city', to_date('03-03-2022', 'dd-mm-yyyy'), 11396, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11236, 'Burn', 'Wuerzburg', to_date('27-09-2023', 'dd-mm-yyyy'), 11142, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11237, 'Birth', 'Goteborg', to_date('02-06-2021', 'dd-mm-yyyy'), 11248, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11238, 'Car Accident', 'Chorz׳£w', to_date('16-03-2022', 'dd-mm-yyyy'), 11395, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11239, 'Car Accident', 'Media', to_date('10-01-2020', 'dd-mm-yyyy'), 11351, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11240, 'Fall Injury', 'Peine', to_date('23-08-2022', 'dd-mm-yyyy'), 11126, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11241, 'Burn', 'Erlangen', to_date('17-01-2023', 'dd-mm-yyyy'), 11214, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11242, 'Birth', 'Rorschach', to_date('01-10-2021', 'dd-mm-yyyy'), 11311, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11243, 'Car Accident', 'Nizhnevartovsk', to_date('07-04-2020', 'dd-mm-yyyy'), 11242, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11244, 'Shooting Attack', 'San Jose', to_date('13-11-2023', 'dd-mm-yyyy'), 11281, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11245, 'Poisoning', 'Lucca', to_date('23-02-2022', 'dd-mm-yyyy'), 11328, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11246, 'Car Accident', 'Bergara', to_date('24-07-2021', 'dd-mm-yyyy'), 11308, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11247, 'Poisoning', 'Sao paulo', to_date('20-08-2020', 'dd-mm-yyyy'), 11447, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11248, 'Car Accident', 'H׳”ssleholm', to_date('02-07-2020', 'dd-mm-yyyy'), 11418, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11249, 'Birth', 'Karachi', to_date('02-05-2023', 'dd-mm-yyyy'), 11328, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11250, 'Car Accident', 'Erlangen', to_date('22-06-2022', 'dd-mm-yyyy'), 11306, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11251, 'Fall Injury', 'Chinnor', to_date('12-06-2022', 'dd-mm-yyyy'), 11297, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11252, 'Car Accident', 'Middletown', to_date('01-01-2022', 'dd-mm-yyyy'), 11267, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11253, 'Poisoning', 'Rockland', to_date('05-04-2022', 'dd-mm-yyyy'), 11422, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11254, 'Burn', 'Ithaca', to_date('30-05-2022', 'dd-mm-yyyy'), 11202, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11255, 'Birth', 'Fremont', to_date('28-08-2022', 'dd-mm-yyyy'), 11482, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11256, 'Birth', 'Newcastle upon Tyne', to_date('07-09-2022', 'dd-mm-yyyy'), 11188, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11257, 'Poisoning', 'Maryville', to_date('29-12-2020', 'dd-mm-yyyy'), 11280, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11258, 'Birth', 'Mapo-gu', to_date('17-11-2020', 'dd-mm-yyyy'), 11198, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11259, 'Car Accident', 'Hackensack', to_date('07-10-2021', 'dd-mm-yyyy'), 11364, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11260, 'Birth', 'Carlin', to_date('23-03-2022', 'dd-mm-yyyy'), 11401, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11261, 'Fall Injury', 'St Kilda', to_date('09-06-2023', 'dd-mm-yyyy'), 11345, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11262, 'Burn', 'Shawnee', to_date('05-02-2022', 'dd-mm-yyyy'), 11481, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11263, 'Fall Injury', 'Mechanicsburg', to_date('14-12-2023', 'dd-mm-yyyy'), 11331, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11264, 'Poisoning', 'Hartford', to_date('02-07-2023', 'dd-mm-yyyy'), 11249, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11265, 'Shooting Attack', 'Varzea grande', to_date('30-07-2020', 'dd-mm-yyyy'), 11384, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11266, 'Fall Injury', 'Cambridge', to_date('02-03-2023', 'dd-mm-yyyy'), 11306, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11267, 'Fall Injury', 'Leimen', to_date('06-05-2022', 'dd-mm-yyyy'), 11239, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11268, 'Burn', 'Udine', to_date('18-04-2020', 'dd-mm-yyyy'), 11134, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11269, 'Birth', 'Long Island City', to_date('17-09-2022', 'dd-mm-yyyy'), 11382, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11270, 'Fall Injury', 'Prague', to_date('28-11-2022', 'dd-mm-yyyy'), 11443, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11271, 'Car Accident', 'Eden prairie', to_date('15-01-2023', 'dd-mm-yyyy'), 11280, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11272, 'Fall Injury', 'Bad Oeynhausen', to_date('23-09-2021', 'dd-mm-yyyy'), 11154, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11273, 'Fall Injury', 'Rothenburg', to_date('21-08-2023', 'dd-mm-yyyy'), 11139, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11274, 'Shooting Attack', 'Phoenix', to_date('08-10-2022', 'dd-mm-yyyy'), 11112, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11275, 'Poisoning', 'Leawood', to_date('11-01-2021', 'dd-mm-yyyy'), 11291, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11276, 'Shooting Attack', 'Fairfax', to_date('23-04-2023', 'dd-mm-yyyy'), 11319, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11277, 'Birth', 'St Jean de Soudain', to_date('11-05-2020', 'dd-mm-yyyy'), 11212, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11278, 'Shooting Attack', 'Albuquerque', to_date('29-06-2022', 'dd-mm-yyyy'), 11194, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11279, 'Poisoning', 'San Antonio', to_date('13-03-2022', 'dd-mm-yyyy'), 11197, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11280, 'Poisoning', 'Blacksburg', to_date('01-06-2020', 'dd-mm-yyyy'), 12, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11281, 'Poisoning', 'Goslar', to_date('27-05-2023', 'dd-mm-yyyy'), 11384, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11282, 'Car Accident', 'Prague', to_date('13-03-2023', 'dd-mm-yyyy'), 11232, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11283, 'Burn', 'Ramat Gan', to_date('27-09-2021', 'dd-mm-yyyy'), 11280, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11284, 'Shooting Attack', 'Lakewood', to_date('05-11-2023', 'dd-mm-yyyy'), 11304, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11285, 'Poisoning', 'Long Island City', to_date('17-11-2023', 'dd-mm-yyyy'), 11289, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11286, 'Fall Injury', 'Encinitas', to_date('27-10-2021', 'dd-mm-yyyy'), 11401, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11287, 'Car Accident', 'Firenze', to_date('25-09-2021', 'dd-mm-yyyy'), 11437, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11288, 'Car Accident', 'Osaka', to_date('09-07-2022', 'dd-mm-yyyy'), 11130, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11289, 'Burn', 'Media', to_date('13-01-2020', 'dd-mm-yyyy'), 11240, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11290, 'Birth', 'Mechelen', to_date('06-09-2023', 'dd-mm-yyyy'), 11338, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11291, 'Birth', 'Meerbusch', to_date('31-10-2020', 'dd-mm-yyyy'), 11220, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11292, 'Shooting Attack', 'Niigata', to_date('25-02-2022', 'dd-mm-yyyy'), 11232, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11293, 'Birth', 'Fair Lawn', to_date('27-01-2022', 'dd-mm-yyyy'), 11112, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11294, 'Birth', 'Visselh׳¦vede', to_date('01-12-2021', 'dd-mm-yyyy'), 11327, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11295, 'Burn', 'P׳™tion-ville', to_date('27-12-2020', 'dd-mm-yyyy'), 11282, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11296, 'Burn', 'Chiba', to_date('01-06-2022', 'dd-mm-yyyy'), 11459, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11297, 'Fall Injury', 'Edenbridge', to_date('15-06-2021', 'dd-mm-yyyy'), 11153, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11298, 'Car Accident', 'Mechanicsburg', to_date('08-03-2021', 'dd-mm-yyyy'), 11445, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11299, 'Birth', 'Belo Horizonte', to_date('05-06-2022', 'dd-mm-yyyy'), 11281, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11300, 'Fall Injury', 'Olsztyn', to_date('19-11-2022', 'dd-mm-yyyy'), 11352, null);
commit;
prompt 200 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11301, 'Fall Injury', 'Rome', to_date('22-12-2021', 'dd-mm-yyyy'), 11224, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11302, 'Poisoning', 'Jacksonville', to_date('21-12-2022', 'dd-mm-yyyy'), 11401, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11303, 'Birth', 'Forest Park', to_date('15-05-2020', 'dd-mm-yyyy'), 11404, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11304, 'Shooting Attack', 'Edmonton', to_date('05-03-2023', 'dd-mm-yyyy'), 11217, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11305, 'Burn', 'Karachi', to_date('08-05-2022', 'dd-mm-yyyy'), 11429, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11306, 'Burn', 'Royersford', to_date('12-04-2023', 'dd-mm-yyyy'), 11205, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11307, 'Birth', 'Qu׳™bec', to_date('15-09-2020', 'dd-mm-yyyy'), 11280, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11308, 'Burn', 'Boucherville', to_date('02-11-2021', 'dd-mm-yyyy'), 11350, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11309, 'Shooting Attack', 'Rancho Palos Verdes', to_date('06-02-2020', 'dd-mm-yyyy'), 11371, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11310, 'Burn', 'Uetikon am See', to_date('25-08-2020', 'dd-mm-yyyy'), 11265, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11311, 'Birth', 'Thalwil', to_date('31-10-2022', 'dd-mm-yyyy'), 11293, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11312, 'Fall Injury', 'Rosario', to_date('03-08-2021', 'dd-mm-yyyy'), 11115, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11313, 'Shooting Attack', 'West Chester', to_date('14-02-2020', 'dd-mm-yyyy'), 11371, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11314, 'Poisoning', 'Lancaster', to_date('12-04-2020', 'dd-mm-yyyy'), 11358, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11315, 'Car Accident', 'Tualatin', to_date('03-03-2023', 'dd-mm-yyyy'), 11114, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11316, 'Birth', 'Taipei', to_date('03-12-2020', 'dd-mm-yyyy'), 11138, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11317, 'Poisoning', 'Duesseldorf', to_date('26-04-2021', 'dd-mm-yyyy'), 11396, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11318, 'Shooting Attack', 'Aiken', to_date('09-12-2021', 'dd-mm-yyyy'), 11275, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11319, 'Birth', 'North Yorkshire', to_date('03-07-2022', 'dd-mm-yyyy'), 11325, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11320, 'Birth', 'Buenos Aires', to_date('03-02-2020', 'dd-mm-yyyy'), 11391, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11321, 'Burn', 'Mן¢•nchen', to_date('30-12-2023', 'dd-mm-yyyy'), 11163, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11322, 'Birth', 'Durban', to_date('29-12-2020', 'dd-mm-yyyy'), 11184, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11323, 'Burn', 'Plymouth Meeting', to_date('23-03-2020', 'dd-mm-yyyy'), 11484, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11324, 'Burn', 'Green bay', to_date('25-09-2020', 'dd-mm-yyyy'), 11186, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11325, 'Poisoning', 'Salvador', to_date('26-10-2022', 'dd-mm-yyyy'), 11372, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11326, 'Birth', 'Menlo Park', to_date('12-11-2022', 'dd-mm-yyyy'), 11244, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11327, 'Fall Injury', 'Protvino', to_date('02-05-2023', 'dd-mm-yyyy'), 11278, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11328, 'Burn', 'San Ramon', to_date('08-03-2021', 'dd-mm-yyyy'), 13, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11329, 'Birth', 'North bethesda', to_date('31-10-2021', 'dd-mm-yyyy'), 11462, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11330, 'Shooting Attack', 'Gdansk', to_date('03-07-2020', 'dd-mm-yyyy'), 11398, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11331, 'Poisoning', 'Colombes', to_date('03-08-2020', 'dd-mm-yyyy'), 11446, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11332, 'Fall Injury', 'Eiksmarka', to_date('15-05-2020', 'dd-mm-yyyy'), 11159, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11333, 'Poisoning', 'Richmond', to_date('09-11-2021', 'dd-mm-yyyy'), 11492, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11334, 'Birth', 'Toyama', to_date('24-03-2023', 'dd-mm-yyyy'), 11140, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11335, 'Car Accident', 'Mapo-gu', to_date('17-10-2022', 'dd-mm-yyyy'), 11365, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11336, 'Poisoning', 'Gersthofen', to_date('02-12-2022', 'dd-mm-yyyy'), 11250, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11337, 'Shooting Attack', 'Fuchstal-asch', to_date('25-12-2022', 'dd-mm-yyyy'), 11237, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11338, 'Birth', 'Charlottesville', to_date('23-08-2022', 'dd-mm-yyyy'), 11416, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11339, 'Fall Injury', 'Hunt Valley', to_date('29-05-2021', 'dd-mm-yyyy'), 11370, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11340, 'Birth', 'Parma', to_date('09-09-2023', 'dd-mm-yyyy'), 10, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11341, 'Birth', 'Shizuoka', to_date('30-03-2023', 'dd-mm-yyyy'), 11440, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11342, 'Car Accident', 'Bloomington', to_date('19-01-2022', 'dd-mm-yyyy'), 11178, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11343, 'Poisoning', 'Kongserbg', to_date('21-12-2021', 'dd-mm-yyyy'), 11253, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11344, 'Car Accident', 'Fort worth', to_date('27-03-2020', 'dd-mm-yyyy'), 11340, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11345, 'Birth', 'Tadley', to_date('07-08-2020', 'dd-mm-yyyy'), 11417, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11346, 'Fall Injury', 'Ittigen', to_date('22-09-2021', 'dd-mm-yyyy'), 11344, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11347, 'Shooting Attack', 'New Delhi', to_date('01-09-2021', 'dd-mm-yyyy'), 11158, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11348, 'Burn', 'Framingaham', to_date('08-11-2020', 'dd-mm-yyyy'), 11265, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11349, 'Shooting Attack', 'Sao caetano do sul', to_date('17-05-2020', 'dd-mm-yyyy'), 11333, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11350, 'Poisoning', 'Coldmeece', to_date('10-04-2021', 'dd-mm-yyyy'), 11446, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11351, 'Car Accident', 'Paraju', to_date('04-10-2022', 'dd-mm-yyyy'), 11119, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11352, 'Shooting Attack', 'Geneva', to_date('13-05-2022', 'dd-mm-yyyy'), 11173, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11353, 'Birth', 'Leipzig', to_date('30-04-2021', 'dd-mm-yyyy'), 11355, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11354, 'Shooting Attack', 'Wetzlar', to_date('12-09-2021', 'dd-mm-yyyy'), 11260, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11355, 'Poisoning', 'Tlalpan', to_date('20-09-2021', 'dd-mm-yyyy'), 11402, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11356, 'Burn', 'Lecanto', to_date('12-06-2021', 'dd-mm-yyyy'), 11435, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11357, 'Fall Injury', 'Nancy', to_date('12-01-2023', 'dd-mm-yyyy'), 11225, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11358, 'Shooting Attack', 'East Providence', to_date('06-03-2020', 'dd-mm-yyyy'), 11234, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11359, 'Shooting Attack', 'London', to_date('21-03-2023', 'dd-mm-yyyy'), 11216, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11360, 'Fall Injury', 'Rochester', to_date('14-07-2023', 'dd-mm-yyyy'), 11122, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11361, 'Poisoning', 'Bretzfeld-Waldbach', to_date('11-02-2022', 'dd-mm-yyyy'), 11204, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11362, 'Car Accident', 'Bratislava', to_date('09-07-2022', 'dd-mm-yyyy'), 11172, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11363, 'Birth', 'Espoo', to_date('30-07-2022', 'dd-mm-yyyy'), 11396, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11364, 'Shooting Attack', 'Brookfield', to_date('19-10-2021', 'dd-mm-yyyy'), 11441, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11365, 'Birth', 'Mechanicsburg', to_date('26-11-2023', 'dd-mm-yyyy'), 11482, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11366, 'Car Accident', 'Grand Rapids', to_date('03-11-2021', 'dd-mm-yyyy'), 11427, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11367, 'Shooting Attack', 'South Weber', to_date('09-12-2020', 'dd-mm-yyyy'), 11220, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11368, 'Car Accident', 'Mainz-kastel', to_date('31-01-2023', 'dd-mm-yyyy'), 11380, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11369, 'Poisoning', 'Geneva', to_date('07-07-2021', 'dd-mm-yyyy'), 11493, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11370, 'Shooting Attack', 'Mainz-kastel', to_date('10-12-2022', 'dd-mm-yyyy'), 11435, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11371, 'Burn', 'Caguas', to_date('05-07-2020', 'dd-mm-yyyy'), 11220, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11372, 'Poisoning', 'San Mateo', to_date('11-05-2020', 'dd-mm-yyyy'), 11385, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11373, 'Car Accident', 'Battle Creek', to_date('03-04-2022', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11374, 'Birth', 'Maidstone', to_date('05-11-2020', 'dd-mm-yyyy'), 11196, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11375, 'Poisoning', 'Oosterhout', to_date('18-06-2022', 'dd-mm-yyyy'), 11142, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11376, 'Fall Injury', 'Nordhausen', to_date('04-06-2022', 'dd-mm-yyyy'), 11263, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11377, 'Burn', 'Ljubljana', to_date('15-06-2023', 'dd-mm-yyyy'), 11137, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11378, 'Shooting Attack', 'Holts Summit', to_date('03-11-2020', 'dd-mm-yyyy'), 11129, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11379, 'Shooting Attack', 'Pacific Grove', to_date('24-02-2020', 'dd-mm-yyyy'), 11194, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11380, 'Birth', 'Hampton', to_date('04-01-2023', 'dd-mm-yyyy'), 11254, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11381, 'Shooting Attack', 'P׳™tion-ville', to_date('30-12-2020', 'dd-mm-yyyy'), 11176, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11382, 'Shooting Attack', 'Rtp', to_date('18-02-2021', 'dd-mm-yyyy'), 11406, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11383, 'Car Accident', 'Yucca', to_date('16-01-2023', 'dd-mm-yyyy'), 11487, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11384, 'Fall Injury', 'Karachi', to_date('05-11-2022', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11385, 'Poisoning', 'Monroe', to_date('30-10-2020', 'dd-mm-yyyy'), 11301, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11386, 'Fall Injury', 'East Providence', to_date('25-08-2020', 'dd-mm-yyyy'), 11505, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11387, 'Birth', 'Bellerose', to_date('31-05-2022', 'dd-mm-yyyy'), 11461, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11388, 'Fall Injury', 'Harahan', to_date('10-05-2022', 'dd-mm-yyyy'), 11154, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11389, 'Fall Injury', 'Lake Forest', to_date('13-02-2021', 'dd-mm-yyyy'), 11317, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11390, 'Car Accident', 'Lן¢•beck', to_date('05-05-2023', 'dd-mm-yyyy'), 11319, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11391, 'Fall Injury', 'Altst׳”tten', to_date('12-02-2023', 'dd-mm-yyyy'), 11273, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11392, 'Birth', 'Santa rita sapuca׳', to_date('11-02-2022', 'dd-mm-yyyy'), 4, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11393, 'Shooting Attack', 'Bismarck', to_date('29-08-2020', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11394, 'Car Accident', 'Glen Cove', to_date('08-10-2021', 'dd-mm-yyyy'), 11336, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11395, 'Burn', 'Laredo', to_date('16-09-2021', 'dd-mm-yyyy'), 11345, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11396, 'Car Accident', 'Charlottesville', to_date('10-09-2020', 'dd-mm-yyyy'), 11320, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11397, 'Burn', 'Treviso', to_date('30-12-2023', 'dd-mm-yyyy'), 11305, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11398, 'Poisoning', 'Oslo', to_date('09-02-2022', 'dd-mm-yyyy'), 11192, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11399, 'Shooting Attack', 'Karlstad', to_date('20-09-2023', 'dd-mm-yyyy'), 11135, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11400, 'Shooting Attack', 'Boston', to_date('04-08-2022', 'dd-mm-yyyy'), 11482, null);
commit;
prompt 300 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11401, 'Poisoning', 'Cary', to_date('04-11-2023', 'dd-mm-yyyy'), 11209, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11402, 'Fall Injury', 'Flushing', to_date('15-06-2020', 'dd-mm-yyyy'), 11393, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11403, 'Fall Injury', 'Hercules', to_date('13-10-2022', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11404, 'Birth', 'Wetzlar', to_date('10-07-2021', 'dd-mm-yyyy'), 11145, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11405, 'Car Accident', 'Santana do parna׳ba', to_date('10-11-2021', 'dd-mm-yyyy'), 11492, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11406, 'Fall Injury', 'New Hope', to_date('05-05-2023', 'dd-mm-yyyy'), 11263, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11407, 'Poisoning', 'Herdecke', to_date('09-05-2023', 'dd-mm-yyyy'), 11271, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11408, 'Birth', 'Dartmouth', to_date('14-06-2023', 'dd-mm-yyyy'), 11423, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11409, 'Birth', 'Fairview Heights', to_date('18-07-2022', 'dd-mm-yyyy'), 11422, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11410, 'Birth', 'Lummen', to_date('23-01-2020', 'dd-mm-yyyy'), 11244, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11411, 'Shooting Attack', 'Drogenbos', to_date('14-11-2023', 'dd-mm-yyyy'), 11280, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11412, 'Car Accident', 'Huntsville', to_date('24-10-2023', 'dd-mm-yyyy'), 11201, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11413, 'Fall Injury', 'Battle Creek', to_date('03-07-2022', 'dd-mm-yyyy'), 11439, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11414, 'Birth', 'Tucson', to_date('22-12-2022', 'dd-mm-yyyy'), 11398, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11415, 'Birth', 'Parsippany', to_date('11-06-2023', 'dd-mm-yyyy'), 11263, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11416, 'Fall Injury', 'Stans', to_date('26-06-2022', 'dd-mm-yyyy'), 11418, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11417, 'Car Accident', 'Neustadt', to_date('01-01-2022', 'dd-mm-yyyy'), 11322, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11418, 'Burn', 'Sulzbach', to_date('30-06-2021', 'dd-mm-yyyy'), 11331, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11419, 'Shooting Attack', 'Cromwell', to_date('24-10-2020', 'dd-mm-yyyy'), 11248, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11420, 'Car Accident', 'West Windsor', to_date('04-03-2022', 'dd-mm-yyyy'), 11444, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11421, 'Fall Injury', 'Bkk', to_date('13-07-2020', 'dd-mm-yyyy'), 11298, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11422, 'Fall Injury', 'Maidenhead', to_date('21-10-2021', 'dd-mm-yyyy'), 11128, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11423, 'Poisoning', 'Lublin', to_date('18-02-2020', 'dd-mm-yyyy'), 11126, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11424, 'Poisoning', 'Pa׳—o de Arcos', to_date('09-03-2021', 'dd-mm-yyyy'), 11347, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11425, 'Burn', 'Moreno Valley', to_date('29-03-2023', 'dd-mm-yyyy'), 11279, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11426, 'Poisoning', 'Toulouse', to_date('08-12-2022', 'dd-mm-yyyy'), 11297, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11427, 'Birth', 'Arlington', to_date('29-07-2020', 'dd-mm-yyyy'), 11348, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11428, 'Poisoning', 'Birmensdorf', to_date('20-12-2021', 'dd-mm-yyyy'), 11149, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11429, 'Birth', 'Rtp', to_date('20-03-2020', 'dd-mm-yyyy'), 11449, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11430, 'Shooting Attack', 'Riverdale', to_date('23-02-2020', 'dd-mm-yyyy'), 11231, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11431, 'Car Accident', 'Oak Park', to_date('01-09-2021', 'dd-mm-yyyy'), 11282, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11432, 'Fall Injury', 'Phoenix', to_date('01-09-2023', 'dd-mm-yyyy'), 3, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11433, 'Birth', 'Meerbusch', to_date('01-03-2021', 'dd-mm-yyyy'), 11341, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11434, 'Poisoning', 'Telford', to_date('10-03-2023', 'dd-mm-yyyy'), 11487, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11435, 'Fall Injury', 'Batavia', to_date('11-03-2021', 'dd-mm-yyyy'), 11424, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11436, 'Fall Injury', 'Farnham', to_date('31-07-2023', 'dd-mm-yyyy'), 11448, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11437, 'Burn', 'Grand Rapids', to_date('23-09-2023', 'dd-mm-yyyy'), 11482, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11438, 'Shooting Attack', 'Maidenhead', to_date('27-04-2021', 'dd-mm-yyyy'), 11325, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11439, 'Car Accident', 'Highlands Ranch', to_date('31-03-2023', 'dd-mm-yyyy'), 11351, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11440, 'Car Accident', 'Monterey', to_date('29-10-2023', 'dd-mm-yyyy'), 11313, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11441, 'Poisoning', 'Alcobendas', to_date('24-07-2020', 'dd-mm-yyyy'), 11186, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11442, 'Poisoning', 'Essen', to_date('29-10-2023', 'dd-mm-yyyy'), 11434, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11443, 'Shooting Attack', 'Zuerich', to_date('01-03-2023', 'dd-mm-yyyy'), 11281, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11444, 'Poisoning', 'Derwood', to_date('02-04-2022', 'dd-mm-yyyy'), 11477, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11445, 'Burn', 'Toyama', to_date('26-05-2023', 'dd-mm-yyyy'), 11399, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11446, 'Poisoning', 'Tsu', to_date('11-09-2022', 'dd-mm-yyyy'), 11194, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11447, 'Burn', 'Sao paulo', to_date('29-11-2020', 'dd-mm-yyyy'), 11368, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11448, 'Birth', 'Stavanger', to_date('28-05-2020', 'dd-mm-yyyy'), 11369, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11449, 'Car Accident', 'Los Angeles', to_date('28-04-2021', 'dd-mm-yyyy'), 11148, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11450, 'Shooting Attack', 'Paisley', to_date('26-09-2020', 'dd-mm-yyyy'), 11415, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11451, 'Birth', 'Mן¢•nster', to_date('27-08-2021', 'dd-mm-yyyy'), 11157, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11452, 'Shooting Attack', 'Kungens kurva', to_date('14-09-2022', 'dd-mm-yyyy'), 11136, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11453, 'Shooting Attack', 'Groton', to_date('11-05-2023', 'dd-mm-yyyy'), 11375, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11454, 'Shooting Attack', 'Zן¢•rich', to_date('09-03-2022', 'dd-mm-yyyy'), 11243, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11455, 'Shooting Attack', 'Obfelden', to_date('06-01-2020', 'dd-mm-yyyy'), 11127, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11456, 'Shooting Attack', 'El Masnou', to_date('11-05-2022', 'dd-mm-yyyy'), 11430, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11457, 'Poisoning', 'New York', to_date('10-07-2020', 'dd-mm-yyyy'), 11356, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11458, 'Fall Injury', 'Newton-le-willows', to_date('20-04-2021', 'dd-mm-yyyy'), 11119, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11459, 'Burn', 'Linz', to_date('14-07-2020', 'dd-mm-yyyy'), 11329, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11460, 'Shooting Attack', 'Edenbridge', to_date('02-12-2023', 'dd-mm-yyyy'), 11310, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11461, 'Fall Injury', 'Monument', to_date('04-01-2023', 'dd-mm-yyyy'), 11122, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11462, 'Shooting Attack', 'Coppell', to_date('28-07-2023', 'dd-mm-yyyy'), 11496, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11463, 'Birth', 'Banbury', to_date('12-06-2023', 'dd-mm-yyyy'), 11503, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11464, 'Poisoning', 'Pulheim-brauweiler', to_date('28-04-2023', 'dd-mm-yyyy'), 11257, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11465, 'Birth', 'Belo Horizonte', to_date('20-04-2020', 'dd-mm-yyyy'), 11252, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11466, 'Burn', 'Meerbusch', to_date('09-09-2020', 'dd-mm-yyyy'), 11509, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11467, 'Poisoning', 'Lippetal', to_date('28-01-2020', 'dd-mm-yyyy'), 11413, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11468, 'Car Accident', 'Horb', to_date('12-01-2022', 'dd-mm-yyyy'), 11481, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11469, 'Shooting Attack', 'Santa rita sapuca׳', to_date('16-06-2023', 'dd-mm-yyyy'), 11117, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11470, 'Burn', 'Narrows', to_date('16-08-2020', 'dd-mm-yyyy'), 11387, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11471, 'Poisoning', 'Herford', to_date('29-04-2023', 'dd-mm-yyyy'), 11464, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11472, 'Fall Injury', 'Oyten', to_date('28-08-2020', 'dd-mm-yyyy'), 11478, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11473, 'Burn', 'Berlin-Adlershof', to_date('09-02-2023', 'dd-mm-yyyy'), 11289, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11474, 'Fall Injury', 'Cedar Rapids', to_date('14-04-2021', 'dd-mm-yyyy'), 11426, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11475, 'Fall Injury', 'Reykjavik', to_date('20-04-2022', 'dd-mm-yyyy'), 11153, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11476, 'Shooting Attack', 'Woking', to_date('30-03-2020', 'dd-mm-yyyy'), 11215, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11477, 'Car Accident', 'Herzlia', to_date('13-02-2021', 'dd-mm-yyyy'), 11459, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11478, 'Birth', 'Ludbreg', to_date('29-01-2023', 'dd-mm-yyyy'), 11382, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11479, 'Poisoning', 'Kungki', to_date('28-07-2022', 'dd-mm-yyyy'), 11363, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11480, 'Poisoning', 'Odense', to_date('22-07-2020', 'dd-mm-yyyy'), 11164, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11481, 'Fall Injury', 'Maryville', to_date('30-07-2020', 'dd-mm-yyyy'), 11428, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11482, 'Burn', 'Issaquah', to_date('12-06-2022', 'dd-mm-yyyy'), 11312, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11483, 'Fall Injury', 'Uetikon am See', to_date('06-03-2022', 'dd-mm-yyyy'), 11451, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11484, 'Birth', 'St-laurent', to_date('04-07-2020', 'dd-mm-yyyy'), 11119, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11485, 'Burn', 'Suberg', to_date('06-09-2022', 'dd-mm-yyyy'), 11408, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11486, 'Poisoning', 'Carlingford', to_date('29-01-2023', 'dd-mm-yyyy'), 11375, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11487, 'Shooting Attack', 'Lathrop', to_date('27-10-2020', 'dd-mm-yyyy'), 11406, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11488, 'Car Accident', 'Wageningen', to_date('22-07-2023', 'dd-mm-yyyy'), 11486, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11489, 'Burn', 'Bloemfontein', to_date('14-05-2022', 'dd-mm-yyyy'), 11383, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11490, 'Shooting Attack', 'Pasadena', to_date('19-02-2023', 'dd-mm-yyyy'), 11426, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11491, 'Car Accident', 'Monmouth', to_date('23-06-2020', 'dd-mm-yyyy'), 11285, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11492, 'Birth', 'Ann Arbor', to_date('25-06-2023', 'dd-mm-yyyy'), 11112, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11493, 'Car Accident', 'Bradenton', to_date('19-03-2023', 'dd-mm-yyyy'), 11390, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11494, 'Car Accident', 'Towson', to_date('04-08-2022', 'dd-mm-yyyy'), 11159, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11495, 'Fall Injury', 'Gauteng', to_date('13-12-2020', 'dd-mm-yyyy'), 11209, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11496, 'Burn', 'Saint Ouen', to_date('14-06-2020', 'dd-mm-yyyy'), 11348, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11497, 'Birth', 'Groton', to_date('05-06-2021', 'dd-mm-yyyy'), 11144, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11498, 'Poisoning', 'Kanazawa', to_date('11-07-2022', 'dd-mm-yyyy'), 11467, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11499, 'Burn', 'Loveland', to_date('31-05-2023', 'dd-mm-yyyy'), 11410, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11500, 'Car Accident', 'Minneapolis', to_date('01-11-2023', 'dd-mm-yyyy'), 11344, null);
commit;
prompt 400 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11501, 'Burn', 'Pirapora bom Jesus', to_date('16-02-2020', 'dd-mm-yyyy'), 11251, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11502, 'Fall Injury', 'Potsdam', to_date('20-04-2023', 'dd-mm-yyyy'), 11331, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11503, 'Car Accident', 'Koblenz', to_date('18-05-2021', 'dd-mm-yyyy'), 11127, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11504, 'Poisoning', 'Oakland', to_date('13-06-2023', 'dd-mm-yyyy'), 1, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11505, 'Fall Injury', 'Oklahoma city', to_date('02-05-2021', 'dd-mm-yyyy'), 11404, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11506, 'Fall Injury', 'Stavanger', to_date('09-12-2020', 'dd-mm-yyyy'), 11182, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11507, 'Shooting Attack', 'Radovljica', to_date('01-09-2021', 'dd-mm-yyyy'), 11311, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11508, 'Poisoning', 'Mississauga', to_date('23-08-2022', 'dd-mm-yyyy'), 11176, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11509, 'Poisoning', 'Cardiff', to_date('06-09-2020', 'dd-mm-yyyy'), 11315, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11510, 'Car Accident', 'Horb', to_date('20-11-2021', 'dd-mm-yyyy'), 11221, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11511, 'birth', 'tsrofa', to_date('01-01-2024', 'dd-mm-yyyy'), 1, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11512, 'birth', 'tsrofa', to_date('01-01-2024', 'dd-mm-yyyy'), 1, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11513, 'birth', 'tsrofa', to_date('01-03-2024', 'dd-mm-yyyy'), 3, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11514, 'Car Accident', 'Beer Sheva', to_date('02-10-2022', 'dd-mm-yyyy'), 11193, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11515, 'Shooting Attack', 'Tel Aviv', to_date('06-08-2021', 'dd-mm-yyyy'), 11363, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11516, 'burn', 'Hifa', to_date('01-04-2024', 'dd-mm-yyyy'), 4, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11517, 'burn', 'Hifa', to_date('01-04-2024', 'dd-mm-yyyy'), 4, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11518, 'Fall Injury', 'Netanya', to_date('14-06-2021', 'dd-mm-yyyy'), 11348, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11519, 'Burn', 'Haifa', to_date('18-11-2020', 'dd-mm-yyyy'), 11373, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11520, 'Fall Injury', 'Ashdod', to_date('20-04-2020', 'dd-mm-yyyy'), 11321, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11521, 'Car Accident', 'Beer Sheva', to_date('09-08-2020', 'dd-mm-yyyy'), 11438, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11522, 'Car Accident', 'Beer Sheva', to_date('04-03-2023', 'dd-mm-yyyy'), 11339, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11523, 'Shooting Attack', 'Jerusalem', to_date('06-10-2020', 'dd-mm-yyyy'), 11196, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11524, 'Birth', 'Haifa', to_date('26-10-2023', 'dd-mm-yyyy'), 11210, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11525, 'Birth', 'HIFA', to_date('01-01-2024', 'dd-mm-yyyy'), 1, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (11526, 'Shooting Attack', 'Holon', to_date('15-06-2023', 'dd-mm-yyyy'), 11384, null);
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (182, 'Rotating storm', 'Nesher', to_date('15-01-2017', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (62, 'Armed assailant', 'Tayibe', to_date('26-06-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (269, 'Ground shaking', 'Ashdod', to_date('26-03-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (795, 'Severe cyclone', 'Sakhnin', to_date('14-04-2008', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (652, 'Rotating storm', 'Kiryat Malakhi', to_date('20-12-2010', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (518, 'Toxic emission', 'Migdal HaEmek', to_date('30-05-2012', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (389, 'Health crisis', 'Kiryat Motzkin', to_date('30-06-2021', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (782, 'Building blaze', 'Kiryat Shmona', to_date('01-06-2015', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (48, 'Toxic emission', 'Nazareth', to_date('18-12-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (230, 'Toxic emission', 'Jerusalem', to_date('10-01-2000', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (167, 'Ground shaking', 'Rehovot', to_date('02-10-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (978, 'Ground shaking', 'Eilat', to_date('19-03-2005', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (571, 'Toxic emission', 'Nesher', to_date('23-02-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (482, 'Ground shaking', 'Ra''anana', to_date('18-12-2003', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (486, 'Building blaze', 'Kafr Qasim', to_date('30-08-2004', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (220, 'Hazardous leak', 'Beersheba', to_date('02-04-2022', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (359, 'Rotating storm', 'Rehovot', to_date('19-04-2001', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (366, 'Ground shaking', 'Kfar Saba', to_date('01-02-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (677, 'Electricity failure', 'Yavne', to_date('23-12-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (495, 'Severe cyclone', 'Afula', to_date('03-11-2000', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (63, 'Hazardous leak', 'Or Akiva', to_date('28-11-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (444, 'Hazardous leak', 'Safed', to_date('24-03-2021', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (699, 'Health crisis', 'Givatayim', to_date('25-04-2002', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (249, 'Rotating storm', 'Givatayim', to_date('02-06-2023', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (735, 'Armed assailant', 'Tira', to_date('12-01-2003', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (602, 'Hazardous leak', 'Safed', to_date('25-10-2019', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (316, 'Severe cyclone', 'Kiryat Yam', to_date('24-01-2010', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (983, 'Hazardous leak', 'Rishon LeZion', to_date('11-04-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (577, 'Severe cyclone', 'Yokneam Illit', to_date('07-09-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (643, 'Severe cyclone', 'Sderot', to_date('18-11-2024', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (391, 'Building blaze', 'Kiryat Gat', to_date('31-08-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (94, 'Severe cyclone', 'Ness Ziona', to_date('07-08-2024', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (792, 'Water inundation', 'Bnei Brak', to_date('09-09-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (984, 'Rotating storm', 'Elad', to_date('17-05-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (999, 'Water inundation', 'Tiberias', to_date('12-01-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (327, 'Health crisis', 'Giv''at Shmuel', to_date('10-02-2021', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (520, 'Building blaze', 'Yehud-Monosson', to_date('19-07-2016', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (90, 'Armed assailant', 'Ma''ale Adumim', to_date('25-06-2021', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (431, 'Ground shaking', 'Tamra', to_date('29-05-2013', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (876, 'Electricity failure', 'Dimona', to_date('10-04-2018', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (357, 'Ground shaking', 'Nazareth', to_date('25-05-2013', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (453, 'Water inundation', 'Beit Shean', to_date('21-04-2014', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (549, 'Armed assailant', 'Kafr Qasim', to_date('11-11-2003', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (775, 'Severe cyclone', 'Haifa', to_date('12-04-2002', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (824, 'Building blaze', 'Kiryat Gat', to_date('08-03-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (737, 'Hazardous leak', 'Acre', to_date('23-10-2003', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (55, 'Building blaze', 'Nazareth', to_date('30-03-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (122, 'Electricity failure', 'Modi''in-Maccabim-Re''ut', to_date('28-02-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (439, 'Toxic emission', 'Giv''at Shmuel', to_date('24-11-2000', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (622, 'Armed assailant', 'Modi''in-Maccabim-Re''ut', to_date('17-07-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (42, 'Hazardous leak', 'Ma''alot-Tarshiha', to_date('22-05-2017', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (590, 'Ground shaking', 'Ramla', to_date('15-10-2006', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (52, 'Severe cyclone', 'Holon', to_date('12-08-2023', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (152, 'Health crisis', 'Hod HaSharon', to_date('23-11-2003', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (525, 'Severe cyclone', 'Yokneam Illit', to_date('01-02-2013', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (601, 'Electricity failure', 'Modi''in Illit', to_date('30-09-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (295, 'Hazardous leak', 'Eilat', to_date('28-01-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (484, 'Severe cyclone', 'Ramat Gan', to_date('02-05-2014', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (517, 'Toxic emission', 'Rosh HaAyin', to_date('25-09-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (862, 'Toxic emission', 'Nof HaGalil', to_date('23-06-2007', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (233, 'Armed assailant', 'Petah Tikva', to_date('06-06-2000', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (40, 'Electricity failure', 'Kiryat Gat', to_date('31-12-2007', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (265, 'Ground shaking', 'Tamra', to_date('20-09-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (975, 'Severe cyclone', 'Or Akiva', to_date('18-11-2003', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (762, 'Rotating storm', 'Kfar Saba', to_date('24-12-2013', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (995, 'Toxic emission', 'Bat Yam', to_date('23-01-2009', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (693, 'Hazardous leak', 'Ashkelon', to_date('19-08-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (401, 'Ground shaking', 'Nazareth', to_date('07-05-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (986, 'Water inundation', 'Kiryat Yam', to_date('21-10-2002', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (399, 'Health crisis', 'Modi''in Illit', to_date('13-05-2018', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (229, 'Electricity failure', 'Kafr Qasim', to_date('28-03-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (574, 'Rotating storm', 'Sakhnin', to_date('14-03-2012', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (496, 'Health crisis', 'Bnei Brak', to_date('06-07-2019', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (805, 'Building blaze', 'Ma''ale Adumim', to_date('20-10-2012', 'dd-mm-yyyy'), 11436, 'Wrennie');
commit;
prompt 500 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (845, 'Building blaze', 'Modi''in-Maccabim-Re''ut', to_date('26-07-2006', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (654, 'Severe cyclone', 'Yehud-Monosson', to_date('19-01-2011', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (308, 'Water inundation', 'Eilat', to_date('01-04-2018', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (905, 'Hazardous leak', 'Elad', to_date('25-03-2019', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (125, 'Water inundation', 'Ness Ziona', to_date('13-01-2006', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (544, 'Ground shaking', 'Nahariya', to_date('09-08-2002', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (89, 'Armed assailant', 'Tiberias', to_date('22-06-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (164, 'Ground shaking', 'Migdal HaEmek', to_date('13-04-2002', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (610, 'Ground shaking', 'Giv''at Shmuel', to_date('02-12-2003', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (721, 'Water inundation', 'Beit Shemesh', to_date('31-07-2010', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (967, 'Armed assailant', 'Tiberias', to_date('07-09-2017', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (375, 'Armed assailant', 'Kiryat Gat', to_date('04-08-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (36, 'Armed assailant', 'Herzliya', to_date('14-08-2016', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (179, 'Rotating storm', 'Nazareth', to_date('05-09-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (161, 'Building blaze', 'Ramla', to_date('27-09-2005', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (540, 'Building blaze', 'Nahariya', to_date('01-07-2012', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (264, 'Rotating storm', 'Qalansawe', to_date('21-08-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (707, 'Hazardous leak', 'Herzliya', to_date('17-09-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (200, 'Water inundation', 'Elad', to_date('01-02-2019', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (955, 'Water inundation', 'Yehud-Monosson', to_date('19-04-2022', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (797, 'Hazardous leak', 'Kiryat Malakhi', to_date('28-04-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (388, 'Severe cyclone', 'Tirat Carmel', to_date('01-05-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (780, 'Electricity failure', 'Nof HaGalil', to_date('22-02-2008', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (322, 'Severe cyclone', 'Ramla', to_date('28-01-2001', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (150, 'Water inundation', 'Qalansawe', to_date('27-11-2006', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (609, 'Hazardous leak', 'Petah Tikva', to_date('21-12-2010', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (988, 'Water inundation', 'Elad', to_date('13-01-2008', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (977, 'Electricity failure', 'Kfar Yona', to_date('04-10-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (223, 'Rotating storm', 'Nazareth', to_date('29-01-2014', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (300, 'Health crisis', 'Eilat', to_date('20-03-2008', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (541, 'Water inundation', 'Kfar Yona', to_date('17-03-2015', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (816, 'Severe cyclone', 'Ness Ziona', to_date('11-05-2020', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (59, 'Rotating storm', 'Acre', to_date('20-12-2018', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (934, 'Severe cyclone', 'Nesher', to_date('29-09-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (947, 'Building blaze', 'Rosh HaAyin', to_date('18-11-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (853, 'Health crisis', 'Ma''ale Adumim', to_date('06-06-2008', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (61, 'Health crisis', 'Ma''ale Adumim', to_date('20-02-2020', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (869, 'Ground shaking', 'Kfar Saba', to_date('19-02-2013', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (553, 'Water inundation', 'Tamra', to_date('15-01-2010', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (631, 'Armed assailant', 'Kiryat Bialik', to_date('27-07-2012', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (442, 'Water inundation', 'Tiberias', to_date('16-11-2004', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (968, 'Rotating storm', 'Elad', to_date('02-11-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (386, 'Rotating storm', 'Safed', to_date('16-07-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (256, 'Electricity failure', 'Rehovot', to_date('12-02-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (294, 'Hazardous leak', 'Modi''in Illit', to_date('28-05-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (172, 'Electricity failure', 'Lod', to_date('06-08-2019', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (247, 'Rotating storm', 'Hadera', to_date('20-02-2008', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (77, 'Health crisis', 'Netivot', to_date('11-01-2021', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (114, 'Health crisis', 'Ofakim', to_date('11-05-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (209, 'Hazardous leak', 'Nof HaGalil', to_date('21-07-2023', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (208, 'Hazardous leak', 'Yavne', to_date('18-06-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (923, 'Severe cyclone', 'Herzliya', to_date('24-09-2009', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (54, 'Hazardous leak', 'Or Akiva', to_date('23-02-2004', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (831, 'Building blaze', 'Lod', to_date('09-04-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (117, 'Building blaze', 'Modi''in Illit', to_date('14-06-2016', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (39, 'Rotating storm', 'Nahariya', to_date('16-05-2006', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (151, 'Health crisis', 'Hadera', to_date('18-01-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (702, 'Water inundation', 'Afula', to_date('08-11-2006', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (207, 'Toxic emission', 'Yavne', to_date('26-08-2016', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (994, 'Hazardous leak', 'Kiryat Ono', to_date('11-01-2014', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (881, 'Toxic emission', 'Rishon LeZion', to_date('04-03-2017', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (770, 'Severe cyclone', 'Elad', to_date('02-04-2013', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (555, 'Hazardous leak', 'Bat Yam', to_date('06-02-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (697, 'Toxic emission', 'Ma''ale Adumim', to_date('27-12-2015', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (113, 'Toxic emission', 'Hadera', to_date('28-09-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (163, 'Hazardous leak', 'Kafr Qasim', to_date('02-08-2010', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (680, 'Toxic emission', 'Rosh HaAyin', to_date('01-02-2002', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (436, 'Toxic emission', 'Haifa', to_date('25-03-2007', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (516, 'Rotating storm', 'Ofakim', to_date('10-06-2018', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (454, 'Building blaze', 'Elad', to_date('26-09-2022', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (339, 'Rotating storm', 'Umm al-Fahm', to_date('29-01-2014', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (931, 'Building blaze', 'Netanya', to_date('13-03-2007', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (451, 'Electricity failure', 'Ramat Gan', to_date('05-08-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (745, 'Severe cyclone', 'Nesher', to_date('15-08-2020', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (385, 'Water inundation', 'Sakhnin', to_date('03-09-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (843, 'Health crisis', 'Tamra', to_date('02-02-2024', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (433, 'Hazardous leak', 'Yokneam Illit', to_date('10-06-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (81, 'Ground shaking', 'Yavne', to_date('12-01-2006', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (928, 'Water inundation', 'Sakhnin', to_date('10-06-2004', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (418, 'Health crisis', 'Ramat Gan', to_date('13-01-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (584, 'Hazardous leak', 'Ramat HaSharon', to_date('17-02-2001', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (446, 'Water inundation', 'Yehud-Monosson', to_date('01-01-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (980, 'Toxic emission', 'Netivot', to_date('11-08-2007', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (781, 'Toxic emission', 'Arad', to_date('07-11-2008', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (38, 'Electricity failure', 'Ofakim', to_date('18-04-2012', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (560, 'Building blaze', 'Kafr Qasim', to_date('08-10-2022', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (507, 'Building blaze', 'Ramat HaSharon', to_date('27-04-2008', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (720, 'Hazardous leak', 'Jerusalem', to_date('30-10-2013', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (730, 'Ground shaking', 'Yavne', to_date('03-01-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (777, 'Ground shaking', 'Afula', to_date('22-06-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (879, 'Water inundation', 'Ma''ale Adumim', to_date('19-03-2018', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (165, 'Hazardous leak', 'Kiryat Ono', to_date('02-09-2010', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (930, 'Severe cyclone', 'Ashdod', to_date('16-06-2011', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (554, 'Hazardous leak', 'Kiryat Ono', to_date('19-07-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (618, 'Ground shaking', 'Kiryat Gat', to_date('02-12-2017', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (591, 'Ground shaking', 'Acre', to_date('02-11-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (647, 'Severe cyclone', 'Yokneam Illit', to_date('08-11-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (180, 'Building blaze', 'Nof HaGalil', to_date('13-08-2022', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (126, 'Water inundation', 'Nesher', to_date('14-11-2024', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (452, 'Hazardous leak', 'Herzliya', to_date('27-03-2015', 'dd-mm-yyyy'), 11436, 'Berne');
commit;
prompt 600 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (669, 'Health crisis', 'Ariel', to_date('14-11-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (69, 'Ground shaking', 'Petah Tikva', to_date('14-10-2004', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (414, 'Building blaze', 'Sderot', to_date('15-11-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (378, 'Health crisis', 'Kiryat Gat', to_date('31-01-2024', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (202, 'Ground shaking', 'Tiberias', to_date('07-11-2005', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (321, 'Electricity failure', 'Petah Tikva', to_date('01-05-2001', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (917, 'Health crisis', 'Nof HaGalil', to_date('21-07-2007', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (634, 'Ground shaking', 'Kafr Qasim', to_date('06-06-2003', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (189, 'Rotating storm', 'Rosh HaAyin', to_date('17-03-2002', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (939, 'Severe cyclone', 'Petah Tikva', to_date('06-08-2004', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (506, 'Severe cyclone', 'Sakhnin', to_date('29-12-2005', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (751, 'Water inundation', 'Qalansawe', to_date('02-04-2024', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (703, 'Hazardous leak', 'Karmiel', to_date('08-07-2019', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (129, 'Hazardous leak', 'Or Akiva', to_date('30-11-2002', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (981, 'Health crisis', 'Netanya', to_date('26-12-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (377, 'Ground shaking', 'Rosh HaAyin', to_date('27-09-2008', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (771, 'Rotating storm', 'Kiryat Malakhi', to_date('01-10-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (690, 'Rotating storm', 'Nof HaGalil', to_date('03-06-2002', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (992, 'Severe cyclone', 'Givatayim', to_date('14-11-2021', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (472, 'Ground shaking', 'Afula', to_date('23-10-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (149, 'Hazardous leak', 'Ramat HaSharon', to_date('24-03-2004', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (828, 'Severe cyclone', 'Ashkelon', to_date('14-01-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (275, 'Rotating storm', 'Or Yehuda', to_date('08-01-2019', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (292, 'Health crisis', 'Givatayim', to_date('20-09-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (990, 'Hazardous leak', 'Rehovot', to_date('22-07-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (512, 'Building blaze', 'Herzliya', to_date('06-06-2014', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (657, 'Toxic emission', 'Tamra', to_date('21-11-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (565, 'Electricity failure', 'Netanya', to_date('06-12-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (56, 'Electricity failure', 'Rishon LeZion', to_date('27-12-2008', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (485, 'Armed assailant', 'Yokneam Illit', to_date('28-06-2011', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (474, 'Electricity failure', 'Nazareth', to_date('07-06-2008', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (750, 'Rotating storm', 'Holon', to_date('07-06-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (756, 'Water inundation', 'Beit Shean', to_date('28-02-2015', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (619, 'Toxic emission', 'Sakhnin', to_date('08-01-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (478, 'Hazardous leak', 'Kiryat Bialik', to_date('17-01-2010', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (398, 'Health crisis', 'Beersheba', to_date('27-08-2014', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (279, 'Health crisis', 'Nesher', to_date('11-09-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (659, 'Ground shaking', 'Tamra', to_date('31-08-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (240, 'Water inundation', 'Bat Yam', to_date('04-01-2021', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (713, 'Rotating storm', 'Lod', to_date('09-09-2018', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (594, 'Armed assailant', 'Sakhnin', to_date('01-07-2016', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (823, 'Rotating storm', 'Tiberias', to_date('15-09-2020', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (695, 'Toxic emission', 'Kiryat Malakhi', to_date('30-03-2019', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (285, 'Hazardous leak', 'Karmiel', to_date('25-10-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (741, 'Toxic emission', 'Nof HaGalil', to_date('28-02-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (274, 'Toxic emission', 'Tel Aviv', to_date('29-01-2009', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (272, 'Electricity failure', 'Nazareth', to_date('09-10-2022', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (558, 'Electricity failure', 'Karmiel', to_date('08-03-2005', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (335, 'Water inundation', 'Umm al-Fahm', to_date('15-05-2022', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (855, 'Rotating storm', 'Yavne', to_date('22-12-2015', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (784, 'Rotating storm', 'Modi''in Illit', to_date('01-10-2001', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (982, 'Severe cyclone', 'Hod HaSharon', to_date('04-11-2019', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (685, 'Water inundation', 'Herzliya', to_date('09-06-2004', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (738, 'Electricity failure', 'Herzliya', to_date('24-11-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (644, 'Ground shaking', 'Tirat Carmel', to_date('13-04-2024', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (351, 'Ground shaking', 'Jerusalem', to_date('01-10-2012', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (420, 'Water inundation', 'Kiryat Ono', to_date('21-07-2000', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (248, 'Severe cyclone', 'Umm al-Fahm', to_date('02-12-2012', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (79, 'Water inundation', 'Ramla', to_date('24-06-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (547, 'Ground shaking', 'Hadera', to_date('21-05-2016', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (219, 'Health crisis', 'Kiryat Malakhi', to_date('08-10-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (820, 'Rotating storm', 'Kafr Qasim', to_date('30-08-2007', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (661, 'Water inundation', 'Kiryat Shmona', to_date('12-12-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (232, 'Toxic emission', 'Ramla', to_date('09-04-2008', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (969, 'Water inundation', 'Giv''at Shmuel', to_date('20-06-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (946, 'Armed assailant', 'Hadera', to_date('21-09-2015', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (467, 'Ground shaking', 'Migdal HaEmek', to_date('09-01-2001', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (67, 'Severe cyclone', 'Netivot', to_date('24-01-2023', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (617, 'Hazardous leak', 'Ma''ale Adumim', to_date('14-07-2021', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (941, 'Rotating storm', 'Ramat Gan', to_date('10-09-2020', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (469, 'Ground shaking', 'Beersheba', to_date('13-09-2014', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (435, 'Hazardous leak', 'Ma''ale Adumim', to_date('22-08-2013', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (124, 'Rotating storm', 'Afula', to_date('03-11-2020', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (519, 'Hazardous leak', 'Yehud-Monosson', to_date('01-01-2014', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (639, 'Armed assailant', 'Beit Shean', to_date('15-02-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (787, 'Rotating storm', 'Hod HaSharon', to_date('26-06-2022', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (109, 'Armed assailant', 'Kiryat Motzkin', to_date('24-06-2022', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (95, 'Water inundation', 'Nahariya', to_date('30-08-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (319, 'Toxic emission', 'Baka al-Gharbiyye', to_date('29-12-2023', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (691, 'Severe cyclone', 'Holon', to_date('15-12-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (432, 'Water inundation', 'Haifa', to_date('19-08-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (336, 'Toxic emission', 'Lod', to_date('07-05-2012', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (318, 'Electricity failure', 'Baka al-Gharbiyye', to_date('25-10-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (581, 'Electricity failure', 'Yehud-Monosson', to_date('16-05-2016', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (402, 'Rotating storm', 'Beit Shemesh', to_date('11-11-2021', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (304, 'Rotating storm', 'Sakhnin', to_date('06-08-2011', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (448, 'Severe cyclone', 'Rosh HaAyin', to_date('18-11-2009', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (41, 'Electricity failure', 'Givatayim', to_date('02-07-2002', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (933, 'Hazardous leak', 'Umm al-Fahm', to_date('28-07-2024', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (221, 'Ground shaking', 'Shefa-Amr', to_date('26-09-2010', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (217, 'Water inundation', 'Beitar Illit', to_date('11-11-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (462, 'Water inundation', 'Giv''at Shmuel', to_date('14-01-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (546, 'Water inundation', 'Ma''alot-Tarshiha', to_date('17-07-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (35, 'Electricity failure', 'Elad', to_date('31-03-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (759, 'Building blaze', 'Qalansawe', to_date('06-04-2005', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (596, 'Rotating storm', 'Holon', to_date('08-07-2003', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (953, 'Water inundation', 'Ra''anana', to_date('03-03-2001', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (936, 'Electricity failure', 'Ramat Gan', to_date('10-05-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (155, 'Toxic emission', 'Ashkelon', to_date('08-06-2005', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (445, 'Water inundation', 'Netanya', to_date('07-11-2000', 'dd-mm-yyyy'), 11436, 'Wrennie');
commit;
prompt 700 records committed...
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (68, 'Health crisis', 'Tamra', to_date('20-09-2012', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (358, 'Electricity failure', 'Kiryat Yam', to_date('20-04-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (576, 'Hazardous leak', 'Ma''ale Adumim', to_date('06-07-2018', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (607, 'Severe cyclone', 'Jerusalem', to_date('31-12-2024', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (623, 'Health crisis', 'Tamra', to_date('02-02-2020', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (116, 'Hazardous leak', 'Yokneam Illit', to_date('25-06-2024', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (83, 'Electricity failure', 'Kiryat Motzkin', to_date('25-05-2013', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (957, 'Severe cyclone', 'Tiberias', to_date('21-02-2009', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (605, 'Rotating storm', 'Shefa-Amr', to_date('13-06-2019', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (670, 'Building blaze', 'Yehud-Monosson', to_date('04-08-2000', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (134, 'Armed assailant', 'Bat Yam', to_date('04-06-2010', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (732, 'Armed assailant', 'Migdal HaEmek', to_date('04-12-2000', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (380, 'Water inundation', 'Kafr Qasim', to_date('21-12-2006', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (736, 'Health crisis', 'Kiryat Bialik', to_date('01-09-2018', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (959, 'Hazardous leak', 'Eilat', to_date('25-06-2008', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (678, 'Armed assailant', 'Migdal HaEmek', to_date('12-07-2007', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (174, 'Armed assailant', 'Baka al-Gharbiyye', to_date('16-02-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (140, 'Hazardous leak', 'Yavne', to_date('20-01-2009', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (877, 'Ground shaking', 'Rosh HaAyin', to_date('12-05-2007', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (456, 'Rotating storm', 'Kiryat Bialik', to_date('20-06-2011', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (765, 'Rotating storm', 'Rehovot', to_date('25-06-2001', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (400, 'Health crisis', 'Givatayim', to_date('10-04-2011', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (733, 'Hazardous leak', 'Eilat', to_date('11-08-2006', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (773, 'Health crisis', 'Beit Shean', to_date('26-06-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (489, 'Severe cyclone', 'Kiryat Shmona', to_date('14-06-2009', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (806, 'Health crisis', 'Netanya', to_date('30-05-2023', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (119, 'Ground shaking', 'Beitar Illit', to_date('15-03-2001', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (754, 'Health crisis', 'Ma''ale Adumim', to_date('26-12-2024', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (78, 'Ground shaking', 'Sakhnin', to_date('18-06-2017', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (935, 'Water inundation', 'Ramat Gan', to_date('18-08-2018', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (450, 'Rotating storm', 'Sakhnin', to_date('21-09-2012', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (185, 'Building blaze', 'Kiryat Gat', to_date('26-06-2021', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (562, 'Armed assailant', 'Beersheba', to_date('17-11-2023', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (830, 'Ground shaking', 'Kiryat Malakhi', to_date('01-04-2006', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (663, 'Electricity failure', 'Kiryat Malakhi', to_date('16-06-2017', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (372, 'Hazardous leak', 'Jerusalem', to_date('20-04-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (96, 'Electricity failure', 'Afula', to_date('12-02-2006', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (985, 'Health crisis', 'Ariel', to_date('05-06-2012', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (64, 'Severe cyclone', 'Umm al-Fahm', to_date('06-07-2020', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (499, 'Rotating storm', 'Baka al-Gharbiyye', to_date('13-07-2000', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (926, 'Water inundation', 'Kiryat Motzkin', to_date('17-12-2014', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (250, 'Rotating storm', 'Ramat HaSharon', to_date('02-06-2021', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (97, 'Severe cyclone', 'Beitar Illit', to_date('31-03-2014', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (821, 'Toxic emission', 'Rosh HaAyin', to_date('26-08-2005', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (772, 'Rotating storm', 'Ofakim', to_date('24-11-2013', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (778, 'Hazardous leak', 'Eilat', to_date('14-03-2018', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (545, 'Health crisis', 'Or Akiva', to_date('24-09-2014', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (950, 'Rotating storm', 'Ra''anana', to_date('18-05-2022', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (522, 'Water inundation', 'Hadera', to_date('18-02-2015', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (832, 'Ground shaking', 'Tirat Carmel', to_date('12-12-2007', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (742, 'Electricity failure', 'Hod HaSharon', to_date('06-09-2016', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (530, 'Electricity failure', 'Rishon LeZion', to_date('26-04-2006', 'dd-mm-yyyy'), 11436, 'Wrennie');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (844, 'Hazardous leak', 'Hod HaSharon', to_date('18-04-2004', 'dd-mm-yyyy'), 11436, 'Berne');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (266, 'Toxic emission', 'Or Akiva', to_date('20-06-2014', 'dd-mm-yyyy'), 11436, 'Fanya');
insert into OUREVENT (event_id, deescription, locaation, date_time, shift_id_, evresponsibillity)
values (216, 'Hazardous leak', 'Jerusalem', to_date('22-12-2021', 'dd-mm-yyyy'), 11436, 'Berne');
commit;
prompt 755 records loaded
prompt Loading ACTIN...
insert into ACTIN (teid, evid)
values ('2', 38);
insert into ACTIN (teid, evid)
values ('3', 163);
insert into ACTIN (teid, evid)
values ('3', 389);
insert into ACTIN (teid, evid)
values ('4', 69);
insert into ACTIN (teid, evid)
values ('4', 295);
insert into ACTIN (teid, evid)
values ('4', 446);
insert into ACTIN (teid, evid)
values ('4', 605);
insert into ACTIN (teid, evid)
values ('4', 639);
insert into ACTIN (teid, evid)
values ('4', 713);
insert into ACTIN (teid, evid)
values ('4', 881);
insert into ACTIN (teid, evid)
values ('5', 117);
insert into ACTIN (teid, evid)
values ('5', 639);
insert into ACTIN (teid, evid)
values ('6', 574);
insert into ACTIN (teid, evid)
values ('6', 680);
insert into ACTIN (teid, evid)
values ('7', 174);
insert into ACTIN (teid, evid)
values ('7', 304);
insert into ACTIN (teid, evid)
values ('9', 795);
insert into ACTIN (teid, evid)
values ('10', 436);
insert into ACTIN (teid, evid)
values ('10', 450);
insert into ACTIN (teid, evid)
values ('10', 452);
insert into ACTIN (teid, evid)
values ('11', 366);
insert into ACTIN (teid, evid)
values ('11', 554);
insert into ACTIN (teid, evid)
values ('12', 452);
insert into ACTIN (teid, evid)
values ('12', 816);
insert into ACTIN (teid, evid)
values ('13', 485);
insert into ACTIN (teid, evid)
values ('13', 554);
insert into ACTIN (teid, evid)
values ('14', 249);
insert into ACTIN (teid, evid)
values ('14', 495);
insert into ACTIN (teid, evid)
values ('14', 732);
insert into ACTIN (teid, evid)
values ('15', 351);
insert into ACTIN (teid, evid)
values ('15', 735);
insert into ACTIN (teid, evid)
values ('16', 555);
insert into ACTIN (teid, evid)
values ('17', 596);
insert into ACTIN (teid, evid)
values ('17', 618);
insert into ACTIN (teid, evid)
values ('17', 619);
insert into ACTIN (teid, evid)
values ('18', 518);
insert into ACTIN (teid, evid)
values ('18', 977);
insert into ACTIN (teid, evid)
values ('19', 174);
insert into ACTIN (teid, evid)
values ('19', 923);
insert into ACTIN (teid, evid)
values ('19', 941);
insert into ACTIN (teid, evid)
values ('19', 953);
insert into ACTIN (teid, evid)
values ('20', 90);
insert into ACTIN (teid, evid)
values ('20', 149);
insert into ACTIN (teid, evid)
values ('20', 830);
insert into ACTIN (teid, evid)
values ('20', 853);
insert into ACTIN (teid, evid)
values ('20', 881);
insert into ACTIN (teid, evid)
values ('21', 63);
insert into ACTIN (teid, evid)
values ('21', 164);
insert into ACTIN (teid, evid)
values ('21', 248);
insert into ACTIN (teid, evid)
values ('21', 420);
insert into ACTIN (teid, evid)
values ('21', 978);
insert into ACTIN (teid, evid)
values ('23', 816);
insert into ACTIN (teid, evid)
values ('23', 941);
insert into ACTIN (teid, evid)
values ('24', 335);
insert into ACTIN (teid, evid)
values ('24', 418);
insert into ACTIN (teid, evid)
values ('25', 691);
insert into ACTIN (teid, evid)
values ('25', 806);
insert into ACTIN (teid, evid)
values ('26', 81);
insert into ACTIN (teid, evid)
values ('26', 161);
insert into ACTIN (teid, evid)
values ('26', 163);
insert into ACTIN (teid, evid)
values ('26', 485);
insert into ACTIN (teid, evid)
values ('26', 516);
insert into ACTIN (teid, evid)
values ('26', 730);
insert into ACTIN (teid, evid)
values ('26', 934);
insert into ACTIN (teid, evid)
values ('26', 946);
insert into ACTIN (teid, evid)
values ('27', 316);
insert into ACTIN (teid, evid)
values ('27', 591);
insert into ACTIN (teid, evid)
values ('28', 39);
insert into ACTIN (teid, evid)
values ('28', 152);
insert into ACTIN (teid, evid)
values ('28', 163);
insert into ACTIN (teid, evid)
values ('28', 562);
insert into ACTIN (teid, evid)
values ('28', 931);
insert into ACTIN (teid, evid)
values ('29', 654);
insert into ACTIN (teid, evid)
values ('29', 853);
insert into ACTIN (teid, evid)
values ('30', 609);
insert into ACTIN (teid, evid)
values ('30', 677);
insert into ACTIN (teid, evid)
values ('32', 308);
insert into ACTIN (teid, evid)
values ('32', 496);
insert into ACTIN (teid, evid)
values ('32', 677);
insert into ACTIN (teid, evid)
values ('32', 853);
insert into ACTIN (teid, evid)
values ('33', 375);
insert into ACTIN (teid, evid)
values ('33', 414);
insert into ACTIN (teid, evid)
values ('33', 754);
insert into ACTIN (teid, evid)
values ('33', 980);
insert into ACTIN (teid, evid)
values ('35', 385);
insert into ACTIN (teid, evid)
values ('37', 294);
insert into ACTIN (teid, evid)
values ('38', 116);
insert into ACTIN (teid, evid)
values ('38', 229);
insert into ACTIN (teid, evid)
values ('39', 152);
insert into ACTIN (teid, evid)
values ('39', 693);
insert into ACTIN (teid, evid)
values ('40', 269);
insert into ACTIN (teid, evid)
values ('40', 448);
insert into ACTIN (teid, evid)
values ('40', 843);
insert into ACTIN (teid, evid)
values ('41', 643);
insert into ACTIN (teid, evid)
values ('42', 216);
insert into ACTIN (teid, evid)
values ('42', 279);
insert into ACTIN (teid, evid)
values ('42', 450);
insert into ACTIN (teid, evid)
values ('42', 462);
insert into ACTIN (teid, evid)
values ('43', 266);
insert into ACTIN (teid, evid)
values ('43', 401);
commit;
prompt 100 records committed...
insert into ACTIN (teid, evid)
values ('43', 439);
insert into ACTIN (teid, evid)
values ('43', 693);
insert into ACTIN (teid, evid)
values ('43', 765);
insert into ACTIN (teid, evid)
values ('44', 54);
insert into ACTIN (teid, evid)
values ('44', 462);
insert into ACTIN (teid, evid)
values ('45', 605);
insert into ACTIN (teid, evid)
values ('45', 832);
insert into ACTIN (teid, evid)
values ('46', 96);
insert into ACTIN (teid, evid)
values ('46', 545);
insert into ACTIN (teid, evid)
values ('47', 117);
insert into ACTIN (teid, evid)
values ('47', 167);
insert into ACTIN (teid, evid)
values ('47', 678);
insert into ACTIN (teid, evid)
values ('47', 741);
insert into ACTIN (teid, evid)
values ('47', 787);
insert into ACTIN (teid, evid)
values ('48', 272);
insert into ACTIN (teid, evid)
values ('48', 661);
insert into ACTIN (teid, evid)
values ('49', 292);
insert into ACTIN (teid, evid)
values ('50', 67);
insert into ACTIN (teid, evid)
values ('51', 541);
insert into ACTIN (teid, evid)
values ('52', 631);
insert into ACTIN (teid, evid)
values ('52', 792);
insert into ACTIN (teid, evid)
values ('54', 207);
insert into ACTIN (teid, evid)
values ('54', 433);
insert into ACTIN (teid, evid)
values ('54', 741);
insert into ACTIN (teid, evid)
values ('54', 821);
insert into ACTIN (teid, evid)
values ('54', 844);
insert into ACTIN (teid, evid)
values ('55', 558);
insert into ACTIN (teid, evid)
values ('56', 454);
insert into ACTIN (teid, evid)
values ('57', 975);
insert into ACTIN (teid, evid)
values ('58', 321);
insert into ACTIN (teid, evid)
values ('59', 652);
insert into ACTIN (teid, evid)
values ('59', 862);
insert into ACTIN (teid, evid)
values ('61', 992);
insert into ACTIN (teid, evid)
values ('62', 378);
insert into ACTIN (teid, evid)
values ('62', 530);
insert into ACTIN (teid, evid)
values ('63', 450);
insert into ACTIN (teid, evid)
values ('64', 294);
insert into ACTIN (teid, evid)
values ('65', 602);
insert into ACTIN (teid, evid)
values ('67', 39);
insert into ACTIN (teid, evid)
values ('67', 42);
insert into ACTIN (teid, evid)
values ('67', 79);
insert into ACTIN (teid, evid)
values ('67', 639);
insert into ACTIN (teid, evid)
values ('68', 581);
insert into ACTIN (teid, evid)
values ('69', 478);
insert into ACTIN (teid, evid)
values ('69', 985);
insert into ACTIN (teid, evid)
values ('70', 67);
insert into ACTIN (teid, evid)
values ('70', 172);
insert into ACTIN (teid, evid)
values ('70', 759);
insert into ACTIN (teid, evid)
values ('71', 591);
insert into ACTIN (teid, evid)
values ('71', 770);
insert into ACTIN (teid, evid)
values ('71', 959);
insert into ACTIN (teid, evid)
values ('72', 558);
insert into ACTIN (teid, evid)
values ('72', 601);
insert into ACTIN (teid, evid)
values ('72', 695);
insert into ACTIN (teid, evid)
values ('73', 935);
insert into ACTIN (teid, evid)
values ('73', 975);
insert into ACTIN (teid, evid)
values ('74', 596);
insert into ACTIN (teid, evid)
values ('78', 62);
insert into ACTIN (teid, evid)
values ('80', 634);
insert into ACTIN (teid, evid)
values ('80', 733);
insert into ACTIN (teid, evid)
values ('80', 736);
insert into ACTIN (teid, evid)
values ('81', 294);
insert into ACTIN (teid, evid)
values ('82', 414);
insert into ACTIN (teid, evid)
values ('82', 978);
insert into ACTIN (teid, evid)
values ('83', 38);
insert into ACTIN (teid, evid)
values ('83', 756);
insert into ACTIN (teid, evid)
values ('84', 678);
insert into ACTIN (teid, evid)
values ('87', 155);
insert into ACTIN (teid, evid)
values ('87', 435);
insert into ACTIN (teid, evid)
values ('87', 516);
insert into ACTIN (teid, evid)
values ('88', 654);
insert into ACTIN (teid, evid)
values ('88', 787);
insert into ACTIN (teid, evid)
values ('89', 274);
insert into ACTIN (teid, evid)
values ('92', 39);
insert into ACTIN (teid, evid)
values ('92', 489);
insert into ACTIN (teid, evid)
values ('93', 266);
insert into ACTIN (teid, evid)
values ('93', 577);
insert into ACTIN (teid, evid)
values ('93', 876);
insert into ACTIN (teid, evid)
values ('94', 39);
insert into ACTIN (teid, evid)
values ('94', 140);
insert into ACTIN (teid, evid)
values ('94', 179);
insert into ACTIN (teid, evid)
values ('94', 782);
insert into ACTIN (teid, evid)
values ('95', 541);
insert into ACTIN (teid, evid)
values ('95', 821);
insert into ACTIN (teid, evid)
values ('95', 926);
insert into ACTIN (teid, evid)
values ('96', 219);
insert into ACTIN (teid, evid)
values ('96', 832);
insert into ACTIN (teid, evid)
values ('97', 77);
insert into ACTIN (teid, evid)
values ('97', 507);
insert into ACTIN (teid, evid)
values ('97', 905);
insert into ACTIN (teid, evid)
values ('98', 639);
insert into ACTIN (teid, evid)
values ('98', 821);
insert into ACTIN (teid, evid)
values ('99', 512);
insert into ACTIN (teid, evid)
values ('100', 584);
insert into ACTIN (teid, evid)
values ('101', 499);
insert into ACTIN (teid, evid)
values ('101', 643);
insert into ACTIN (teid, evid)
values ('102', 219);
insert into ACTIN (teid, evid)
values ('102', 558);
insert into ACTIN (teid, evid)
values ('102', 935);
insert into ACTIN (teid, evid)
values ('103', 750);
commit;
prompt 200 records committed...
insert into ACTIN (teid, evid)
values ('103', 935);
insert into ACTIN (teid, evid)
values ('104', 453);
insert into ACTIN (teid, evid)
values ('105', 319);
insert into ACTIN (teid, evid)
values ('106', 81);
insert into ACTIN (teid, evid)
values ('107', 955);
insert into ACTIN (teid, evid)
values ('108', 116);
insert into ACTIN (teid, evid)
values ('108', 304);
insert into ACTIN (teid, evid)
values ('108', 959);
insert into ACTIN (teid, evid)
values ('109', 55);
insert into ACTIN (teid, evid)
values ('109', 590);
insert into ACTIN (teid, evid)
values ('109', 605);
insert into ACTIN (teid, evid)
values ('110', 584);
insert into ACTIN (teid, evid)
values ('110', 792);
insert into ACTIN (teid, evid)
values ('111', 97);
insert into ACTIN (teid, evid)
values ('111', 507);
insert into ACTIN (teid, evid)
values ('112', 265);
insert into ACTIN (teid, evid)
values ('112', 978);
insert into ACTIN (teid, evid)
values ('113', 48);
insert into ACTIN (teid, evid)
values ('113', 59);
insert into ACTIN (teid, evid)
values ('113', 208);
insert into ACTIN (teid, evid)
values ('113', 372);
insert into ACTIN (teid, evid)
values ('114', 269);
insert into ACTIN (teid, evid)
values ('115', 294);
insert into ACTIN (teid, evid)
values ('115', 756);
insert into ACTIN (teid, evid)
values ('115', 977);
insert into ACTIN (teid, evid)
values ('116', 577);
insert into ACTIN (teid, evid)
values ('116', 732);
insert into ACTIN (teid, evid)
values ('117', 562);
insert into ACTIN (teid, evid)
values ('118', 96);
insert into ACTIN (teid, evid)
values ('118', 357);
insert into ACTIN (teid, evid)
values ('118', 451);
insert into ACTIN (teid, evid)
values ('118', 530);
insert into ACTIN (teid, evid)
values ('119', 517);
insert into ACTIN (teid, evid)
values ('119', 609);
insert into ACTIN (teid, evid)
values ('119', 844);
insert into ACTIN (teid, evid)
values ('120', 610);
insert into ACTIN (teid, evid)
values ('121', 174);
insert into ACTIN (teid, evid)
values ('121', 378);
insert into ACTIN (teid, evid)
values ('121', 982);
insert into ACTIN (teid, evid)
values ('122', 90);
insert into ACTIN (teid, evid)
values ('122', 119);
insert into ACTIN (teid, evid)
values ('122', 601);
insert into ACTIN (teid, evid)
values ('123', 736);
insert into ACTIN (teid, evid)
values ('125', 152);
insert into ACTIN (teid, evid)
values ('125', 520);
insert into ACTIN (teid, evid)
values ('125', 547);
insert into ACTIN (teid, evid)
values ('128', 248);
insert into ACTIN (teid, evid)
values ('128', 496);
insert into ACTIN (teid, evid)
values ('128', 574);
insert into ACTIN (teid, evid)
values ('129', 433);
insert into ACTIN (teid, evid)
values ('129', 507);
insert into ACTIN (teid, evid)
values ('130', 38);
insert into ACTIN (teid, evid)
values ('130', 806);
insert into ACTIN (teid, evid)
values ('131', 294);
insert into ACTIN (teid, evid)
values ('132', 81);
insert into ACTIN (teid, evid)
values ('132', 308);
insert into ACTIN (teid, evid)
values ('132', 399);
insert into ACTIN (teid, evid)
values ('132', 472);
insert into ACTIN (teid, evid)
values ('132', 657);
insert into ACTIN (teid, evid)
values ('132', 946);
insert into ACTIN (teid, evid)
values ('134', 318);
insert into ACTIN (teid, evid)
values ('134', 499);
insert into ACTIN (teid, evid)
values ('135', 207);
insert into ACTIN (teid, evid)
values ('136', 265);
insert into ACTIN (teid, evid)
values ('136', 462);
insert into ACTIN (teid, evid)
values ('137', 619);
insert into ACTIN (teid, evid)
values ('137', 643);
insert into ACTIN (teid, evid)
values ('137', 670);
insert into ACTIN (teid, evid)
values ('137', 982);
insert into ACTIN (teid, evid)
values ('139', 400);
insert into ACTIN (teid, evid)
values ('139', 777);
insert into ACTIN (teid, evid)
values ('140', 602);
insert into ACTIN (teid, evid)
values ('140', 832);
insert into ACTIN (teid, evid)
values ('141', 930);
insert into ACTIN (teid, evid)
values ('143', 89);
insert into ACTIN (teid, evid)
values ('144', 622);
insert into ACTIN (teid, evid)
values ('144', 652);
insert into ACTIN (teid, evid)
values ('145', 472);
insert into ACTIN (teid, evid)
values ('145', 986);
insert into ACTIN (teid, evid)
values ('146', 219);
insert into ACTIN (teid, evid)
values ('146', 644);
insert into ACTIN (teid, evid)
values ('146', 669);
insert into ACTIN (teid, evid)
values ('147', 63);
insert into ACTIN (teid, evid)
values ('147', 957);
insert into ACTIN (teid, evid)
values ('148', 693);
insert into ACTIN (teid, evid)
values ('149', 61);
insert into ACTIN (teid, evid)
values ('149', 399);
insert into ACTIN (teid, evid)
values ('150', 256);
insert into ACTIN (teid, evid)
values ('150', 560);
insert into ACTIN (teid, evid)
values ('152', 741);
insert into ACTIN (teid, evid)
values ('152', 995);
insert into ACTIN (teid, evid)
values ('153', 247);
insert into ACTIN (teid, evid)
values ('153', 605);
insert into ACTIN (teid, evid)
values ('153', 678);
insert into ACTIN (teid, evid)
values ('153', 770);
insert into ACTIN (teid, evid)
values ('153', 947);
insert into ACTIN (teid, evid)
values ('154', 163);
insert into ACTIN (teid, evid)
values ('155', 79);
insert into ACTIN (teid, evid)
values ('156', 321);
insert into ACTIN (teid, evid)
values ('156', 703);
commit;
prompt 300 records committed...
insert into ACTIN (teid, evid)
values ('206', 995);
insert into ACTIN (teid, evid)
values ('207', 467);
insert into ACTIN (teid, evid)
values ('207', 547);
insert into ACTIN (teid, evid)
values ('208', 432);
insert into ACTIN (teid, evid)
values ('208', 703);
insert into ACTIN (teid, evid)
values ('209', 372);
insert into ACTIN (teid, evid)
values ('210', 249);
insert into ACTIN (teid, evid)
values ('211', 69);
insert into ACTIN (teid, evid)
values ('211', 124);
insert into ACTIN (teid, evid)
values ('213', 164);
insert into ACTIN (teid, evid)
values ('213', 182);
insert into ACTIN (teid, evid)
values ('213', 467);
insert into ACTIN (teid, evid)
values ('214', 189);
insert into ACTIN (teid, evid)
values ('214', 697);
insert into ACTIN (teid, evid)
values ('214', 780);
insert into ACTIN (teid, evid)
values ('215', 445);
insert into ACTIN (teid, evid)
values ('216', 36);
insert into ACTIN (teid, evid)
values ('218', 327);
insert into ACTIN (teid, evid)
values ('218', 745);
insert into ACTIN (teid, evid)
values ('218', 775);
insert into ACTIN (teid, evid)
values ('219', 512);
insert into ACTIN (teid, evid)
values ('220', 163);
insert into ACTIN (teid, evid)
values ('220', 554);
insert into ACTIN (teid, evid)
values ('221', 544);
insert into ACTIN (teid, evid)
values ('221', 806);
insert into ACTIN (teid, evid)
values ('221', 968);
insert into ACTIN (teid, evid)
values ('222', 981);
insert into ACTIN (teid, evid)
values ('223', 452);
insert into ACTIN (teid, evid)
values ('223', 795);
insert into ACTIN (teid, evid)
values ('223', 823);
insert into ACTIN (teid, evid)
values ('224', 318);
insert into ACTIN (teid, evid)
values ('224', 450);
insert into ACTIN (teid, evid)
values ('224', 467);
insert into ACTIN (teid, evid)
values ('224', 742);
insert into ACTIN (teid, evid)
values ('225', 372);
insert into ACTIN (teid, evid)
values ('225', 797);
insert into ACTIN (teid, evid)
values ('225', 821);
insert into ACTIN (teid, evid)
values ('226', 97);
insert into ACTIN (teid, evid)
values ('226', 223);
insert into ACTIN (teid, evid)
values ('226', 489);
insert into ACTIN (teid, evid)
values ('226', 520);
insert into ACTIN (teid, evid)
values ('226', 780);
insert into ACTIN (teid, evid)
values ('227', 745);
insert into ACTIN (teid, evid)
values ('227', 772);
insert into ACTIN (teid, evid)
values ('229', 95);
insert into ACTIN (teid, evid)
values ('229', 797);
insert into ACTIN (teid, evid)
values ('230', 185);
insert into ACTIN (teid, evid)
values ('230', 750);
insert into ACTIN (teid, evid)
values ('230', 756);
insert into ACTIN (teid, evid)
values ('230', 862);
insert into ACTIN (teid, evid)
values ('231', 456);
insert into ACTIN (teid, evid)
values ('231', 590);
insert into ACTIN (teid, evid)
values ('231', 953);
insert into ACTIN (teid, evid)
values ('232', 485);
insert into ACTIN (teid, evid)
values ('233', 89);
insert into ACTIN (teid, evid)
values ('233', 240);
insert into ACTIN (teid, evid)
values ('234', 48);
insert into ACTIN (teid, evid)
values ('235', 149);
insert into ACTIN (teid, evid)
values ('235', 264);
insert into ACTIN (teid, evid)
values ('235', 351);
insert into ACTIN (teid, evid)
values ('236', 81);
insert into ACTIN (teid, evid)
values ('236', 391);
insert into ACTIN (teid, evid)
values ('236', 482);
insert into ACTIN (teid, evid)
values ('236', 486);
insert into ACTIN (teid, evid)
values ('237', 485);
insert into ACTIN (teid, evid)
values ('237', 596);
insert into ACTIN (teid, evid)
values ('237', 685);
insert into ACTIN (teid, evid)
values ('237', 720);
insert into ACTIN (teid, evid)
values ('237', 735);
insert into ACTIN (teid, evid)
values ('238', 391);
insert into ACTIN (teid, evid)
values ('238', 445);
insert into ACTIN (teid, evid)
values ('238', 607);
insert into ACTIN (teid, evid)
values ('240', 62);
insert into ACTIN (teid, evid)
values ('240', 119);
insert into ACTIN (teid, evid)
values ('240', 647);
insert into ACTIN (teid, evid)
values ('242', 442);
insert into ACTIN (teid, evid)
values ('242', 935);
insert into ACTIN (teid, evid)
values ('243', 351);
insert into ACTIN (teid, evid)
values ('244', 208);
insert into ACTIN (teid, evid)
values ('245', 129);
insert into ACTIN (teid, evid)
values ('245', 452);
insert into ACTIN (teid, evid)
values ('246', 116);
insert into ACTIN (teid, evid)
values ('247', 248);
insert into ACTIN (teid, evid)
values ('247', 496);
insert into ACTIN (teid, evid)
values ('248', 109);
insert into ACTIN (teid, evid)
values ('248', 269);
insert into ACTIN (teid, evid)
values ('248', 522);
insert into ACTIN (teid, evid)
values ('248', 643);
insert into ACTIN (teid, evid)
values ('248', 771);
insert into ACTIN (teid, evid)
values ('248', 778);
insert into ACTIN (teid, evid)
values ('248', 959);
insert into ACTIN (teid, evid)
values ('249', 400);
insert into ACTIN (teid, evid)
values ('250', 772);
insert into ACTIN (teid, evid)
values ('250', 946);
insert into ACTIN (teid, evid)
values ('251', 652);
insert into ACTIN (teid, evid)
values ('252', 824);
insert into ACTIN (teid, evid)
values ('253', 269);
insert into ACTIN (teid, evid)
values ('253', 327);
insert into ACTIN (teid, evid)
values ('253', 453);
insert into ACTIN (teid, evid)
values ('253', 530);
commit;
prompt 400 records committed...
insert into ACTIN (teid, evid)
values ('112', 372);
insert into ACTIN (teid, evid)
values ('112', 823);
insert into ACTIN (teid, evid)
values ('113', 40);
insert into ACTIN (teid, evid)
values ('113', 294);
insert into ACTIN (teid, evid)
values ('114', 97);
insert into ACTIN (teid, evid)
values ('114', 223);
insert into ACTIN (teid, evid)
values ('114', 450);
insert into ACTIN (teid, evid)
values ('114', 549);
insert into ACTIN (teid, evid)
values ('115', 207);
insert into ACTIN (teid, evid)
values ('115', 285);
insert into ACTIN (teid, evid)
values ('115', 775);
insert into ACTIN (teid, evid)
values ('116', 489);
insert into ACTIN (teid, evid)
values ('117', 129);
insert into ACTIN (teid, evid)
values ('117', 220);
insert into ACTIN (teid, evid)
values ('118', 149);
insert into ACTIN (teid, evid)
values ('118', 264);
insert into ACTIN (teid, evid)
values ('118', 486);
insert into ACTIN (teid, evid)
values ('118', 685);
insert into ACTIN (teid, evid)
values ('118', 824);
insert into ACTIN (teid, evid)
values ('119', 208);
insert into ACTIN (teid, evid)
values ('119', 495);
insert into ACTIN (teid, evid)
values ('120', 89);
insert into ACTIN (teid, evid)
values ('121', 48);
insert into ACTIN (teid, evid)
values ('121', 596);
insert into ACTIN (teid, evid)
values ('121', 647);
insert into ACTIN (teid, evid)
values ('122', 264);
insert into ACTIN (teid, evid)
values ('122', 607);
insert into ACTIN (teid, evid)
values ('122', 720);
insert into ACTIN (teid, evid)
values ('123', 555);
insert into ACTIN (teid, evid)
values ('123', 647);
insert into ACTIN (teid, evid)
values ('124', 442);
insert into ACTIN (teid, evid)
values ('124', 516);
insert into ACTIN (teid, evid)
values ('125', 182);
insert into ACTIN (teid, evid)
values ('126', 401);
insert into ACTIN (teid, evid)
values ('126', 452);
insert into ACTIN (teid, evid)
values ('127', 391);
insert into ACTIN (teid, evid)
values ('128', 294);
insert into ACTIN (teid, evid)
values ('128', 823);
insert into ACTIN (teid, evid)
values ('129', 448);
insert into ACTIN (teid, evid)
values ('129', 484);
insert into ACTIN (teid, evid)
values ('129', 647);
insert into ACTIN (teid, evid)
values ('130', 42);
insert into ACTIN (teid, evid)
values ('130', 264);
insert into ACTIN (teid, evid)
values ('130', 401);
insert into ACTIN (teid, evid)
values ('130', 444);
insert into ACTIN (teid, evid)
values ('130', 467);
insert into ACTIN (teid, evid)
values ('131', 452);
insert into ACTIN (teid, evid)
values ('131', 489);
insert into ACTIN (teid, evid)
values ('131', 520);
insert into ACTIN (teid, evid)
values ('132', 327);
insert into ACTIN (teid, evid)
values ('133', 97);
insert into ACTIN (teid, evid)
values ('133', 250);
insert into ACTIN (teid, evid)
values ('133', 372);
insert into ACTIN (teid, evid)
values ('134', 36);
insert into ACTIN (teid, evid)
values ('134', 189);
insert into ACTIN (teid, evid)
values ('134', 372);
insert into ACTIN (teid, evid)
values ('134', 547);
insert into ACTIN (teid, evid)
values ('134', 745);
insert into ACTIN (teid, evid)
values ('135', 155);
insert into ACTIN (teid, evid)
values ('136', 149);
insert into ACTIN (teid, evid)
values ('136', 442);
insert into ACTIN (teid, evid)
values ('138', 398);
insert into ACTIN (teid, evid)
values ('139', 372);
insert into ACTIN (teid, evid)
values ('141', 248);
insert into ACTIN (teid, evid)
values ('141', 318);
insert into ACTIN (teid, evid)
values ('142', 81);
insert into ACTIN (teid, evid)
values ('143', 48);
insert into ACTIN (teid, evid)
values ('143', 182);
insert into ACTIN (teid, evid)
values ('143', 546);
insert into ACTIN (teid, evid)
values ('144', 59);
insert into ACTIN (teid, evid)
values ('144', 109);
insert into ACTIN (teid, evid)
values ('144', 264);
insert into ACTIN (teid, evid)
values ('145', 358);
insert into ACTIN (teid, evid)
values ('146', 207);
insert into ACTIN (teid, evid)
values ('147', 445);
insert into ACTIN (teid, evid)
values ('148', 219);
insert into ACTIN (teid, evid)
values ('148', 308);
insert into ACTIN (teid, evid)
values ('149', 264);
insert into ACTIN (teid, evid)
values ('149', 420);
insert into ACTIN (teid, evid)
values ('151', 81);
insert into ACTIN (teid, evid)
values ('151', 189);
insert into ACTIN (teid, evid)
values ('152', 274);
insert into ACTIN (teid, evid)
values ('153', 486);
insert into ACTIN (teid, evid)
values ('154', 149);
insert into ACTIN (teid, evid)
values ('154', 208);
insert into ACTIN (teid, evid)
values ('155', 386);
insert into ACTIN (teid, evid)
values ('155', 420);
insert into ACTIN (teid, evid)
values ('157', 167);
insert into ACTIN (teid, evid)
values ('157', 264);
insert into ACTIN (teid, evid)
values ('158', 516);
insert into ACTIN (teid, evid)
values ('159', 116);
insert into ACTIN (teid, evid)
values ('160', 292);
insert into ACTIN (teid, evid)
values ('160', 485);
insert into ACTIN (teid, evid)
values ('160', 824);
insert into ACTIN (teid, evid)
values ('162', 553);
insert into ACTIN (teid, evid)
values ('163', 485);
insert into ACTIN (teid, evid)
values ('163', 577);
insert into ACTIN (teid, evid)
values ('164', 174);
insert into ACTIN (teid, evid)
values ('165', 265);
insert into ACTIN (teid, evid)
values ('165', 436);
commit;
prompt 500 records committed...
insert into ACTIN (teid, evid)
values ('167', 446);
insert into ACTIN (teid, evid)
values ('168', 126);
insert into ACTIN (teid, evid)
values ('168', 576);
insert into ACTIN (teid, evid)
values ('169', 446);
insert into ACTIN (teid, evid)
values ('169', 634);
insert into ACTIN (teid, evid)
values ('170', 452);
insert into ACTIN (teid, evid)
values ('171', 462);
insert into ACTIN (teid, evid)
values ('173', 264);
commit;
prompt 508 records loaded
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
values ('Lן¢•beck', 11128, 128, 'Van', 'available');
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
values ('Chorz׳£w', 11183, 183, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Richmond Hill', 11184, 184, 'Van', 'notavailable');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Cesena', 11185, 185, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Maarssen', 11186, 186, 'motorcycle', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('Glasgow', 11187, 187, 'Van', 'available');
insert into AMBULANS (locaation, ambulance_id, ambulancenum, tipe, status)
values ('K׳¦ln', 11188, 188, 'motorcycle', 'available');
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
values ('H׳”ssleholm', 11227, 227, 'Van', 'notavailable');
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
values ('Ani׳˜res', 11258, 258, 'motorcycle', 'available');
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
values ('Malm׳¦', 11349, 349, 'motorcycle', 'available');
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
values ('H׳”ssleholm', 11368, 368, 'motorcycle', 'notavailable');
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
values ('Zן¢•rich', 11383, 383, 'Van', 'notavailable');
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
values ('Bras׳lia', 11435, 435, 'motorcycle', 'notavailable');
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
values ('Zן¢•rich', 11462, 462, 'motorcycle', 'available');
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
values ('G׳”vle', 11483, 483, 'Van', 'notavailable');
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
prompt Loading EMERGENBODIES...
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Police', 890, ' 100', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Fire Department', 891, ' 101', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Emergency Medical Services (EMS)', 892, ' 102', 269, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Coast Guard', 893, ' 103', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Search and Rescue', 894, ' 104', 652, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Disaster Response Teams', 895, ' 105', 652, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Ambulance Services', 896, ' 106', 269, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Mountain Rescue', 897, ' 107', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Water Rescue', 898, ' 108', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Civil Defense', 899, ' 109', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' National Guard', 900, ' 110', 269, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Bomb Squad', 901, ' 111', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Hazardous Materials (HAZMAT) Teams', 902, ' 112', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Air Ambulance', 903, ' 113', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Wildlife Rescue', 904, ' 114', 652, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Anti-Terrorism Units', 905, ' 115', 62, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Red Cross', 906, ' 116', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Poison Control', 907, ' 117', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Crisis Intervention Teams', 908, ' 118', 795, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values (' Public Health Emergency Services', 909, ' 119', 182, null);
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Tactical Response Unit', 976, '150', 955, '10');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Crisis Intervention Teams', 994, '129', 182, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Poison Control', 955, '204', 402, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 916, '199', 782, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Crisis Intervention Teams', 998, '171', 90, '7');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 935, '202', 540, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 956, '124', 185, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 968, '130', 781, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Coast Guard', 941, '202', 517, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('National Guard', 978, '131', 152, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Poison Control', 918, '161', 562, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Disaster Response Team', 911, '162', 90, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 995, '161', 83, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 986, '140', 321, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 983, '151', 319, '1');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Poison Control', 925, '173', 759, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 987, '144', 165, '1');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 943, '194', 94, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 974, '169', 862, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 973, '123', 40, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Coast Guard', 938, '185', 140, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Medical Services (EMS)', 940, '159', 264, '10');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 977, '184', 200, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Red Cross', 926, '156', 797, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 996, '187', 795, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 997, '135', 824, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Medical Services (EMS)', 934, '197', 936, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Tactical Response Unit', 962, '188', 230, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 953, '191', 114, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Animal Rescue Services', 915, '176', 806, '10');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 957, '135', 738, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Coast Guard', 989, '162', 980, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 970, '198', 202, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 950, '200', 879, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Animal Rescue Services', 990, '179', 52, '6');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Tactical Response Unit', 999, '209', 126, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 972, '209', 877, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 942, '154', 375, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Volunteer Firefighters', 917, '125', 591, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 920, '192', 555, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 985, '139', 420, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Urban Search and Rescue (USAR)', 937, '148', 48, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Medical Reserve Corps (MRC)', 967, '183', 695, '5');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Medical Reserve Corps (MRC)', 958, '188', 179, '7');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 922, '202', 496, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('National Guard', 965, '160', 754, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 947, '195', 327, '7');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('HazMat (Hazardous Materials) Team', 961, '142', 930, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Fire Department', 910, '162', 546, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Search and Rescue', 936, '162', 485, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 981, '144', 436, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Police Department', 969, '157', 659, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 939, '144', 357, '8');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('National Guard', 933, '204', 657, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Community Emergency Response Teams (CERT)', 960, '145', 975, '3');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Emergency Management Agency', 932, '148', 782, '2');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Bomb Squad', 912, '199', 220, '4');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Crisis Intervention Teams', 971, '147', 618, '9');
insert into EMERGENBODIES (boname, boid, bophone, evid, readinesslevel)
values ('Red Cross', 975, '159', 418, '10');
commit;
prompt 79 records loaded
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
prompt Loading EMERGENCYDRILL...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 2, 30, 'tornado drill', '2902 Clemons Crossing', 364, 'PO Box 37418', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 1, 45, 'tornado drill', '48 Erie Circle', 435, 'Room 970', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 3, 180, 'active shooter drill', '87528 Oneill Crossing', 24, 'PO Box 24972', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-12-2023', 'dd-mm-yyyy'), 4, 45, 'earthquake drill', '54 Mariners Cove Junction', 158, 'PO Box 49321', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-12-2024', 'dd-mm-yyyy'), 10, 45, 'active shooter drill', '2437 Commercial Court', 322, 'Room 1419', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-08-2023', 'dd-mm-yyyy'), 16, 180, 'fire drill', '43604 Village Road', 497, 'Room 1017', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-01-2004', 'dd-mm-yyyy'), 136, 120, 'tornado drill', 'Nahariya', 537, 'Dimona''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('28-02-2010', 'dd-mm-yyyy'), 247, 535, 'tornado drill', 'Arad', 504, 'Karmiel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-04-2019', 'dd-mm-yyyy'), 103, 750, 'evacuation drill', 'Giv''atayim', 990, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-03-2009', 'dd-mm-yyyy'), 96, 287, 'tornado drill', 'Eilat', 13, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-09-2022', 'dd-mm-yyyy'), 413, 437, 'evacuation drill', 'Petah Tikva', 338, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-09-2017', 'dd-mm-yyyy'), 813, 179, 'active shooter drill', 'Arad', 506, 'Nahariya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-02-2020', 'dd-mm-yyyy'), 312, 449, 'active shooter drill', 'Sakhnin', 276, '''29 HaNegev Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-09-2001', 'dd-mm-yyyy'), 766, 651, 'earthquake drill', 'Safed', 566, '''21 Jaffa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-03-2005', 'dd-mm-yyyy'), 132, 389, 'evacuation drill', 'Qalansawe', 917, 'Nahariya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-07-2005', 'dd-mm-yyyy'), 317, 222, 'fire drill', 'Umm al-Fahm', 222, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-11-2007', 'dd-mm-yyyy'), 644, 136, 'evacuation drill', 'Netanya', 334, 'Arad''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-12-2002', 'dd-mm-yyyy'), 681, 710, 'evacuation drill', 'Beit Shemesh', 786, 'Bat Yam''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-02-2006', 'dd-mm-yyyy'), 342, 603, 'earthquake drill', 'Rehovot', 103, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-10-2023', 'dd-mm-yyyy'), 366, 20, 'evacuation drill', 'Dimona', 364, 'Giv''atayim''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-06-2005', 'dd-mm-yyyy'), 22, 157, 'evacuation drill', 'Ramat Gan', 971, '''2 Jabotinsky St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-01-2002', 'dd-mm-yyyy'), 470, 45, 'evacuation drill', 'Giv''atayim', 845, 'Netanya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-01-2014', 'dd-mm-yyyy'), 876, 48, 'active shooter drill', 'Rishon LeZion', 410, 'Rishon LeZion''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-11-2014', 'dd-mm-yyyy'), 990, 717, 'active shooter drill', 'Dimona', 72, '''13 Weizmann Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-03-2022', 'dd-mm-yyyy'), 555, 690, 'earthquake drill', 'Umm al-Fahm', 408, 'Bat Yam''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('20-06-2024', 'dd-mm-yyyy'), 760, 492, 'fire drill', 'Qalansawe', 899, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-01-2016', 'dd-mm-yyyy'), 856, 715, 'evacuation drill', 'Nazareth', 818, '''17 HaEmek St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-09-2021', 'dd-mm-yyyy'), 656, 46, 'fire drill', 'Afula', 138, 'Ashkelon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-10-2000', 'dd-mm-yyyy'), 76, 252, 'fire drill', 'Umm al-Fahm', 65, 'Karmiel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-11-2008', 'dd-mm-yyyy'), 535, 745, 'evacuation drill', 'Beit Shemesh', 35, 'Be''er Sheva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-05-2003', 'dd-mm-yyyy'), 236, 461, 'earthquake drill', 'Yavne', 888, 'Umm al-Fahm''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-05-2009', 'dd-mm-yyyy'), 57, 546, 'tornado drill', 'Netanya', 17, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-11-2009', 'dd-mm-yyyy'), 395, 323, 'earthquake drill', 'Hadera', 766, 'Karmiel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-11-2024', 'dd-mm-yyyy'), 14, 772, 'tornado drill', 'Raanana', 316, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-06-2022', 'dd-mm-yyyy'), 203, 417, 'active shooter drill', 'Safed', 950, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-05-2010', 'dd-mm-yyyy'), 559, 540, 'earthquake drill', 'Beit Shemesh', 131, '''14 HaNassi St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-05-2018', 'dd-mm-yyyy'), 689, 804, 'active shooter drill', 'Bnei Brak', 493, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-08-2021', 'dd-mm-yyyy'), 853, 424, 'fire drill', 'Afula', 187, '''1 Rothschild Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-06-2004', 'dd-mm-yyyy'), 890, 824, 'active shooter drill', 'Umm al-Fahm', 788, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-08-2017', 'dd-mm-yyyy'), 951, 778, 'tornado drill', 'Karmiel', 1000, '''13 Weizmann Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-02-2005', 'dd-mm-yyyy'), 602, 366, 'earthquake drill', 'Lod', 591, '''15 HaMelacha St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-10-2004', 'dd-mm-yyyy'), 875, 712, 'fire drill', 'Lod', 520, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('20-04-2004', 'dd-mm-yyyy'), 69, 231, 'fire drill', 'Raanana', 484, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-10-2006', 'dd-mm-yyyy'), 776, 221, 'active shooter drill', 'Sderot', 405, '''17 HaEmek St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-05-2002', 'dd-mm-yyyy'), 108, 884, 'earthquake drill', 'Holon', 222, 'Giv''atayim''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 117, 677, 'evacuation drill', 'Lod', 419, 'Hadera''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-02-2015', 'dd-mm-yyyy'), 303, 414, 'earthquake drill', 'Karmiel', 881, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-10-2014', 'dd-mm-yyyy'), 77, 413, 'earthquake drill', 'Tel Aviv', 739, 'Be''er Sheva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-04-2020', 'dd-mm-yyyy'), 126, 801, 'earthquake drill', 'Umm al-Fahm', 178, '''17 HaEmek St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-08-2007', 'dd-mm-yyyy'), 187, 305, 'evacuation drill', 'Haifa', 480, '''1 Rothschild Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-04-2017', 'dd-mm-yyyy'), 932, 732, 'tornado drill', 'Modi''in', 134, 'Afula''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-05-2020', 'dd-mm-yyyy'), 538, 848, 'evacuation drill', 'Kiryat Shmona', 800, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-03-2008', 'dd-mm-yyyy'), 940, 812, 'tornado drill', 'Raanana', 834, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-01-2012', 'dd-mm-yyyy'), 785, 353, 'evacuation drill', 'Modi''in', 700, 'Rehovot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-10-2005', 'dd-mm-yyyy'), 930, 228, 'earthquake drill', 'Lod', 984, '''14 HaNassi St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-08-2002', 'dd-mm-yyyy'), 63, 713, 'fire drill', 'Eilat', 967, '''20 HaAri St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-07-2004', 'dd-mm-yyyy'), 744, 745, 'earthquake drill', 'Raanana', 468, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 897, 150, 'earthquake drill', 'Tirat Carmel', 367, 'Sakhnin''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-10-2008', 'dd-mm-yyyy'), 645, 299, 'earthquake drill', 'Karmiel', 126, 'Beit Shemesh''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-11-2002', 'dd-mm-yyyy'), 880, 320, 'evacuation drill', 'Giv''atayim', 16, 'Sakhnin''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-08-2012', 'dd-mm-yyyy'), 389, 48, 'active shooter drill', 'Bnei Brak', 709, '''21 Jaffa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-12-2016', 'dd-mm-yyyy'), 253, 159, 'tornado drill', 'Tirat Carmel', 685, 'Holon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-06-2020', 'dd-mm-yyyy'), 412, 583, 'active shooter drill', 'Bnei Brak', 280, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-05-2018', 'dd-mm-yyyy'), 197, 513, 'fire drill', 'Nazareth', 347, 'Dimona''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-03-2006', 'dd-mm-yyyy'), 28, 552, 'evacuation drill', 'Dimona', 553, '''12 Moshe Dayan Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-11-2011', 'dd-mm-yyyy'), 685, 480, 'fire drill', 'Dimona', 536, 'Arad''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-12-2016', 'dd-mm-yyyy'), 915, 815, 'earthquake drill', 'Acre', 521, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-01-2016', 'dd-mm-yyyy'), 667, 321, 'fire drill', 'Rishon LeZion', 623, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-02-2024', 'dd-mm-yyyy'), 629, 459, 'tornado drill', 'Rishon LeZion', 663, '''33 HaTzafon St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-05-2021', 'dd-mm-yyyy'), 272, 219, 'fire drill', 'Ramat Gan', 14, 'Karmiel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-07-2007', 'dd-mm-yyyy'), 326, 888, 'active shooter drill', 'Dimona', 719, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-02-2007', 'dd-mm-yyyy'), 189, 609, 'fire drill', 'Yavne', 112, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-07-2020', 'dd-mm-yyyy'), 532, 337, 'active shooter drill', 'Raanana', 896, '''35 HaAlon St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-10-2005', 'dd-mm-yyyy'), 414, 138, 'evacuation drill', 'Be''er Sheva', 630, '''11 Sokolov St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-02-2000', 'dd-mm-yyyy'), 593, 593, 'earthquake drill', 'Modi''in', 148, '''31 HaPalmach St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-09-2007', 'dd-mm-yyyy'), 796, 39, 'fire drill', 'Bnei Brak', 225, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-03-2017', 'dd-mm-yyyy'), 534, 588, 'fire drill', 'Bnei Brak', 268, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-05-2009', 'dd-mm-yyyy'), 235, 451, 'earthquake drill', 'Eilat', 312, '''27 HaNarkis St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-01-2021', 'dd-mm-yyyy'), 428, 753, 'earthquake drill', 'Jerusalem', 606, '''33 HaTzafon St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('28-08-2014', 'dd-mm-yyyy'), 659, 544, 'tornado drill', 'Safed', 22, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-03-2012', 'dd-mm-yyyy'), 180, 807, 'evacuation drill', 'Nahariya', 807, 'Arad''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-06-2020', 'dd-mm-yyyy'), 939, 249, 'active shooter drill', 'Modi''in', 613, '''25 Sheshet HaYamim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-09-2007', 'dd-mm-yyyy'), 827, 459, 'fire drill', 'Hadera', 607, 'Giv''atayim''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-04-2008', 'dd-mm-yyyy'), 465, 74, 'tornado drill', 'Acre', 708, '''12 Moshe Dayan Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-07-2004', 'dd-mm-yyyy'), 222, 795, 'active shooter drill', 'Umm al-Fahm', 990, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-10-2000', 'dd-mm-yyyy'), 24, 766, 'evacuation drill', 'Ashdod', 748, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-06-2023', 'dd-mm-yyyy'), 215, 685, 'evacuation drill', 'Nahariya', 502, '''3 Herzl St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-07-2000', 'dd-mm-yyyy'), 461, 545, 'earthquake drill', 'Ashkelon', 736, 'Dimona''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-06-2005', 'dd-mm-yyyy'), 486, 508, 'evacuation drill', 'Ashdod', 363, 'Beit Shemesh''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-11-2002', 'dd-mm-yyyy'), 521, 428, 'evacuation drill', 'Safed', 570, '''16 Keren HaYesod St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-02-2022', 'dd-mm-yyyy'), 504, 320, 'active shooter drill', 'Qalansawe', 528, 'Acre''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 401, 347, 'earthquake drill', 'Qalansawe', 134, '''23 HaShalom St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-10-2014', 'dd-mm-yyyy'), 788, 604, 'tornado drill', 'Sakhnin', 438, 'Dimona''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-01-2018', 'dd-mm-yyyy'), 416, 641, 'tornado drill', 'Kfar Saba', 103, 'Umm al-Fahm''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-03-2010', 'dd-mm-yyyy'), 441, 562, 'tornado drill', 'Yavne', 378, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-06-2015', 'dd-mm-yyyy'), 592, 716, 'earthquake drill', 'Ashkelon', 838, 'Tirat Carmel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-01-2011', 'dd-mm-yyyy'), 115, 501, 'earthquake drill', 'Raanana', 399, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-09-2014', 'dd-mm-yyyy'), 765, 833, 'earthquake drill', 'Arad', 82, '''7 Begin Rd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-10-2014', 'dd-mm-yyyy'), 543, 868, 'evacuation drill', 'Bnei Brak', 605, '''15 HaMelacha St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-03-2013', 'dd-mm-yyyy'), 43, 439, 'fire drill', 'Rishon LeZion', 790, 'Rehovot''', null, null, null);
commit;
prompt 100 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-09-2013', 'dd-mm-yyyy'), 39, 661, 'earthquake drill', 'Be''er Sheva', 440, 'Sderot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-01-2024', 'dd-mm-yyyy'), 740, 162, 'active shooter drill', 'Netanya', 890, 'Acre''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-09-2009', 'dd-mm-yyyy'), 585, 788, 'evacuation drill', 'Afula', 585, '''29 HaNegev Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-06-2007', 'dd-mm-yyyy'), 603, 329, 'tornado drill', 'Or Yehuda', 785, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-11-2019', 'dd-mm-yyyy'), 581, 279, 'active shooter drill', 'Modi''in', 125, '''7 Begin Rd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-06-2006', 'dd-mm-yyyy'), 857, 835, 'fire drill', 'Nahariya', 478, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-09-2020', 'dd-mm-yyyy'), 955, 899, 'earthquake drill', 'Kiryat Shmona', 435, 'Yavne''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-04-2015', 'dd-mm-yyyy'), 140, 755, 'evacuation drill', 'Tiberias', 365, 'Holon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-01-2021', 'dd-mm-yyyy'), 29, 86, 'active shooter drill', 'Kfar Saba', 397, '''2 Jabotinsky St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-05-2015', 'dd-mm-yyyy'), 390, 235, 'earthquake drill', 'Or Yehuda', 96, '''3 Herzl St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-05-2021', 'dd-mm-yyyy'), 746, 561, 'evacuation drill', 'Umm al-Fahm', 34, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-08-2008', 'dd-mm-yyyy'), 259, 142, 'earthquake drill', 'Umm al-Fahm', 487, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-03-2017', 'dd-mm-yyyy'), 277, 64, 'active shooter drill', 'Arad', 259, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-07-2023', 'dd-mm-yyyy'), 84, 41, 'tornado drill', 'Modi''in', 387, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-12-2002', 'dd-mm-yyyy'), 684, 172, 'evacuation drill', 'Kiryat Shmona', 366, '''20 HaAri St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 353, 572, 'evacuation drill', 'Acre', 53, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-07-2004', 'dd-mm-yyyy'), 931, 367, 'earthquake drill', 'Qalansawe', 527, '''7 Begin Rd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-08-2007', 'dd-mm-yyyy'), 833, 809, 'tornado drill', 'Eilat', 81, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-02-2018', 'dd-mm-yyyy'), 749, 892, 'tornado drill', 'Bat Yam', 341, 'Jerusalem''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-05-2022', 'dd-mm-yyyy'), 708, 309, 'earthquake drill', 'Acre', 885, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-05-2005', 'dd-mm-yyyy'), 759, 643, 'evacuation drill', 'Jerusalem', 483, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-09-2003', 'dd-mm-yyyy'), 98, 517, 'fire drill', 'Karmiel', 718, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-02-2021', 'dd-mm-yyyy'), 917, 741, 'evacuation drill', 'Yavne', 650, 'Beit Shemesh''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-06-2016', 'dd-mm-yyyy'), 149, 113, 'active shooter drill', 'Acre', 791, 'Acre''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-10-2001', 'dd-mm-yyyy'), 234, 741, 'tornado drill', 'Sakhnin', 746, 'Haifa''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-03-2013', 'dd-mm-yyyy'), 632, 373, 'active shooter drill', 'Hadera', 490, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-06-2000', 'dd-mm-yyyy'), 32, 829, 'earthquake drill', 'Bat Yam', 789, 'Tirat Carmel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-05-2006', 'dd-mm-yyyy'), 590, 601, 'evacuation drill', 'Eilat', 857, 'Petah Tikva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-11-2019', 'dd-mm-yyyy'), 148, 810, 'evacuation drill', 'Or Yehuda', 802, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-04-2004', 'dd-mm-yyyy'), 320, 293, 'tornado drill', 'Eilat', 621, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-09-2016', 'dd-mm-yyyy'), 715, 66, 'active shooter drill', 'Hadera', 103, 'Rishon LeZion''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-06-2000', 'dd-mm-yyyy'), 639, 745, 'earthquake drill', 'Kiryat Shmona', 83, 'Beit Shemesh''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-03-2006', 'dd-mm-yyyy'), 791, 390, 'active shooter drill', 'Tel Aviv', 483, '''25 Sheshet HaYamim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-08-2010', 'dd-mm-yyyy'), 580, 783, 'tornado drill', 'Herzliya', 453, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-10-2021', 'dd-mm-yyyy'), 491, 875, 'tornado drill', 'Sderot', 900, '''26 HaDekel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-10-2023', 'dd-mm-yyyy'), 954, 736, 'active shooter drill', 'Hadera', 831, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-03-2000', 'dd-mm-yyyy'), 298, 429, 'active shooter drill', 'Giv''atayim', 792, 'Rishon LeZion''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-05-2007', 'dd-mm-yyyy'), 503, 574, 'evacuation drill', 'Giv''atayim', 584, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-10-2010', 'dd-mm-yyyy'), 114, 354, 'earthquake drill', 'Nazareth', 98, 'Tirat Carmel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-08-2022', 'dd-mm-yyyy'), 663, 701, 'fire drill', 'Ashdod', 502, '''7 Begin Rd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-08-2023', 'dd-mm-yyyy'), 100, 672, 'tornado drill', 'Bat Yam', 700, '''33 HaTzafon St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-10-2006', 'dd-mm-yyyy'), 526, 714, 'active shooter drill', 'Sakhnin', 880, 'Bat Yam''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-12-2011', 'dd-mm-yyyy'), 19, 425, 'active shooter drill', 'Sakhnin', 303, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-05-2023', 'dd-mm-yyyy'), 384, 572, 'tornado drill', 'Lod', 92, 'Arad''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-07-2001', 'dd-mm-yyyy'), 118, 332, 'fire drill', 'Bat Yam', 308, 'Arad''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-05-2016', 'dd-mm-yyyy'), 369, 355, 'earthquake drill', 'Hadera', 826, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-06-2000', 'dd-mm-yyyy'), 898, 582, 'tornado drill', 'Safed', 152, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-12-2006', 'dd-mm-yyyy'), 284, 865, 'earthquake drill', 'Holon', 393, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-10-2008', 'dd-mm-yyyy'), 513, 809, 'tornado drill', 'Ramat Gan', 60, 'Ashkelon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-03-2019', 'dd-mm-yyyy'), 208, 803, 'evacuation drill', 'Afula', 665, 'Acre''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-03-2008', 'dd-mm-yyyy'), 107, 694, 'tornado drill', 'Sakhnin', 326, '''12 Moshe Dayan Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-09-2013', 'dd-mm-yyyy'), 434, 696, 'active shooter drill', 'Or Yehuda', 789, '''3 Herzl St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-04-2011', 'dd-mm-yyyy'), 505, 483, 'tornado drill', 'Acre', 465, 'Ashkelon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-11-2024', 'dd-mm-yyyy'), 124, 858, 'active shooter drill', 'Eilat', 839, '''14 HaNassi St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-09-2009', 'dd-mm-yyyy'), 554, 165, 'evacuation drill', 'Rishon LeZion', 464, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-08-2009', 'dd-mm-yyyy'), 478, 66, 'earthquake drill', 'Rishon LeZion', 944, '''11 Sokolov St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-04-2014', 'dd-mm-yyyy'), 563, 69, 'fire drill', 'Afula', 356, 'Sderot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-10-2002', 'dd-mm-yyyy'), 794, 741, 'evacuation drill', 'Tel Aviv', 63, 'Beit Shemesh''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-06-2017', 'dd-mm-yyyy'), 701, 203, 'active shooter drill', 'Acre', 234, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-12-2009', 'dd-mm-yyyy'), 403, 480, 'active shooter drill', 'Ashkelon', 610, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('28-12-2013', 'dd-mm-yyyy'), 905, 316, 'earthquake drill', 'Be''er Sheva', 254, 'Sderot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-09-2010', 'dd-mm-yyyy'), 425, 785, 'earthquake drill', 'Giv''atayim', 277, '''13 Weizmann Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-01-2010', 'dd-mm-yyyy'), 166, 393, 'evacuation drill', 'Hadera', 418, 'Netanya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-01-2021', 'dd-mm-yyyy'), 161, 685, 'active shooter drill', 'Qalansawe', 817, 'Ashdod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-02-2002', 'dd-mm-yyyy'), 159, 865, 'evacuation drill', 'Nahariya', 64, 'Ashkelon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-04-2013', 'dd-mm-yyyy'), 135, 84, 'earthquake drill', 'Karmiel', 912, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-05-2019', 'dd-mm-yyyy'), 800, 138, 'fire drill', 'Kfar Saba', 497, '''29 HaNegev Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-09-2016', 'dd-mm-yyyy'), 780, 189, 'earthquake drill', 'Giv''atayim', 758, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-03-2020', 'dd-mm-yyyy'), 219, 680, 'evacuation drill', 'Petah Tikva', 470, 'Tirat Carmel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-03-2000', 'dd-mm-yyyy'), 385, 545, 'tornado drill', 'Sakhnin', 857, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-07-2017', 'dd-mm-yyyy'), 111, 533, 'fire drill', 'Yavne', 514, '''28 HaBesor St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-05-2021', 'dd-mm-yyyy'), 835, 412, 'earthquake drill', 'Afula', 702, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-10-2024', 'dd-mm-yyyy'), 42, 164, 'earthquake drill', 'Arad', 293, 'Petah Tikva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-10-2021', 'dd-mm-yyyy'), 407, 665, 'tornado drill', 'Bat Yam', 243, 'Umm al-Fahm''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-02-2006', 'dd-mm-yyyy'), 150, 858, 'evacuation drill', 'Or Yehuda', 705, '''30 HaZayit St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-10-2004', 'dd-mm-yyyy'), 664, 561, 'active shooter drill', 'Kfar Saba', 130, 'Nahariya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-01-2009', 'dd-mm-yyyy'), 466, 556, 'tornado drill', 'Rehovot', 287, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-03-2022', 'dd-mm-yyyy'), 325, 289, 'fire drill', 'Yavne', 661, 'Herzliya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-09-2011', 'dd-mm-yyyy'), 231, 227, 'tornado drill', 'Hadera', 118, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-08-2007', 'dd-mm-yyyy'), 133, 677, 'earthquake drill', 'Giv''atayim', 380, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-04-2019', 'dd-mm-yyyy'), 903, 198, 'fire drill', 'Sderot', 85, 'Hadera''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-03-2003', 'dd-mm-yyyy'), 20, 754, 'earthquake drill', 'Afula', 16, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('20-02-2002', 'dd-mm-yyyy'), 539, 575, 'evacuation drill', 'Safed', 344, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-03-2024', 'dd-mm-yyyy'), 467, 56, 'evacuation drill', 'Rehovot', 814, '''25 Sheshet HaYamim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-09-2014', 'dd-mm-yyyy'), 802, 385, 'evacuation drill', 'Jerusalem', 89, '''27 HaNarkis St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-12-2022', 'dd-mm-yyyy'), 709, 71, 'tornado drill', 'Ramat Gan', 583, '''14 HaNassi St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-12-2012', 'dd-mm-yyyy'), 994, 517, 'active shooter drill', 'Dimona', 634, 'Modi''in''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-06-2010', 'dd-mm-yyyy'), 640, 743, 'active shooter drill', 'Karmiel', 677, 'Sderot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-01-2008', 'dd-mm-yyyy'), 850, 741, 'fire drill', 'Nahariya', 847, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-11-2014', 'dd-mm-yyyy'), 790, 811, 'earthquake drill', 'Eilat', 451, 'Rishon LeZion''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-04-2009', 'dd-mm-yyyy'), 998, 787, 'active shooter drill', 'Modi''in', 300, 'Umm al-Fahm''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-09-2016', 'dd-mm-yyyy'), 621, 327, 'fire drill', 'Rehovot', 852, 'Yavne''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-01-2002', 'dd-mm-yyyy'), 582, 4, 'fire drill', 'Bat Yam', 71, '''31 HaPalmach St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-12-2004', 'dd-mm-yyyy'), 588, 657, 'active shooter drill', 'Tiberias', 982, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-11-2003', 'dd-mm-yyyy'), 762, 68, 'evacuation drill', 'Rehovot', 497, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-12-2016', 'dd-mm-yyyy'), 430, 205, 'earthquake drill', 'Or Yehuda', 597, 'Karmiel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-10-2001', 'dd-mm-yyyy'), 475, 31, 'evacuation drill', 'Karmiel', 725, '''2 Jabotinsky St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-02-2003', 'dd-mm-yyyy'), 174, 636, 'fire drill', 'Umm al-Fahm', 897, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-08-2007', 'dd-mm-yyyy'), 313, 436, 'tornado drill', 'Ashdod', 409, '''24 HaTikva St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-10-2013', 'dd-mm-yyyy'), 570, 450, 'evacuation drill', 'Giv''atayim', 125, 'Jerusalem''', null, null, null);
commit;
prompt 200 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('28-08-2023', 'dd-mm-yyyy'), 617, 545, 'fire drill', 'Rehovot', 513, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-10-2007', 'dd-mm-yyyy'), 710, 143, 'earthquake drill', 'Rishon LeZion', 165, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-10-2022', 'dd-mm-yyyy'), 507, 455, 'tornado drill', 'Yavne', 6, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-12-2003', 'dd-mm-yyyy'), 677, 43, 'tornado drill', 'Lod', 732, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-07-2008', 'dd-mm-yyyy'), 175, 345, 'active shooter drill', 'Raanana', 925, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('28-10-2005', 'dd-mm-yyyy'), 273, 278, 'tornado drill', 'Arad', 920, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('20-03-2017', 'dd-mm-yyyy'), 793, 175, 'fire drill', 'Bnei Brak', 937, 'Afula''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-11-2017', 'dd-mm-yyyy'), 431, 664, 'evacuation drill', 'Dimona', 961, 'Jerusalem''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-09-2001', 'dd-mm-yyyy'), 604, 869, 'active shooter drill', 'Nazareth', 121, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-03-2017', 'dd-mm-yyyy'), 436, 662, 'fire drill', 'Giv''atayim', 111, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-05-2017', 'dd-mm-yyyy'), 316, 245, 'active shooter drill', 'Modi''in', 414, 'Petah Tikva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-09-2003', 'dd-mm-yyyy'), 386, 610, 'earthquake drill', 'Holon', 667, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 348, 76, 'active shooter drill', 'Tirat Carmel', 675, 'Tirat Carmel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-04-2013', 'dd-mm-yyyy'), 184, 10, 'tornado drill', 'Kiryat Shmona', 942, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-01-2022', 'dd-mm-yyyy'), 720, 374, 'tornado drill', 'Sakhnin', 916, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-11-2003', 'dd-mm-yyyy'), 480, 340, 'fire drill', 'Tirat Carmel', 847, '''28 HaBesor St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-04-2009', 'dd-mm-yyyy'), 474, 356, 'earthquake drill', 'Bat Yam', 504, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-10-2006', 'dd-mm-yyyy'), 649, 335, 'tornado drill', 'Netanya', 883, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-03-2011', 'dd-mm-yyyy'), 328, 661, 'evacuation drill', 'Holon', 660, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-11-2011', 'dd-mm-yyyy'), 519, 594, 'earthquake drill', 'Rishon LeZion', 970, 'Jerusalem''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-07-2008', 'dd-mm-yyyy'), 824, 346, 'evacuation drill', 'Holon', 37, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-08-2011', 'dd-mm-yyyy'), 183, 700, 'active shooter drill', 'Lod', 740, 'Rehovot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-10-2015', 'dd-mm-yyyy'), 188, 667, 'tornado drill', 'Nahariya', 298, 'Ashdod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-05-2002', 'dd-mm-yyyy'), 360, 498, 'tornado drill', 'Or Yehuda', 14, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-10-2022', 'dd-mm-yyyy'), 323, 609, 'earthquake drill', 'Yavne', 877, '''1 Rothschild Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-11-2016', 'dd-mm-yyyy'), 962, 656, 'tornado drill', 'Eilat', 472, '''27 HaNarkis St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-12-2021', 'dd-mm-yyyy'), 989, 789, 'earthquake drill', 'Lod', 726, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-09-2022', 'dd-mm-yyyy'), 152, 667, 'active shooter drill', 'Karmiel', 178, 'Bat Yam''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-06-2024', 'dd-mm-yyyy'), 947, 448, 'fire drill', 'Yavne', 919, '''16 Keren HaYesod St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-09-2023', 'dd-mm-yyyy'), 460, 298, 'fire drill', 'Herzliya', 306, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-10-2001', 'dd-mm-yyyy'), 814, 304, 'fire drill', 'Giv''atayim', 315, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-12-2020', 'dd-mm-yyyy'), 74, 885, 'earthquake drill', 'Safed', 711, 'Lod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-02-2003', 'dd-mm-yyyy'), 492, 220, 'tornado drill', 'Beit Shemesh', 53, 'Tel Aviv''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 147, 749, 'active shooter drill', 'Bat Yam', 59, 'Rehovot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 177, 702, 'earthquake drill', 'Tel Aviv', 317, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-03-2017', 'dd-mm-yyyy'), 647, 315, 'fire drill', 'Eilat', 959, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-02-2010', 'dd-mm-yyyy'), 738, 306, 'tornado drill', 'Dimona', 558, 'Beit Shemesh''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-02-2015', 'dd-mm-yyyy'), 248, 426, 'evacuation drill', 'Umm al-Fahm', 814, 'Hadera''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-02-2024', 'dd-mm-yyyy'), 735, 271, 'earthquake drill', 'Yavne', 984, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-09-2005', 'dd-mm-yyyy'), 540, 309, 'earthquake drill', 'Dimona', 884, '''5 Weizmann St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-10-2018', 'dd-mm-yyyy'), 119, 876, 'fire drill', 'Karmiel', 321, 'Be''er Sheva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-10-2016', 'dd-mm-yyyy'), 196, 737, 'earthquake drill', 'Beit Shemesh', 868, 'Modi''in''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-02-2001', 'dd-mm-yyyy'), 240, 396, 'active shooter drill', 'Qalansawe', 861, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-10-2016', 'dd-mm-yyyy'), 477, 389, 'evacuation drill', 'Karmiel', 337, 'Safed''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-11-2019', 'dd-mm-yyyy'), 900, 386, 'tornado drill', 'Nazareth', 580, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-08-2024', 'dd-mm-yyyy'), 400, 873, 'tornado drill', 'Rishon LeZion', 541, 'Yavne''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-04-2009', 'dd-mm-yyyy'), 895, 557, 'tornado drill', 'Giv''atayim', 986, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-06-2015', 'dd-mm-yyyy'), 270, 518, 'fire drill', 'Kiryat Shmona', 273, '''13 Weizmann Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-01-2016', 'dd-mm-yyyy'), 846, 366, 'fire drill', 'Afula', 238, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-11-2005', 'dd-mm-yyyy'), 809, 46, 'evacuation drill', 'Hadera', 739, 'Herzliya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-08-2013', 'dd-mm-yyyy'), 935, 409, 'evacuation drill', 'Ramat Gan', 465, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-06-2012', 'dd-mm-yyyy'), 479, 362, 'earthquake drill', 'Yavne', 511, '''25 Sheshet HaYamim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-09-2022', 'dd-mm-yyyy'), 490, 432, 'fire drill', 'Sakhnin', 139, '''17 HaEmek St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-03-2023', 'dd-mm-yyyy'), 458, 330, 'active shooter drill', 'Rehovot', 372, '''29 HaNegev Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-07-2021', 'dd-mm-yyyy'), 319, 229, 'evacuation drill', 'Ashdod', 276, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-05-2016', 'dd-mm-yyyy'), 264, 847, 'tornado drill', 'Qalansawe', 991, 'Acre''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 411, 693, 'earthquake drill', 'Raanana', 883, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-04-2016', 'dd-mm-yyyy'), 243, 646, 'active shooter drill', 'Lod', 181, '''1 Rothschild Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-07-2016', 'dd-mm-yyyy'), 228, 701, 'active shooter drill', 'Bnei Brak', 151, 'Herzliya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-01-2012', 'dd-mm-yyyy'), 668, 856, 'active shooter drill', 'Ramat Gan', 174, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 304, 162, 'evacuation drill', 'Afula', 445, 'Nahariya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-02-2008', 'dd-mm-yyyy'), 816, 616, 'earthquake drill', 'Holon', 351, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-12-2021', 'dd-mm-yyyy'), 382, 237, 'fire drill', 'Umm al-Fahm', 153, '''30 HaZayit St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-01-2010', 'dd-mm-yyyy'), 977, 44, 'fire drill', 'Karmiel', 635, 'Rehovot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-04-2015', 'dd-mm-yyyy'), 949, 868, 'earthquake drill', 'Netanya', 573, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-10-2002', 'dd-mm-yyyy'), 61, 594, 'earthquake drill', 'Kiryat Shmona', 971, '''28 HaBesor St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('05-10-2022', 'dd-mm-yyyy'), 608, 277, 'fire drill', 'Bat Yam', 732, 'Herzliya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-02-2020', 'dd-mm-yyyy'), 156, 322, 'evacuation drill', 'Holon', 824, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 450, 655, 'tornado drill', 'Tiberias', 99, 'Rehovot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-10-2006', 'dd-mm-yyyy'), 737, 738, 'earthquake drill', 'Rishon LeZion', 469, '''17 HaEmek St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-01-2006', 'dd-mm-yyyy'), 165, 361, 'fire drill', 'Rehovot', 121, 'Haifa''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-03-2023', 'dd-mm-yyyy'), 15, 319, 'evacuation drill', 'Ramat Gan', 571, 'Tel Aviv''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-02-2012', 'dd-mm-yyyy'), 375, 831, 'fire drill', 'Nazareth', 34, 'Hadera''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-11-2015', 'dd-mm-yyyy'), 975, 882, 'earthquake drill', 'Eilat', 56, '''16 Keren HaYesod St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-09-2021', 'dd-mm-yyyy'), 831, 55, 'evacuation drill', 'Hadera', 449, 'Petah Tikva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-06-2001', 'dd-mm-yyyy'), 261, 391, 'fire drill', 'Modi''in', 995, 'Ashkelon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-04-2001', 'dd-mm-yyyy'), 256, 899, 'earthquake drill', 'Raanana', 133, '''19 HaRav Kook St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-11-2013', 'dd-mm-yyyy'), 704, 870, 'tornado drill', 'Acre', 686, '''31 HaPalmach St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 359, 610, 'evacuation drill', 'Be''er Sheva', 529, '''3 Herzl St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('31-01-2018', 'dd-mm-yyyy'), 227, 521, 'fire drill', 'Nazareth', 256, '''4 Hillel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-03-2003', 'dd-mm-yyyy'), 751, 555, 'earthquake drill', 'Giv''atayim', 722, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-01-2006', 'dd-mm-yyyy'), 512, 483, 'fire drill', 'Be''er Sheva', 231, '''11 Sokolov St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-12-2014', 'dd-mm-yyyy'), 128, 55, 'fire drill', 'Eilat', 814, 'Tirat Carmel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-01-2009', 'dd-mm-yyyy'), 314, 805, 'fire drill', 'Arad', 436, 'Rehovot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-07-2008', 'dd-mm-yyyy'), 142, 484, 'tornado drill', 'Eilat', 915, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-11-2017', 'dd-mm-yyyy'), 812, 546, 'tornado drill', 'Sakhnin', 746, '''8 Aluf Sadeh St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-01-2022', 'dd-mm-yyyy'), 520, 701, 'fire drill', 'Be''er Sheva', 732, '''12 Moshe Dayan Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-04-2020', 'dd-mm-yyyy'), 356, 539, 'earthquake drill', 'Netanya', 295, 'Dimona''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-07-2018', 'dd-mm-yyyy'), 697, 562, 'earthquake drill', 'Jerusalem', 854, 'Dimona''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-12-2020', 'dd-mm-yyyy'), 657, 571, 'evacuation drill', 'Sderot', 14, '''23 HaShalom St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-07-2023', 'dd-mm-yyyy'), 262, 376, 'active shooter drill', 'Beit Shemesh', 417, '''12 Moshe Dayan Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-08-2012', 'dd-mm-yyyy'), 758, 104, 'active shooter drill', 'Eilat', 314, 'Ashdod''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-05-2019', 'dd-mm-yyyy'), 446, 529, 'fire drill', 'Sakhnin', 112, 'Haifa''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('17-11-2016', 'dd-mm-yyyy'), 72, 798, 'active shooter drill', 'Modi''in', 296, 'Or Yehuda''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-06-2016', 'dd-mm-yyyy'), 213, 845, 'active shooter drill', 'Dimona', 365, '''28 HaBesor St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('16-03-2017', 'dd-mm-yyyy'), 839, 392, 'earthquake drill', 'Ramat Gan', 147, 'Tel Aviv''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-11-2012', 'dd-mm-yyyy'), 596, 630, 'tornado drill', 'Ramat Gan', 928, '''29 HaNegev Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-10-2020', 'dd-mm-yyyy'), 983, 550, 'earthquake drill', 'Sakhnin', 462, 'Tel Aviv''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-05-2019', 'dd-mm-yyyy'), 524, 345, 'evacuation drill', 'Bat Yam', 861, '''13 Weizmann Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-01-2014', 'dd-mm-yyyy'), 899, 829, 'fire drill', 'Beit Shemesh', 167, 'Ashdod''', null, null, null);
commit;
prompt 300 records committed...
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-12-2013', 'dd-mm-yyyy'), 798, 401, 'fire drill', 'Beit Shemesh', 572, '''22 David Remez St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-04-2000', 'dd-mm-yyyy'), 281, 583, 'fire drill', 'Arad', 767, 'Herzliya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-06-2023', 'dd-mm-yyyy'), 764, 452, 'fire drill', 'Qalansawe', 437, '''33 HaTzafon St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('28-10-2018', 'dd-mm-yyyy'), 296, 511, 'earthquake drill', 'Giv''atayim', 264, 'Sderot''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('01-07-2013', 'dd-mm-yyyy'), 289, 409, 'earthquake drill', 'Giv''atayim', 352, 'Ramat Gan''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('20-02-2013', 'dd-mm-yyyy'), 600, 894, 'fire drill', 'Safed', 692, 'Be''er Sheva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-01-2010', 'dd-mm-yyyy'), 232, 71, 'evacuation drill', 'Or Yehuda', 947, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-10-2015', 'dd-mm-yyyy'), 878, 510, 'earthquake drill', 'Kfar Saba', 144, 'Afula''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-02-2002', 'dd-mm-yyyy'), 946, 874, 'active shooter drill', 'Petah Tikva', 454, '''10 HaTayasim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-02-2017', 'dd-mm-yyyy'), 294, 84, 'earthquake drill', 'Holon', 605, 'Modi''in''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('10-04-2008', 'dd-mm-yyyy'), 609, 511, 'tornado drill', 'Giv''atayim', 848, '''25 Sheshet HaYamim Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-12-2020', 'dd-mm-yyyy'), 146, 220, 'evacuation drill', 'Eilat', 123, '''3 Herzl St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-08-2022', 'dd-mm-yyyy'), 456, 658, 'evacuation drill', 'Kiryat Shmona', 761, '''7 Begin Rd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-10-2004', 'dd-mm-yyyy'), 447, 567, 'tornado drill', 'Be''er Sheva', 942, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('14-10-2004', 'dd-mm-yyyy'), 892, 515, 'earthquake drill', 'Giv''atayim', 436, '''2 Jabotinsky St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('22-04-2013', 'dd-mm-yyyy'), 468, 644, 'tornado drill', 'Modi''in', 714, 'Herzliya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('13-07-2017', 'dd-mm-yyyy'), 523, 334, 'active shooter drill', 'Eilat', 178, 'Yavne''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-10-2019', 'dd-mm-yyyy'), 971, 504, 'active shooter drill', 'Bat Yam', 412, 'Karmiel''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-08-2023', 'dd-mm-yyyy'), 807, 245, 'active shooter drill', 'Afula', 475, 'Qalansawe''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('21-09-2019', 'dd-mm-yyyy'), 121, 160, 'fire drill', 'Qalansawe', 975, '''34 HaGilboa St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-11-2019', 'dd-mm-yyyy'), 881, 479, 'active shooter drill', 'Kiryat Shmona', 628, 'Netanya''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('02-07-2017', 'dd-mm-yyyy'), 370, 577, 'earthquake drill', 'Kfar Saba', 93, '''22 David Remez St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-01-2001', 'dd-mm-yyyy'), 806, 413, 'tornado drill', 'Nahariya', 243, 'Petah Tikva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('18-12-2024', 'dd-mm-yyyy'), 733, 757, 'evacuation drill', 'Netanya', 829, '''12 Moshe Dayan Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('07-03-2006', 'dd-mm-yyyy'), 756, 298, 'tornado drill', 'Afula', 726, '''14 HaNassi St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-05-2021', 'dd-mm-yyyy'), 669, 756, 'tornado drill', 'Holon', 822, 'Hadera''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-06-2014', 'dd-mm-yyyy'), 773, 464, 'fire drill', 'Safed', 834, 'Jerusalem''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-10-2014', 'dd-mm-yyyy'), 714, 499, 'evacuation drill', 'Ramat Gan', 757, 'Giv''atayim''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('03-07-2011', 'dd-mm-yyyy'), 921, 725, 'active shooter drill', 'Modi''in', 537, 'Holon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('30-05-2013', 'dd-mm-yyyy'), 451, 566, 'earthquake drill', 'Tirat Carmel', 467, 'Kfar Saba''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('25-11-2021', 'dd-mm-yyyy'), 198, 371, 'earthquake drill', 'Lod', 491, 'Holon''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('24-02-2011', 'dd-mm-yyyy'), 630, 260, 'fire drill', 'Hadera', 697, '''11 Sokolov St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('27-05-2020', 'dd-mm-yyyy'), 435, 470, 'evacuation drill', 'Giv''atayim', 0, '''20 HaAri St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('08-08-2005', 'dd-mm-yyyy'), 50, 731, 'evacuation drill', 'Arad', 682, '''18 HaTamar St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('04-02-2008', 'dd-mm-yyyy'), 634, 778, 'tornado drill', 'Beit Shemesh', 943, '''35 HaAlon St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('11-03-2024', 'dd-mm-yyyy'), 170, 417, 'evacuation drill', 'Bat Yam', 427, '''28 HaBesor St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('23-06-2000', 'dd-mm-yyyy'), 862, 359, 'tornado drill', 'Dimona', 792, 'Jerusalem''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('09-02-2008', 'dd-mm-yyyy'), 271, 446, 'active shooter drill', 'Tel Aviv', 552, '''26 HaDekel St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('12-11-2014', 'dd-mm-yyyy'), 757, 562, 'active shooter drill', 'Bat Yam', 530, 'Hadera''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('29-07-2005', 'dd-mm-yyyy'), 252, 506, 'evacuation drill', 'Lod', 77, 'Be''er Sheva''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('15-09-2008', 'dd-mm-yyyy'), 871, 764, 'tornado drill', 'Nahariya', 195, '''6 Ben Gurion Blvd', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-10-2008', 'dd-mm-yyyy'), 767, 499, 'active shooter drill', 'Acre', 585, 'Bat Yam''', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('19-08-2020', 'dd-mm-yyyy'), 293, 486, 'fire drill', 'Kiryat Shmona', 596, '''31 HaPalmach St', null, null, null);
insert into EMERGENCYDRILL (emdrdate, emdrid, emdrdurationminutes, emdremergencytype, emdrlocation, emdrparticipantscount, emdraddress, driver_id, medic_id, paramedic_id)
values (to_date('26-11-2016', 'dd-mm-yyyy'), 742, 705, 'fire drill', 'Petah Tikva', 155, '''35 HaAlon St', null, null, null);
commit;
prompt 344 records loaded
prompt Loading EVDEBRIEFING...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (590, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (591, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (592, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (593, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (594, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (595, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (596, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (597, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (598, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (599, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (600, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (601, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (602, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (603, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (604, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (605, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (606, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (607, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (608, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (609, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (610, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (611, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (612, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (613, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (614, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (615, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (616, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (617, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (618, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (619, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (620, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (621, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (622, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (623, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (624, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (625, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (626, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (627, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (628, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (629, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (630, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (631, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (632, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (633, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (634, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (635, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (636, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (637, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (638, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (639, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (640, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (641, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (642, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (643, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (644, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (645, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (646, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (647, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (648, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (649, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (650, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (651, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (652, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (653, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (654, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (655, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (656, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (657, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (658, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (659, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (660, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (661, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (662, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (663, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (664, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (665, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (666, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (667, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (668, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (669, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (670, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (671, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (672, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (673, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (674, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (675, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (676, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (677, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (678, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (679, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (680, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (681, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (682, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (683, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (684, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (685, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (686, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (687, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (688, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (689, ' Nitai Gal', 0, ' Medium operation');
commit;
prompt 100 records committed...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (690, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (691, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (692, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (693, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (694, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (695, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (696, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (697, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (698, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (699, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (700, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (701, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (702, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (703, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (704, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (705, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (706, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (707, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (708, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (709, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (710, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (711, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (712, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (713, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (714, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (715, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (716, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (717, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (718, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (719, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (720, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (721, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (722, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (723, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (724, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (725, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (726, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (727, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (728, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (729, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (730, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (731, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (732, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (733, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (734, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (735, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (736, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (737, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (738, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (739, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (740, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (741, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (742, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (743, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (744, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (745, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (746, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (747, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (748, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (749, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (750, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (751, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (752, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (753, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (754, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (755, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (756, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (757, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (758, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (759, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (760, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (761, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (762, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (763, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (764, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (765, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (766, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (767, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (768, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (769, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (770, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (771, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (772, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (773, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (774, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (775, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (776, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (777, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (778, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (779, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (780, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (781, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (782, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (783, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (784, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (785, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (786, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (787, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (788, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (789, ' Nadav Shalem', 1, ' Improvement required');
commit;
prompt 200 records committed...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (790, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (791, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (792, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (793, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (794, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (795, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (796, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (797, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (798, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (799, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (800, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (801, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (802, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (803, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (804, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (805, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (806, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (807, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (808, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (809, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (810, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (811, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (812, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (813, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (814, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (815, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (816, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (817, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (818, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (819, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (820, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (821, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (822, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (823, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (824, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (825, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (826, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (827, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (828, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (829, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (830, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (831, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (832, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (833, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (834, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (835, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (836, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (837, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (838, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (839, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (840, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (841, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (842, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (843, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (844, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (845, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (846, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (847, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (848, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (849, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (850, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (851, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (852, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (853, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (854, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (855, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (856, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (857, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (858, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (859, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (860, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (861, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (862, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (863, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (864, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (865, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (866, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (867, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (868, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (869, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (870, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (871, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (872, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (873, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (874, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (875, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (876, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (877, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (878, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (879, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (880, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (881, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (882, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (883, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (884, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (885, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (886, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (887, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (888, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (889, ' Nadav Shalem', 1, ' Improvement required');
commit;
prompt 300 records committed...
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (890, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (891, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (892, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (893, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (894, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (895, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (896, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (897, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (898, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (899, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (900, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (901, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (902, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (903, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (904, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (905, ' Nadav Shalem', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (906, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (907, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (908, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (909, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (910, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (911, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (912, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (913, ' Nitai Gal', 1, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (914, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (915, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (916, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (917, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (918, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (919, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (920, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (921, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (922, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (923, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (924, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (925, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (926, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (927, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (928, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (929, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (930, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (931, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (932, ' Nitai Gal', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (933, ' Nitai Gal', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (934, ' Nitai Gal', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (935, ' Nitai Gal', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (936, ' Nitai Gal', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (937, ' Nitai Gal', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (938, ' Nitai Gal', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (939, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (940, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (941, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (942, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (943, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (944, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (945, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (946, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (947, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (948, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (949, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (950, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (951, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (952, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (953, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (954, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (955, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (956, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (957, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (958, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (959, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (960, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (961, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (962, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (963, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (964, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (965, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (966, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (967, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (968, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (969, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (970, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (971, ' Nadav Shalem', 1, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (972, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (973, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (974, ' Nadav Shalem', 0, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (975, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (976, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (977, ' Nadav Shalem', 1, ' Failure');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (978, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (979, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (980, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (981, ' Nadav Shalem', 1, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (982, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (983, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (984, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (985, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (986, ' Nadav Shalem', 0, ' Well Done');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (987, ' Nadav Shalem', 0, ' Medium operation');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (988, ' Nadav Shalem', 0, ' Improvement required');
insert into EVDEBRIEFING (debid, deresponsibility, destatus, deconclusion)
values (989, ' Nadav Shalem', 0, ' Well Done');
commit;
prompt 400 records loaded
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
prompt Loading PRACTICING...
insert into PRACTICING (emdrid, teid)
values (1, '103');
insert into PRACTICING (emdrid, teid)
values (1, '118');
insert into PRACTICING (emdrid, teid)
values (1, '122');
insert into PRACTICING (emdrid, teid)
values (1, '123');
insert into PRACTICING (emdrid, teid)
values (1, '130');
insert into PRACTICING (emdrid, teid)
values (1, '136');
insert into PRACTICING (emdrid, teid)
values (1, '145');
insert into PRACTICING (emdrid, teid)
values (1, '158');
insert into PRACTICING (emdrid, teid)
values (1, '178');
insert into PRACTICING (emdrid, teid)
values (1, '179');
insert into PRACTICING (emdrid, teid)
values (1, '187');
insert into PRACTICING (emdrid, teid)
values (1, '197');
insert into PRACTICING (emdrid, teid)
values (1, '204');
insert into PRACTICING (emdrid, teid)
values (1, '213');
insert into PRACTICING (emdrid, teid)
values (1, '215');
insert into PRACTICING (emdrid, teid)
values (1, '221');
insert into PRACTICING (emdrid, teid)
values (1, '229');
insert into PRACTICING (emdrid, teid)
values (1, '23');
insert into PRACTICING (emdrid, teid)
values (1, '234');
insert into PRACTICING (emdrid, teid)
values (1, '239');
insert into PRACTICING (emdrid, teid)
values (1, '243');
insert into PRACTICING (emdrid, teid)
values (1, '246');
insert into PRACTICING (emdrid, teid)
values (1, '255');
insert into PRACTICING (emdrid, teid)
values (1, '266');
insert into PRACTICING (emdrid, teid)
values (1, '271');
insert into PRACTICING (emdrid, teid)
values (1, '278');
insert into PRACTICING (emdrid, teid)
values (1, '288');
insert into PRACTICING (emdrid, teid)
values (1, '291');
insert into PRACTICING (emdrid, teid)
values (1, '298');
insert into PRACTICING (emdrid, teid)
values (1, '308');
insert into PRACTICING (emdrid, teid)
values (1, '314');
insert into PRACTICING (emdrid, teid)
values (1, '315');
insert into PRACTICING (emdrid, teid)
values (1, '318');
insert into PRACTICING (emdrid, teid)
values (1, '324');
insert into PRACTICING (emdrid, teid)
values (1, '328');
insert into PRACTICING (emdrid, teid)
values (1, '330');
insert into PRACTICING (emdrid, teid)
values (1, '334');
insert into PRACTICING (emdrid, teid)
values (1, '336');
insert into PRACTICING (emdrid, teid)
values (1, '347');
insert into PRACTICING (emdrid, teid)
values (1, '354');
insert into PRACTICING (emdrid, teid)
values (1, '360');
insert into PRACTICING (emdrid, teid)
values (1, '371');
insert into PRACTICING (emdrid, teid)
values (1, '377');
insert into PRACTICING (emdrid, teid)
values (1, '383');
insert into PRACTICING (emdrid, teid)
values (1, '43');
insert into PRACTICING (emdrid, teid)
values (1, '50');
insert into PRACTICING (emdrid, teid)
values (1, '60');
insert into PRACTICING (emdrid, teid)
values (1, '62');
insert into PRACTICING (emdrid, teid)
values (1, '63');
insert into PRACTICING (emdrid, teid)
values (1, '7');
insert into PRACTICING (emdrid, teid)
values (1, '72');
insert into PRACTICING (emdrid, teid)
values (1, '76');
insert into PRACTICING (emdrid, teid)
values (1, '77');
insert into PRACTICING (emdrid, teid)
values (1, '86');
insert into PRACTICING (emdrid, teid)
values (1, '93');
insert into PRACTICING (emdrid, teid)
values (1, '97');
insert into PRACTICING (emdrid, teid)
values (1, '98');
insert into PRACTICING (emdrid, teid)
values (1, '99');
insert into PRACTICING (emdrid, teid)
values (2, '106');
insert into PRACTICING (emdrid, teid)
values (2, '118');
insert into PRACTICING (emdrid, teid)
values (2, '119');
insert into PRACTICING (emdrid, teid)
values (2, '121');
insert into PRACTICING (emdrid, teid)
values (2, '14');
insert into PRACTICING (emdrid, teid)
values (2, '141');
insert into PRACTICING (emdrid, teid)
values (2, '142');
insert into PRACTICING (emdrid, teid)
values (2, '147');
insert into PRACTICING (emdrid, teid)
values (2, '149');
insert into PRACTICING (emdrid, teid)
values (2, '153');
insert into PRACTICING (emdrid, teid)
values (2, '155');
insert into PRACTICING (emdrid, teid)
values (2, '163');
insert into PRACTICING (emdrid, teid)
values (2, '167');
insert into PRACTICING (emdrid, teid)
values (2, '176');
insert into PRACTICING (emdrid, teid)
values (2, '180');
insert into PRACTICING (emdrid, teid)
values (2, '185');
insert into PRACTICING (emdrid, teid)
values (2, '187');
insert into PRACTICING (emdrid, teid)
values (2, '196');
insert into PRACTICING (emdrid, teid)
values (2, '197');
insert into PRACTICING (emdrid, teid)
values (2, '205');
insert into PRACTICING (emdrid, teid)
values (2, '214');
insert into PRACTICING (emdrid, teid)
values (2, '217');
insert into PRACTICING (emdrid, teid)
values (2, '218');
insert into PRACTICING (emdrid, teid)
values (2, '225');
insert into PRACTICING (emdrid, teid)
values (2, '231');
insert into PRACTICING (emdrid, teid)
values (2, '241');
insert into PRACTICING (emdrid, teid)
values (2, '242');
insert into PRACTICING (emdrid, teid)
values (2, '247');
insert into PRACTICING (emdrid, teid)
values (2, '252');
insert into PRACTICING (emdrid, teid)
values (2, '261');
insert into PRACTICING (emdrid, teid)
values (2, '272');
insert into PRACTICING (emdrid, teid)
values (2, '275');
insert into PRACTICING (emdrid, teid)
values (2, '285');
insert into PRACTICING (emdrid, teid)
values (2, '29');
insert into PRACTICING (emdrid, teid)
values (2, '294');
insert into PRACTICING (emdrid, teid)
values (2, '299');
insert into PRACTICING (emdrid, teid)
values (2, '3');
insert into PRACTICING (emdrid, teid)
values (2, '303');
insert into PRACTICING (emdrid, teid)
values (2, '306');
insert into PRACTICING (emdrid, teid)
values (2, '312');
insert into PRACTICING (emdrid, teid)
values (2, '318');
insert into PRACTICING (emdrid, teid)
values (2, '320');
commit;
prompt 100 records committed...
insert into PRACTICING (emdrid, teid)
values (2, '322');
insert into PRACTICING (emdrid, teid)
values (2, '330');
insert into PRACTICING (emdrid, teid)
values (2, '332');
insert into PRACTICING (emdrid, teid)
values (2, '333');
insert into PRACTICING (emdrid, teid)
values (2, '339');
insert into PRACTICING (emdrid, teid)
values (2, '344');
insert into PRACTICING (emdrid, teid)
values (2, '349');
insert into PRACTICING (emdrid, teid)
values (2, '356');
insert into PRACTICING (emdrid, teid)
values (2, '36');
insert into PRACTICING (emdrid, teid)
values (2, '367');
insert into PRACTICING (emdrid, teid)
values (2, '37');
insert into PRACTICING (emdrid, teid)
values (2, '372');
insert into PRACTICING (emdrid, teid)
values (2, '377');
insert into PRACTICING (emdrid, teid)
values (2, '382');
insert into PRACTICING (emdrid, teid)
values (2, '384');
insert into PRACTICING (emdrid, teid)
values (2, '44');
insert into PRACTICING (emdrid, teid)
values (2, '50');
insert into PRACTICING (emdrid, teid)
values (2, '56');
insert into PRACTICING (emdrid, teid)
values (2, '6');
insert into PRACTICING (emdrid, teid)
values (2, '61');
insert into PRACTICING (emdrid, teid)
values (2, '70');
insert into PRACTICING (emdrid, teid)
values (2, '76');
insert into PRACTICING (emdrid, teid)
values (2, '85');
insert into PRACTICING (emdrid, teid)
values (2, '87');
insert into PRACTICING (emdrid, teid)
values (2, '88');
insert into PRACTICING (emdrid, teid)
values (2, '92');
insert into PRACTICING (emdrid, teid)
values (2, '97');
insert into PRACTICING (emdrid, teid)
values (4, '60');
commit;
prompt 128 records loaded
prompt Loading WORKER...
insert into WORKER (wosalary, teid)
values (9707, '375');
insert into WORKER (wosalary, teid)
values (4220, '240');
insert into WORKER (wosalary, teid)
values (22477, '198');
insert into WORKER (wosalary, teid)
values (15533, '73');
insert into WORKER (wosalary, teid)
values (14383, '298');
insert into WORKER (wosalary, teid)
values (3570, '248');
insert into WORKER (wosalary, teid)
values (4031, '115');
insert into WORKER (wosalary, teid)
values (19639, '255');
insert into WORKER (wosalary, teid)
values (2323, '71');
insert into WORKER (wosalary, teid)
values (16963, '223');
insert into WORKER (wosalary, teid)
values (5895, '329');
insert into WORKER (wosalary, teid)
values (13216, '94');
insert into WORKER (wosalary, teid)
values (7747, '204');
insert into WORKER (wosalary, teid)
values (13578, '122');
insert into WORKER (wosalary, teid)
values (11453, '292');
insert into WORKER (wosalary, teid)
values (6429, '180');
insert into WORKER (wosalary, teid)
values (906, '284');
insert into WORKER (wosalary, teid)
values (13967, '220');
insert into WORKER (wosalary, teid)
values (21084, '103');
insert into WORKER (wosalary, teid)
values (8492, '344');
insert into WORKER (wosalary, teid)
values (21452, '297');
insert into WORKER (wosalary, teid)
values (9941, '266');
insert into WORKER (wosalary, teid)
values (21708, '169');
insert into WORKER (wosalary, teid)
values (2449, '236');
insert into WORKER (wosalary, teid)
values (22641, '109');
insert into WORKER (wosalary, teid)
values (13380, '139');
insert into WORKER (wosalary, teid)
values (23049, '254');
insert into WORKER (wosalary, teid)
values (13736, '153');
insert into WORKER (wosalary, teid)
values (20056, '15');
insert into WORKER (wosalary, teid)
values (1936, '278');
insert into WORKER (wosalary, teid)
values (23237, '34');
insert into WORKER (wosalary, teid)
values (3384, '79');
insert into WORKER (wosalary, teid)
values (3904, '10');
insert into WORKER (wosalary, teid)
values (7516, '97');
insert into WORKER (wosalary, teid)
values (14278, '35');
insert into WORKER (wosalary, teid)
values (3630, '167');
insert into WORKER (wosalary, teid)
values (18628, '331');
insert into WORKER (wosalary, teid)
values (14445, '336');
insert into WORKER (wosalary, teid)
values (9446, '348');
insert into WORKER (wosalary, teid)
values (8063, '228');
insert into WORKER (wosalary, teid)
values (11723, '291');
insert into WORKER (wosalary, teid)
values (14315, '354');
insert into WORKER (wosalary, teid)
values (21137, '191');
insert into WORKER (wosalary, teid)
values (22416, '148');
insert into WORKER (wosalary, teid)
values (11613, '279');
insert into WORKER (wosalary, teid)
values (18054, '95');
insert into WORKER (wosalary, teid)
values (18186, '126');
insert into WORKER (wosalary, teid)
values (13926, '129');
insert into WORKER (wosalary, teid)
values (12633, '372');
insert into WORKER (wosalary, teid)
values (19939, '318');
insert into WORKER (wosalary, teid)
values (16835, '330');
insert into WORKER (wosalary, teid)
values (3836, '106');
insert into WORKER (wosalary, teid)
values (14335, '68');
insert into WORKER (wosalary, teid)
values (16621, '214');
insert into WORKER (wosalary, teid)
values (9623, '160');
insert into WORKER (wosalary, teid)
values (5862, '85');
insert into WORKER (wosalary, teid)
values (18470, '215');
insert into WORKER (wosalary, teid)
values (2559, '193');
insert into WORKER (wosalary, teid)
values (7223, '150');
insert into WORKER (wosalary, teid)
values (20489, '196');
insert into WORKER (wosalary, teid)
values (10169, '32');
insert into WORKER (wosalary, teid)
values (21832, '256');
insert into WORKER (wosalary, teid)
values (16673, '275');
insert into WORKER (wosalary, teid)
values (19684, '1');
insert into WORKER (wosalary, teid)
values (19483, '62');
insert into WORKER (wosalary, teid)
values (5808, '235');
insert into WORKER (wosalary, teid)
values (5060, '373');
insert into WORKER (wosalary, teid)
values (13479, '92');
insert into WORKER (wosalary, teid)
values (14724, '188');
insert into WORKER (wosalary, teid)
values (6219, '6');
insert into WORKER (wosalary, teid)
values (5669, '340');
insert into WORKER (wosalary, teid)
values (22160, '351');
insert into WORKER (wosalary, teid)
values (18964, '343');
insert into WORKER (wosalary, teid)
values (4475, '260');
insert into WORKER (wosalary, teid)
values (11963, '24');
insert into WORKER (wosalary, teid)
values (5822, '151');
insert into WORKER (wosalary, teid)
values (15850, '316');
insert into WORKER (wosalary, teid)
values (4100, '205');
insert into WORKER (wosalary, teid)
values (3979, '237');
insert into WORKER (wosalary, teid)
values (19101, '294');
insert into WORKER (wosalary, teid)
values (19700, '380');
insert into WORKER (wosalary, teid)
values (19250, '28');
insert into WORKER (wosalary, teid)
values (10415, '325');
insert into WORKER (wosalary, teid)
values (6170, '314');
insert into WORKER (wosalary, teid)
values (4106, '87');
insert into WORKER (wosalary, teid)
values (20778, '369');
insert into WORKER (wosalary, teid)
values (13510, '78');
insert into WORKER (wosalary, teid)
values (22029, '376');
insert into WORKER (wosalary, teid)
values (2425, '321');
insert into WORKER (wosalary, teid)
values (21252, '327');
insert into WORKER (wosalary, teid)
values (22865, '99');
insert into WORKER (wosalary, teid)
values (7604, '96');
insert into WORKER (wosalary, teid)
values (14082, '65');
insert into WORKER (wosalary, teid)
values (23605, '229');
insert into WORKER (wosalary, teid)
values (14037, '50');
insert into WORKER (wosalary, teid)
values (4510, '141');
insert into WORKER (wosalary, teid)
values (9553, '20');
insert into WORKER (wosalary, teid)
values (7859, '59');
insert into WORKER (wosalary, teid)
values (7242, '93');
insert into WORKER (wosalary, teid)
values (11379, '74');
commit;
prompt 100 records committed...
insert into WORKER (wosalary, teid)
values (17199, '49');
insert into WORKER (wosalary, teid)
values (6957, '300');
insert into WORKER (wosalary, teid)
values (3361, '136');
insert into WORKER (wosalary, teid)
values (10636, '157');
insert into WORKER (wosalary, teid)
values (21472, '319');
insert into WORKER (wosalary, teid)
values (21915, '52');
insert into WORKER (wosalary, teid)
values (4487, '123');
insert into WORKER (wosalary, teid)
values (16229, '368');
insert into WORKER (wosalary, teid)
values (16161, '42');
insert into WORKER (wosalary, teid)
values (13425, '349');
insert into WORKER (wosalary, teid)
values (819, '137');
insert into WORKER (wosalary, teid)
values (14565, '89');
insert into WORKER (wosalary, teid)
values (11544, '82');
insert into WORKER (wosalary, teid)
values (1965, '281');
insert into WORKER (wosalary, teid)
values (3512, '56');
insert into WORKER (wosalary, teid)
values (20669, '114');
insert into WORKER (wosalary, teid)
values (12849, '347');
insert into WORKER (wosalary, teid)
values (2552, '182');
insert into WORKER (wosalary, teid)
values (15365, '346');
insert into WORKER (wosalary, teid)
values (12847, '227');
insert into WORKER (wosalary, teid)
values (7568, '163');
insert into WORKER (wosalary, teid)
values (16365, '156');
insert into WORKER (wosalary, teid)
values (16682, '172');
insert into WORKER (wosalary, teid)
values (16748, '213');
insert into WORKER (wosalary, teid)
values (15602, '363');
insert into WORKER (wosalary, teid)
values (4943, '365');
insert into WORKER (wosalary, teid)
values (13825, '249');
insert into WORKER (wosalary, teid)
values (20758, '370');
insert into WORKER (wosalary, teid)
values (12375, '37');
insert into WORKER (wosalary, teid)
values (20413, '40');
insert into WORKER (wosalary, teid)
values (14085, '104');
insert into WORKER (wosalary, teid)
values (23457, '45');
insert into WORKER (wosalary, teid)
values (10976, '378');
insert into WORKER (wosalary, teid)
values (11229, '108');
insert into WORKER (wosalary, teid)
values (1036, '181');
insert into WORKER (wosalary, teid)
values (21127, '127');
insert into WORKER (wosalary, teid)
values (689, '25');
insert into WORKER (wosalary, teid)
values (23065, '242');
insert into WORKER (wosalary, teid)
values (24779, '2');
insert into WORKER (wosalary, teid)
values (23042, '145');
insert into WORKER (wosalary, teid)
values (10096, '328');
insert into WORKER (wosalary, teid)
values (8359, '183');
insert into WORKER (wosalary, teid)
values (22175, '63');
insert into WORKER (wosalary, teid)
values (12348, '176');
insert into WORKER (wosalary, teid)
values (15176, '75');
insert into WORKER (wosalary, teid)
values (22441, '173');
insert into WORKER (wosalary, teid)
values (10635, '230');
insert into WORKER (wosalary, teid)
values (21302, '219');
insert into WORKER (wosalary, teid)
values (10075, '274');
insert into WORKER (wosalary, teid)
values (24286, '66');
insert into WORKER (wosalary, teid)
values (21096, '216');
insert into WORKER (wosalary, teid)
values (18243, '305');
insert into WORKER (wosalary, teid)
values (7571, '186');
insert into WORKER (wosalary, teid)
values (4900, '277');
insert into WORKER (wosalary, teid)
values (3502, '124');
insert into WORKER (wosalary, teid)
values (21443, '142');
insert into WORKER (wosalary, teid)
values (2462, '312');
insert into WORKER (wosalary, teid)
values (20351, '80');
insert into WORKER (wosalary, teid)
values (17517, '43');
insert into WORKER (wosalary, teid)
values (19305, '60');
insert into WORKER (wosalary, teid)
values (20925, '22');
insert into WORKER (wosalary, teid)
values (2379, '206');
insert into WORKER (wosalary, teid)
values (17919, '16');
insert into WORKER (wosalary, teid)
values (21122, '342');
insert into WORKER (wosalary, teid)
values (4755, '189');
insert into WORKER (wosalary, teid)
values (7018, '144');
insert into WORKER (wosalary, teid)
values (9245, '306');
insert into WORKER (wosalary, teid)
values (3765, '131');
insert into WORKER (wosalary, teid)
values (8063, '91');
insert into WORKER (wosalary, teid)
values (9849, '130');
insert into WORKER (wosalary, teid)
values (22943, '224');
insert into WORKER (wosalary, teid)
values (8243, '263');
insert into WORKER (wosalary, teid)
values (6583, '102');
insert into WORKER (wosalary, teid)
values (19586, '38');
insert into WORKER (wosalary, teid)
values (5792, '26');
insert into WORKER (wosalary, teid)
values (15358, '332');
insert into WORKER (wosalary, teid)
values (3046, '132');
insert into WORKER (wosalary, teid)
values (16866, '309');
insert into WORKER (wosalary, teid)
values (24049, '285');
insert into WORKER (wosalary, teid)
values (14647, '140');
insert into WORKER (wosalary, teid)
values (8285, '221');
insert into WORKER (wosalary, teid)
values (7795, '159');
insert into WORKER (wosalary, teid)
values (19697, '324');
insert into WORKER (wosalary, teid)
values (9378, '23');
insert into WORKER (wosalary, teid)
values (12794, '233');
insert into WORKER (wosalary, teid)
values (4356, '371');
insert into WORKER (wosalary, teid)
values (6082, '259');
insert into WORKER (wosalary, teid)
values (10294, '177');
insert into WORKER (wosalary, teid)
values (19573, '269');
insert into WORKER (wosalary, teid)
values (11673, '243');
insert into WORKER (wosalary, teid)
values (19402, '166');
insert into WORKER (wosalary, teid)
values (11005, '13');
insert into WORKER (wosalary, teid)
values (23750, '280');
insert into WORKER (wosalary, teid)
values (11008, '107');
insert into WORKER (wosalary, teid)
values (15372, '118');
insert into WORKER (wosalary, teid)
values (12275, '70');
insert into WORKER (wosalary, teid)
values (4277, '350');
insert into WORKER (wosalary, teid)
values (23499, '105');
insert into WORKER (wosalary, teid)
values (21882, '273');
insert into WORKER (wosalary, teid)
values (23063, '333');
commit;
prompt 200 records committed...
insert into WORKER (wosalary, teid)
values (5450, '152');
insert into WORKER (wosalary, teid)
values (9308, '301');
insert into WORKER (wosalary, teid)
values (21655, '261');
insert into WORKER (wosalary, teid)
values (22282, '335');
insert into WORKER (wosalary, teid)
values (8765, '222');
insert into WORKER (wosalary, teid)
values (9914, '195');
insert into WORKER (wosalary, teid)
values (4600, '262');
insert into WORKER (wosalary, teid)
values (4437, '267');
insert into WORKER (wosalary, teid)
values (14004, '252');
insert into WORKER (wosalary, teid)
values (11284, '384');
insert into WORKER (wosalary, teid)
values (1771, '250');
insert into WORKER (wosalary, teid)
values (21113, '81');
insert into WORKER (wosalary, teid)
values (15450, '11');
insert into WORKER (wosalary, teid)
values (24993, '232');
insert into WORKER (wosalary, teid)
values (24183, '283');
insert into WORKER (wosalary, teid)
values (22636, '379');
insert into WORKER (wosalary, teid)
values (22796, '125');
insert into WORKER (wosalary, teid)
values (14367, '270');
insert into WORKER (wosalary, teid)
values (22382, '341');
insert into WORKER (wosalary, teid)
values (1408, '57');
insert into WORKER (wosalary, teid)
values (4993, '268');
insert into WORKER (wosalary, teid)
values (13921, '208');
insert into WORKER (wosalary, teid)
values (11075, '51');
insert into WORKER (wosalary, teid)
values (6413, '282');
insert into WORKER (wosalary, teid)
values (14594, '247');
insert into WORKER (wosalary, teid)
values (3466, '239');
insert into WORKER (wosalary, teid)
values (6411, '299');
insert into WORKER (wosalary, teid)
values (23365, '209');
insert into WORKER (wosalary, teid)
values (803, '367');
insert into WORKER (wosalary, teid)
values (5102, '67');
insert into WORKER (wosalary, teid)
values (15810, '128');
insert into WORKER (wosalary, teid)
values (12381, '54');
insert into WORKER (wosalary, teid)
values (20228, '293');
insert into WORKER (wosalary, teid)
values (2602, '322');
insert into WORKER (wosalary, teid)
values (24400, '146');
insert into WORKER (wosalary, teid)
values (16332, '4');
insert into WORKER (wosalary, teid)
values (5977, '72');
insert into WORKER (wosalary, teid)
values (8153, '58');
insert into WORKER (wosalary, teid)
values (24638, '210');
insert into WORKER (wosalary, teid)
values (13801, '317');
insert into WORKER (wosalary, teid)
values (9831, '29');
insert into WORKER (wosalary, teid)
values (19668, '53');
insert into WORKER (wosalary, teid)
values (8958, '287');
insert into WORKER (wosalary, teid)
values (7409, '362');
insert into WORKER (wosalary, teid)
values (5486, '366');
insert into WORKER (wosalary, teid)
values (7960, '383');
insert into WORKER (wosalary, teid)
values (1202, '337');
insert into WORKER (wosalary, teid)
values (6757, '352');
commit;
prompt 248 records loaded
prompt Loading REOPRTEV...
insert into REOPRTEV (teid, debid)
values ('1', 658);
insert into REOPRTEV (teid, debid)
values ('1', 725);
insert into REOPRTEV (teid, debid)
values ('10', 915);
insert into REOPRTEV (teid, debid)
values ('102', 854);
insert into REOPRTEV (teid, debid)
values ('104', 665);
insert into REOPRTEV (teid, debid)
values ('105', 789);
insert into REOPRTEV (teid, debid)
values ('106', 829);
insert into REOPRTEV (teid, debid)
values ('106', 840);
insert into REOPRTEV (teid, debid)
values ('106', 909);
insert into REOPRTEV (teid, debid)
values ('107', 776);
insert into REOPRTEV (teid, debid)
values ('109', 743);
insert into REOPRTEV (teid, debid)
values ('109', 936);
insert into REOPRTEV (teid, debid)
values ('11', 700);
insert into REOPRTEV (teid, debid)
values ('11', 826);
insert into REOPRTEV (teid, debid)
values ('11', 828);
insert into REOPRTEV (teid, debid)
values ('11', 943);
insert into REOPRTEV (teid, debid)
values ('115', 786);
insert into REOPRTEV (teid, debid)
values ('118', 650);
insert into REOPRTEV (teid, debid)
values ('118', 958);
insert into REOPRTEV (teid, debid)
values ('122', 825);
insert into REOPRTEV (teid, debid)
values ('123', 663);
insert into REOPRTEV (teid, debid)
values ('123', 842);
insert into REOPRTEV (teid, debid)
values ('123', 909);
insert into REOPRTEV (teid, debid)
values ('124', 633);
insert into REOPRTEV (teid, debid)
values ('125', 778);
insert into REOPRTEV (teid, debid)
values ('125', 976);
insert into REOPRTEV (teid, debid)
values ('126', 664);
insert into REOPRTEV (teid, debid)
values ('126', 834);
insert into REOPRTEV (teid, debid)
values ('127', 682);
insert into REOPRTEV (teid, debid)
values ('127', 758);
insert into REOPRTEV (teid, debid)
values ('127', 778);
insert into REOPRTEV (teid, debid)
values ('128', 954);
insert into REOPRTEV (teid, debid)
values ('129', 691);
insert into REOPRTEV (teid, debid)
values ('129', 785);
insert into REOPRTEV (teid, debid)
values ('130', 860);
insert into REOPRTEV (teid, debid)
values ('130', 869);
insert into REOPRTEV (teid, debid)
values ('131', 737);
insert into REOPRTEV (teid, debid)
values ('131', 787);
insert into REOPRTEV (teid, debid)
values ('136', 836);
insert into REOPRTEV (teid, debid)
values ('137', 649);
insert into REOPRTEV (teid, debid)
values ('139', 678);
insert into REOPRTEV (teid, debid)
values ('140', 615);
insert into REOPRTEV (teid, debid)
values ('140', 618);
insert into REOPRTEV (teid, debid)
values ('140', 637);
insert into REOPRTEV (teid, debid)
values ('140', 836);
insert into REOPRTEV (teid, debid)
values ('141', 832);
insert into REOPRTEV (teid, debid)
values ('144', 778);
insert into REOPRTEV (teid, debid)
values ('145', 732);
insert into REOPRTEV (teid, debid)
values ('145', 823);
insert into REOPRTEV (teid, debid)
values ('145', 869);
insert into REOPRTEV (teid, debid)
values ('146', 794);
insert into REOPRTEV (teid, debid)
values ('146', 980);
insert into REOPRTEV (teid, debid)
values ('151', 744);
insert into REOPRTEV (teid, debid)
values ('151', 974);
insert into REOPRTEV (teid, debid)
values ('152', 971);
insert into REOPRTEV (teid, debid)
values ('153', 618);
insert into REOPRTEV (teid, debid)
values ('153', 708);
insert into REOPRTEV (teid, debid)
values ('153', 712);
insert into REOPRTEV (teid, debid)
values ('153', 780);
insert into REOPRTEV (teid, debid)
values ('153', 901);
insert into REOPRTEV (teid, debid)
values ('156', 821);
insert into REOPRTEV (teid, debid)
values ('156', 834);
insert into REOPRTEV (teid, debid)
values ('156', 848);
insert into REOPRTEV (teid, debid)
values ('156', 988);
insert into REOPRTEV (teid, debid)
values ('157', 780);
insert into REOPRTEV (teid, debid)
values ('159', 596);
insert into REOPRTEV (teid, debid)
values ('159', 759);
insert into REOPRTEV (teid, debid)
values ('159', 971);
insert into REOPRTEV (teid, debid)
values ('16', 882);
insert into REOPRTEV (teid, debid)
values ('160', 768);
insert into REOPRTEV (teid, debid)
values ('160', 862);
insert into REOPRTEV (teid, debid)
values ('160', 918);
insert into REOPRTEV (teid, debid)
values ('160', 962);
insert into REOPRTEV (teid, debid)
values ('163', 681);
insert into REOPRTEV (teid, debid)
values ('163', 769);
insert into REOPRTEV (teid, debid)
values ('163', 856);
insert into REOPRTEV (teid, debid)
values ('166', 599);
insert into REOPRTEV (teid, debid)
values ('166', 634);
insert into REOPRTEV (teid, debid)
values ('167', 722);
insert into REOPRTEV (teid, debid)
values ('169', 923);
insert into REOPRTEV (teid, debid)
values ('172', 938);
insert into REOPRTEV (teid, debid)
values ('177', 657);
insert into REOPRTEV (teid, debid)
values ('177', 664);
insert into REOPRTEV (teid, debid)
values ('181', 905);
insert into REOPRTEV (teid, debid)
values ('182', 667);
insert into REOPRTEV (teid, debid)
values ('182', 840);
insert into REOPRTEV (teid, debid)
values ('183', 674);
insert into REOPRTEV (teid, debid)
values ('183', 920);
insert into REOPRTEV (teid, debid)
values ('186', 890);
insert into REOPRTEV (teid, debid)
values ('191', 898);
insert into REOPRTEV (teid, debid)
values ('193', 628);
insert into REOPRTEV (teid, debid)
values ('193', 706);
insert into REOPRTEV (teid, debid)
values ('193', 745);
insert into REOPRTEV (teid, debid)
values ('193', 846);
insert into REOPRTEV (teid, debid)
values ('195', 811);
insert into REOPRTEV (teid, debid)
values ('195', 953);
insert into REOPRTEV (teid, debid)
values ('196', 879);
insert into REOPRTEV (teid, debid)
values ('2', 807);
insert into REOPRTEV (teid, debid)
values ('20', 956);
insert into REOPRTEV (teid, debid)
values ('204', 721);
commit;
prompt 100 records committed...
insert into REOPRTEV (teid, debid)
values ('204', 861);
insert into REOPRTEV (teid, debid)
values ('205', 950);
insert into REOPRTEV (teid, debid)
values ('206', 912);
insert into REOPRTEV (teid, debid)
values ('206', 986);
insert into REOPRTEV (teid, debid)
values ('208', 819);
insert into REOPRTEV (teid, debid)
values ('208', 919);
insert into REOPRTEV (teid, debid)
values ('209', 609);
insert into REOPRTEV (teid, debid)
values ('210', 688);
insert into REOPRTEV (teid, debid)
values ('210', 742);
insert into REOPRTEV (teid, debid)
values ('213', 647);
insert into REOPRTEV (teid, debid)
values ('213', 798);
insert into REOPRTEV (teid, debid)
values ('214', 660);
insert into REOPRTEV (teid, debid)
values ('215', 725);
insert into REOPRTEV (teid, debid)
values ('215', 817);
insert into REOPRTEV (teid, debid)
values ('215', 881);
insert into REOPRTEV (teid, debid)
values ('216', 878);
insert into REOPRTEV (teid, debid)
values ('219', 900);
insert into REOPRTEV (teid, debid)
values ('219', 907);
insert into REOPRTEV (teid, debid)
values ('22', 769);
insert into REOPRTEV (teid, debid)
values ('220', 646);
insert into REOPRTEV (teid, debid)
values ('220', 714);
insert into REOPRTEV (teid, debid)
values ('221', 692);
insert into REOPRTEV (teid, debid)
values ('221', 932);
insert into REOPRTEV (teid, debid)
values ('222', 781);
insert into REOPRTEV (teid, debid)
values ('222', 841);
insert into REOPRTEV (teid, debid)
values ('223', 747);
insert into REOPRTEV (teid, debid)
values ('227', 603);
insert into REOPRTEV (teid, debid)
values ('227', 651);
insert into REOPRTEV (teid, debid)
values ('227', 692);
insert into REOPRTEV (teid, debid)
values ('227', 785);
insert into REOPRTEV (teid, debid)
values ('228', 623);
insert into REOPRTEV (teid, debid)
values ('228', 897);
insert into REOPRTEV (teid, debid)
values ('229', 773);
insert into REOPRTEV (teid, debid)
values ('230', 771);
insert into REOPRTEV (teid, debid)
values ('232', 685);
insert into REOPRTEV (teid, debid)
values ('232', 826);
insert into REOPRTEV (teid, debid)
values ('232', 858);
insert into REOPRTEV (teid, debid)
values ('232', 909);
insert into REOPRTEV (teid, debid)
values ('235', 876);
insert into REOPRTEV (teid, debid)
values ('235', 983);
insert into REOPRTEV (teid, debid)
values ('237', 769);
insert into REOPRTEV (teid, debid)
values ('24', 725);
insert into REOPRTEV (teid, debid)
values ('24', 925);
insert into REOPRTEV (teid, debid)
values ('240', 641);
insert into REOPRTEV (teid, debid)
values ('240', 840);
insert into REOPRTEV (teid, debid)
values ('243', 974);
insert into REOPRTEV (teid, debid)
values ('247', 837);
insert into REOPRTEV (teid, debid)
values ('247', 906);
insert into REOPRTEV (teid, debid)
values ('247', 951);
insert into REOPRTEV (teid, debid)
values ('247', 985);
insert into REOPRTEV (teid, debid)
values ('248', 782);
insert into REOPRTEV (teid, debid)
values ('249', 779);
insert into REOPRTEV (teid, debid)
values ('25', 642);
insert into REOPRTEV (teid, debid)
values ('25', 741);
insert into REOPRTEV (teid, debid)
values ('25', 835);
insert into REOPRTEV (teid, debid)
values ('25', 904);
insert into REOPRTEV (teid, debid)
values ('250', 887);
insert into REOPRTEV (teid, debid)
values ('252', 596);
insert into REOPRTEV (teid, debid)
values ('252', 608);
insert into REOPRTEV (teid, debid)
values ('254', 627);
insert into REOPRTEV (teid, debid)
values ('254', 657);
insert into REOPRTEV (teid, debid)
values ('254', 779);
insert into REOPRTEV (teid, debid)
values ('255', 787);
insert into REOPRTEV (teid, debid)
values ('255', 814);
insert into REOPRTEV (teid, debid)
values ('256', 967);
insert into REOPRTEV (teid, debid)
values ('259', 631);
insert into REOPRTEV (teid, debid)
values ('259', 691);
insert into REOPRTEV (teid, debid)
values ('259', 865);
insert into REOPRTEV (teid, debid)
values ('26', 711);
insert into REOPRTEV (teid, debid)
values ('26', 876);
insert into REOPRTEV (teid, debid)
values ('260', 948);
insert into REOPRTEV (teid, debid)
values ('263', 827);
insert into REOPRTEV (teid, debid)
values ('266', 598);
insert into REOPRTEV (teid, debid)
values ('266', 624);
insert into REOPRTEV (teid, debid)
values ('269', 758);
insert into REOPRTEV (teid, debid)
values ('270', 885);
insert into REOPRTEV (teid, debid)
values ('273', 695);
insert into REOPRTEV (teid, debid)
values ('273', 773);
insert into REOPRTEV (teid, debid)
values ('274', 772);
insert into REOPRTEV (teid, debid)
values ('275', 888);
insert into REOPRTEV (teid, debid)
values ('277', 880);
insert into REOPRTEV (teid, debid)
values ('278', 738);
insert into REOPRTEV (teid, debid)
values ('278', 822);
insert into REOPRTEV (teid, debid)
values ('28', 870);
insert into REOPRTEV (teid, debid)
values ('28', 962);
insert into REOPRTEV (teid, debid)
values ('28', 979);
insert into REOPRTEV (teid, debid)
values ('282', 614);
insert into REOPRTEV (teid, debid)
values ('282', 656);
insert into REOPRTEV (teid, debid)
values ('282', 862);
insert into REOPRTEV (teid, debid)
values ('283', 638);
insert into REOPRTEV (teid, debid)
values ('283', 881);
insert into REOPRTEV (teid, debid)
values ('283', 919);
insert into REOPRTEV (teid, debid)
values ('284', 755);
insert into REOPRTEV (teid, debid)
values ('284', 878);
insert into REOPRTEV (teid, debid)
values ('285', 886);
insert into REOPRTEV (teid, debid)
values ('285', 980);
insert into REOPRTEV (teid, debid)
values ('29', 706);
insert into REOPRTEV (teid, debid)
values ('29', 767);
insert into REOPRTEV (teid, debid)
values ('29', 941);
insert into REOPRTEV (teid, debid)
values ('29', 984);
commit;
prompt 200 records committed...
insert into REOPRTEV (teid, debid)
values ('291', 651);
insert into REOPRTEV (teid, debid)
values ('291', 657);
insert into REOPRTEV (teid, debid)
values ('291', 678);
insert into REOPRTEV (teid, debid)
values ('292', 691);
insert into REOPRTEV (teid, debid)
values ('298', 694);
insert into REOPRTEV (teid, debid)
values ('298', 695);
insert into REOPRTEV (teid, debid)
values ('299', 717);
insert into REOPRTEV (teid, debid)
values ('299', 944);
insert into REOPRTEV (teid, debid)
values ('300', 592);
insert into REOPRTEV (teid, debid)
values ('301', 603);
insert into REOPRTEV (teid, debid)
values ('305', 711);
insert into REOPRTEV (teid, debid)
values ('309', 708);
insert into REOPRTEV (teid, debid)
values ('309', 849);
insert into REOPRTEV (teid, debid)
values ('312', 912);
insert into REOPRTEV (teid, debid)
values ('316', 795);
insert into REOPRTEV (teid, debid)
values ('317', 674);
insert into REOPRTEV (teid, debid)
values ('317', 828);
insert into REOPRTEV (teid, debid)
values ('318', 598);
insert into REOPRTEV (teid, debid)
values ('318', 861);
insert into REOPRTEV (teid, debid)
values ('318', 888);
insert into REOPRTEV (teid, debid)
values ('319', 926);
insert into REOPRTEV (teid, debid)
values ('32', 762);
insert into REOPRTEV (teid, debid)
values ('32', 887);
insert into REOPRTEV (teid, debid)
values ('32', 924);
insert into REOPRTEV (teid, debid)
values ('321', 613);
insert into REOPRTEV (teid, debid)
values ('321', 850);
insert into REOPRTEV (teid, debid)
values ('322', 596);
insert into REOPRTEV (teid, debid)
values ('322', 709);
insert into REOPRTEV (teid, debid)
values ('324', 681);
insert into REOPRTEV (teid, debid)
values ('324', 865);
insert into REOPRTEV (teid, debid)
values ('325', 706);
insert into REOPRTEV (teid, debid)
values ('325', 743);
insert into REOPRTEV (teid, debid)
values ('327', 615);
insert into REOPRTEV (teid, debid)
values ('327', 878);
insert into REOPRTEV (teid, debid)
values ('328', 887);
insert into REOPRTEV (teid, debid)
values ('329', 877);
insert into REOPRTEV (teid, debid)
values ('330', 638);
insert into REOPRTEV (teid, debid)
values ('330', 811);
insert into REOPRTEV (teid, debid)
values ('331', 787);
insert into REOPRTEV (teid, debid)
values ('331', 826);
insert into REOPRTEV (teid, debid)
values ('332', 621);
insert into REOPRTEV (teid, debid)
values ('332', 899);
insert into REOPRTEV (teid, debid)
values ('332', 963);
insert into REOPRTEV (teid, debid)
values ('333', 783);
insert into REOPRTEV (teid, debid)
values ('333', 818);
insert into REOPRTEV (teid, debid)
values ('333', 875);
insert into REOPRTEV (teid, debid)
values ('333', 935);
insert into REOPRTEV (teid, debid)
values ('336', 699);
insert into REOPRTEV (teid, debid)
values ('337', 860);
insert into REOPRTEV (teid, debid)
values ('34', 712);
insert into REOPRTEV (teid, debid)
values ('34', 746);
insert into REOPRTEV (teid, debid)
values ('340', 627);
insert into REOPRTEV (teid, debid)
values ('340', 940);
insert into REOPRTEV (teid, debid)
values ('341', 898);
insert into REOPRTEV (teid, debid)
values ('341', 917);
insert into REOPRTEV (teid, debid)
values ('342', 640);
insert into REOPRTEV (teid, debid)
values ('346', 643);
insert into REOPRTEV (teid, debid)
values ('346', 799);
insert into REOPRTEV (teid, debid)
values ('346', 838);
insert into REOPRTEV (teid, debid)
values ('347', 688);
insert into REOPRTEV (teid, debid)
values ('347', 942);
insert into REOPRTEV (teid, debid)
values ('348', 738);
insert into REOPRTEV (teid, debid)
values ('348', 765);
insert into REOPRTEV (teid, debid)
values ('348', 817);
insert into REOPRTEV (teid, debid)
values ('35', 622);
insert into REOPRTEV (teid, debid)
values ('35', 812);
insert into REOPRTEV (teid, debid)
values ('350', 690);
insert into REOPRTEV (teid, debid)
values ('351', 592);
insert into REOPRTEV (teid, debid)
values ('351', 690);
insert into REOPRTEV (teid, debid)
values ('351', 718);
insert into REOPRTEV (teid, debid)
values ('351', 792);
insert into REOPRTEV (teid, debid)
values ('351', 886);
insert into REOPRTEV (teid, debid)
values ('352', 903);
insert into REOPRTEV (teid, debid)
values ('354', 926);
insert into REOPRTEV (teid, debid)
values ('363', 687);
insert into REOPRTEV (teid, debid)
values ('363', 951);
insert into REOPRTEV (teid, debid)
values ('365', 610);
insert into REOPRTEV (teid, debid)
values ('365', 733);
insert into REOPRTEV (teid, debid)
values ('366', 708);
insert into REOPRTEV (teid, debid)
values ('366', 869);
insert into REOPRTEV (teid, debid)
values ('366', 980);
insert into REOPRTEV (teid, debid)
values ('367', 868);
insert into REOPRTEV (teid, debid)
values ('368', 933);
insert into REOPRTEV (teid, debid)
values ('369', 702);
insert into REOPRTEV (teid, debid)
values ('369', 803);
insert into REOPRTEV (teid, debid)
values ('369', 902);
insert into REOPRTEV (teid, debid)
values ('370', 944);
insert into REOPRTEV (teid, debid)
values ('371', 761);
insert into REOPRTEV (teid, debid)
values ('373', 691);
insert into REOPRTEV (teid, debid)
values ('375', 737);
insert into REOPRTEV (teid, debid)
values ('375', 772);
insert into REOPRTEV (teid, debid)
values ('379', 628);
insert into REOPRTEV (teid, debid)
values ('379', 659);
insert into REOPRTEV (teid, debid)
values ('379', 966);
insert into REOPRTEV (teid, debid)
values ('38', 633);
insert into REOPRTEV (teid, debid)
values ('38', 706);
insert into REOPRTEV (teid, debid)
values ('38', 709);
insert into REOPRTEV (teid, debid)
values ('38', 778);
insert into REOPRTEV (teid, debid)
values ('380', 674);
insert into REOPRTEV (teid, debid)
values ('383', 683);
commit;
prompt 300 records committed...
insert into REOPRTEV (teid, debid)
values ('383', 718);
insert into REOPRTEV (teid, debid)
values ('383', 776);
insert into REOPRTEV (teid, debid)
values ('383', 946);
insert into REOPRTEV (teid, debid)
values ('384', 805);
insert into REOPRTEV (teid, debid)
values ('384', 937);
insert into REOPRTEV (teid, debid)
values ('4', 653);
insert into REOPRTEV (teid, debid)
values ('4', 658);
insert into REOPRTEV (teid, debid)
values ('4', 691);
insert into REOPRTEV (teid, debid)
values ('4', 955);
insert into REOPRTEV (teid, debid)
values ('40', 726);
insert into REOPRTEV (teid, debid)
values ('40', 729);
insert into REOPRTEV (teid, debid)
values ('40', 800);
insert into REOPRTEV (teid, debid)
values ('42', 626);
insert into REOPRTEV (teid, debid)
values ('43', 643);
insert into REOPRTEV (teid, debid)
values ('45', 667);
insert into REOPRTEV (teid, debid)
values ('45', 735);
insert into REOPRTEV (teid, debid)
values ('45', 876);
insert into REOPRTEV (teid, debid)
values ('49', 955);
insert into REOPRTEV (teid, debid)
values ('50', 726);
insert into REOPRTEV (teid, debid)
values ('50', 878);
insert into REOPRTEV (teid, debid)
values ('51', 755);
insert into REOPRTEV (teid, debid)
values ('54', 639);
insert into REOPRTEV (teid, debid)
values ('54', 853);
insert into REOPRTEV (teid, debid)
values ('54', 866);
insert into REOPRTEV (teid, debid)
values ('56', 928);
insert into REOPRTEV (teid, debid)
values ('57', 882);
insert into REOPRTEV (teid, debid)
values ('58', 690);
insert into REOPRTEV (teid, debid)
values ('58', 956);
insert into REOPRTEV (teid, debid)
values ('6', 783);
insert into REOPRTEV (teid, debid)
values ('6', 810);
insert into REOPRTEV (teid, debid)
values ('6', 952);
insert into REOPRTEV (teid, debid)
values ('60', 711);
insert into REOPRTEV (teid, debid)
values ('62', 897);
insert into REOPRTEV (teid, debid)
values ('63', 763);
insert into REOPRTEV (teid, debid)
values ('63', 819);
insert into REOPRTEV (teid, debid)
values ('63', 924);
insert into REOPRTEV (teid, debid)
values ('65', 682);
insert into REOPRTEV (teid, debid)
values ('66', 719);
insert into REOPRTEV (teid, debid)
values ('66', 747);
insert into REOPRTEV (teid, debid)
values ('67', 608);
insert into REOPRTEV (teid, debid)
values ('67', 669);
insert into REOPRTEV (teid, debid)
values ('67', 781);
insert into REOPRTEV (teid, debid)
values ('67', 815);
insert into REOPRTEV (teid, debid)
values ('67', 957);
insert into REOPRTEV (teid, debid)
values ('68', 813);
insert into REOPRTEV (teid, debid)
values ('71', 670);
insert into REOPRTEV (teid, debid)
values ('71', 903);
insert into REOPRTEV (teid, debid)
values ('74', 693);
insert into REOPRTEV (teid, debid)
values ('74', 822);
insert into REOPRTEV (teid, debid)
values ('74', 838);
insert into REOPRTEV (teid, debid)
values ('74', 951);
insert into REOPRTEV (teid, debid)
values ('78', 623);
insert into REOPRTEV (teid, debid)
values ('78', 711);
insert into REOPRTEV (teid, debid)
values ('79', 766);
insert into REOPRTEV (teid, debid)
values ('79', 957);
insert into REOPRTEV (teid, debid)
values ('81', 751);
insert into REOPRTEV (teid, debid)
values ('81', 955);
insert into REOPRTEV (teid, debid)
values ('82', 626);
insert into REOPRTEV (teid, debid)
values ('82', 852);
insert into REOPRTEV (teid, debid)
values ('85', 623);
insert into REOPRTEV (teid, debid)
values ('85', 651);
insert into REOPRTEV (teid, debid)
values ('85', 896);
insert into REOPRTEV (teid, debid)
values ('87', 611);
insert into REOPRTEV (teid, debid)
values ('87', 920);
insert into REOPRTEV (teid, debid)
values ('87', 985);
insert into REOPRTEV (teid, debid)
values ('89', 683);
insert into REOPRTEV (teid, debid)
values ('89', 975);
insert into REOPRTEV (teid, debid)
values ('91', 633);
insert into REOPRTEV (teid, debid)
values ('91', 806);
insert into REOPRTEV (teid, debid)
values ('91', 812);
insert into REOPRTEV (teid, debid)
values ('91', 871);
insert into REOPRTEV (teid, debid)
values ('92', 877);
insert into REOPRTEV (teid, debid)
values ('93', 613);
insert into REOPRTEV (teid, debid)
values ('94', 674);
insert into REOPRTEV (teid, debid)
values ('95', 773);
insert into REOPRTEV (teid, debid)
values ('96', 729);
insert into REOPRTEV (teid, debid)
values ('96', 878);
insert into REOPRTEV (teid, debid)
values ('99', 728);
insert into REOPRTEV (teid, debid)
values ('99', 795);
insert into REOPRTEV (teid, debid)
values ('99', 827);
commit;
prompt 380 records loaded
prompt Loading TAKINGPART...
insert into TAKINGPART (boid, emdrid)
values (890, 1);
insert into TAKINGPART (boid, emdrid)
values (890, 2);
insert into TAKINGPART (boid, emdrid)
values (890, 3);
insert into TAKINGPART (boid, emdrid)
values (890, 10);
insert into TAKINGPART (boid, emdrid)
values (891, 1);
insert into TAKINGPART (boid, emdrid)
values (891, 4);
insert into TAKINGPART (boid, emdrid)
values (891, 16);
insert into TAKINGPART (boid, emdrid)
values (892, 1);
insert into TAKINGPART (boid, emdrid)
values (892, 2);
insert into TAKINGPART (boid, emdrid)
values (892, 4);
insert into TAKINGPART (boid, emdrid)
values (892, 10);
insert into TAKINGPART (boid, emdrid)
values (893, 1);
insert into TAKINGPART (boid, emdrid)
values (893, 4);
insert into TAKINGPART (boid, emdrid)
values (893, 10);
insert into TAKINGPART (boid, emdrid)
values (895, 16);
insert into TAKINGPART (boid, emdrid)
values (896, 2);
insert into TAKINGPART (boid, emdrid)
values (896, 16);
insert into TAKINGPART (boid, emdrid)
values (897, 1);
insert into TAKINGPART (boid, emdrid)
values (897, 2);
insert into TAKINGPART (boid, emdrid)
values (897, 3);
insert into TAKINGPART (boid, emdrid)
values (897, 10);
insert into TAKINGPART (boid, emdrid)
values (898, 1);
insert into TAKINGPART (boid, emdrid)
values (898, 2);
insert into TAKINGPART (boid, emdrid)
values (898, 4);
insert into TAKINGPART (boid, emdrid)
values (898, 10);
insert into TAKINGPART (boid, emdrid)
values (898, 16);
insert into TAKINGPART (boid, emdrid)
values (899, 3);
insert into TAKINGPART (boid, emdrid)
values (899, 16);
insert into TAKINGPART (boid, emdrid)
values (900, 1);
insert into TAKINGPART (boid, emdrid)
values (900, 2);
insert into TAKINGPART (boid, emdrid)
values (900, 3);
insert into TAKINGPART (boid, emdrid)
values (901, 4);
insert into TAKINGPART (boid, emdrid)
values (901, 10);
insert into TAKINGPART (boid, emdrid)
values (901, 16);
insert into TAKINGPART (boid, emdrid)
values (902, 1);
insert into TAKINGPART (boid, emdrid)
values (902, 4);
insert into TAKINGPART (boid, emdrid)
values (903, 3);
insert into TAKINGPART (boid, emdrid)
values (903, 4);
insert into TAKINGPART (boid, emdrid)
values (903, 16);
insert into TAKINGPART (boid, emdrid)
values (904, 3);
insert into TAKINGPART (boid, emdrid)
values (904, 4);
insert into TAKINGPART (boid, emdrid)
values (905, 2);
insert into TAKINGPART (boid, emdrid)
values (905, 3);
insert into TAKINGPART (boid, emdrid)
values (905, 4);
insert into TAKINGPART (boid, emdrid)
values (905, 10);
insert into TAKINGPART (boid, emdrid)
values (905, 16);
insert into TAKINGPART (boid, emdrid)
values (906, 1);
insert into TAKINGPART (boid, emdrid)
values (906, 2);
insert into TAKINGPART (boid, emdrid)
values (906, 3);
insert into TAKINGPART (boid, emdrid)
values (906, 4);
insert into TAKINGPART (boid, emdrid)
values (906, 16);
insert into TAKINGPART (boid, emdrid)
values (907, 2);
insert into TAKINGPART (boid, emdrid)
values (907, 3);
insert into TAKINGPART (boid, emdrid)
values (907, 4);
insert into TAKINGPART (boid, emdrid)
values (907, 16);
insert into TAKINGPART (boid, emdrid)
values (908, 2);
insert into TAKINGPART (boid, emdrid)
values (908, 4);
insert into TAKINGPART (boid, emdrid)
values (908, 10);
commit;
prompt 58 records loaded
prompt Enabling foreign key constraints for PARAMEDIC...
alter table PARAMEDIC enable constraint SYS_C0012654;
prompt Enabling foreign key constraints for SHIFT...
alter table SHIFT enable constraint SYS_C0012661;
prompt Enabling foreign key constraints for OUREVENT...
alter table OUREVENT enable constraint SYS_C0012668;
prompt Enabling foreign key constraints for ACTIN...
alter table ACTIN enable constraint FK_ACTIN_VOLUNTEER;
alter table ACTIN enable constraint FK_OUR_EVENT_ID;
prompt Enabling foreign key constraints for AMBUTOEVENT...
alter table AMBUTOEVENT enable constraint SYS_C0012672;
alter table AMBUTOEVENT enable constraint SYS_C0012673;
prompt Enabling foreign key constraints for DRIVER...
alter table DRIVER enable constraint SYS_C0012677;
prompt Enabling foreign key constraints for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable constraint SYS_C0012681;
alter table DRIVERINSHIFT enable constraint SYS_C0012682;
prompt Enabling foreign key constraints for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable constraint SYS_C0012686;
alter table DRIVERTOAMBU enable constraint SYS_C0012687;
prompt Enabling foreign key constraints for EMERGENBODIES...
alter table EMERGENBODIES enable constraint FK_OUR_EVENT_IDD;
prompt Enabling foreign key constraints for MEDIC...
alter table MEDIC enable constraint SYS_C0012691;
prompt Enabling foreign key constraints for EMERGENCYDRILL...
alter table EMERGENCYDRILL enable constraint FK_EMERGENCYDRILL_DRIVER;
alter table EMERGENCYDRILL enable constraint FK_EMERGENCYDRILL_MEDIC;
alter table EMERGENCYDRILL enable constraint FK_EMERGENCYDRILL_PARMEDIC;
prompt Enabling foreign key constraints for MADICINSHIFT...
alter table MADICINSHIFT enable constraint SYS_C0012695;
alter table MADICINSHIFT enable constraint SYS_C0012696;
prompt Enabling foreign key constraints for PRACTICING...
alter table PRACTICING enable constraint FK_PRACTICING_VOLUNTEER;
alter table PRACTICING enable constraint SYS_C0012743;
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint FK_WORKER_VOLUNTEER;
prompt Enabling foreign key constraints for REOPRTEV...
alter table REOPRTEV enable constraint SYS_C0012752;
alter table REOPRTEV enable constraint SYS_C0012753;
prompt Enabling foreign key constraints for TAKINGPART...
alter table TAKINGPART enable constraint SYS_C0012757;
alter table TAKINGPART enable constraint SYS_C0012758;
prompt Enabling triggers for VOLUNTEER...
alter table VOLUNTEER enable all triggers;
prompt Enabling triggers for PARAMEDIC...
alter table PARAMEDIC enable all triggers;
prompt Enabling triggers for SHIFT...
alter table SHIFT enable all triggers;
prompt Enabling triggers for OUREVENT...
alter table OUREVENT enable all triggers;
prompt Enabling triggers for ACTIN...
alter table ACTIN enable all triggers;
prompt Enabling triggers for AMBULANS...
alter table AMBULANS enable all triggers;
prompt Enabling triggers for AMBUTOEVENT...
alter table AMBUTOEVENT enable all triggers;
prompt Enabling triggers for DRIVER...
alter table DRIVER enable all triggers;
prompt Enabling triggers for DRIVERINSHIFT...
alter table DRIVERINSHIFT enable all triggers;
prompt Enabling triggers for DRIVERTOAMBU...
alter table DRIVERTOAMBU enable all triggers;
prompt Enabling triggers for EMERGENBODIES...
alter table EMERGENBODIES enable all triggers;
prompt Enabling triggers for MEDIC...
alter table MEDIC enable all triggers;
prompt Enabling triggers for EMERGENCYDRILL...
alter table EMERGENCYDRILL enable all triggers;
prompt Enabling triggers for EVDEBRIEFING...
alter table EVDEBRIEFING enable all triggers;
prompt Enabling triggers for MADICINSHIFT...
alter table MADICINSHIFT enable all triggers;
prompt Enabling triggers for PRACTICING...
alter table PRACTICING enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for REOPRTEV...
alter table REOPRTEV enable all triggers;
prompt Enabling triggers for TAKINGPART...
alter table TAKINGPART enable all triggers;
set feedback on
set define on
prompt Done.
