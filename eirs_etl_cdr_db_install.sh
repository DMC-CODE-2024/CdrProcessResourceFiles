#!/bin/bash
. ~/.bash_profile

source ${commonConfigurationFile} 2>/dev/null

dbPassword=$(java -jar  ${pass_dypt} spring.datasource.password)

conn="mysql -h${dbIp} -P${dbPort} -u${dbUsername} -p${dbPassword} ${appdbName}"

`${conn} <<EOFMYSQL

 CREATE TABLE  if not exists active_unique_imei (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  foregin_rule varchar(50) DEFAULT '',
  tac varchar(8) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  failed_rule_id int DEFAULT '0',
  failed_rule_name varchar(50) DEFAULT '',
  imsi varchar(20) DEFAULT '',
  mobile_operator varchar(20) DEFAULT '',
  create_filename varchar(100) DEFAULT '',
  update_filename varchar(100) DEFAULT '',
  updated_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  system_type varchar(50) DEFAULT '',
  action varchar(50) DEFAULT '',
  period varchar(50) DEFAULT '',
  failed_rule_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  mobile_operator_id int DEFAULT '0',
  tax_paid int DEFAULT '0',
  feature_name varchar(50) DEFAULT '',
  record_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actual_imei varchar(50) DEFAULT '',
  record_type varchar(50) DEFAULT '',
  imei varchar(20) DEFAULT '',
  raw_cdr_file_name varchar(100) DEFAULT '',
  imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  source varchar(20) DEFAULT '',
  update_raw_cdr_file_name varchar(100) DEFAULT '',
  update_imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  update_source varchar(20) DEFAULT '',
  server_origin varchar(255) DEFAULT '',
  actual_operator varchar(20) DEFAULT '',
  is_test_imei int DEFAULT '0',
  is_used int DEFAULT '0',
  foreign_rule varchar(50) DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE KEY UNQ_DB_IMEI_UNI (imei),
  KEY INX_createdt (created_on),
  KEY INX_imei (imei),
  KEY DVCUSGTACI_NDX (tac),
  KEY ACTUALIMEI_INDEX (actual_imei),
  KEY InXun_imsi (imsi)
) ;

CREATE TABLE  if not exists active_unique_foreign_imei (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  foregin_rule varchar(50) DEFAULT '',
  tac varchar(8) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  failed_rule_id int DEFAULT '0',
  failed_rule_name varchar(50) DEFAULT '',
  imsi varchar(20) DEFAULT '',
  mobile_operator varchar(20) DEFAULT '',
  create_filename varchar(100) DEFAULT '',
  update_filename varchar(100) DEFAULT '',
  updated_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  system_type varchar(50) DEFAULT '',
  action varchar(50) DEFAULT '',
  period varchar(50) DEFAULT '',
  failed_rule_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  mobile_operator_id int DEFAULT '0',
  tax_paid int DEFAULT '0',
  feature_name varchar(50) DEFAULT '',
  record_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actual_imei varchar(50) DEFAULT '',
  record_type varchar(50) DEFAULT '',
  imei varchar(20) DEFAULT '',
  raw_cdr_file_name varchar(100) DEFAULT '',
  imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  source varchar(20) DEFAULT '',
  update_raw_cdr_file_name varchar(100) DEFAULT '',
  update_imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  update_source varchar(20) DEFAULT '',
  server_origin varchar(25) DEFAULT '',
  actual_operator varchar(20) DEFAULT '',
  is_test_imei int DEFAULT '0',
  is_used int DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY UNQ_FRN_IDX_IMEI (imei),
  KEY imei (imei),
  KEY FOREIGNUNIQUEACTUALIMEIINDEX (actual_imei)
);

 CREATE TABLE  if not exists active_imei_with_different_msisdn (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  tac varchar(8) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  failed_rule_id int DEFAULT '0',
  failed_rule_name varchar(50) DEFAULT '',
  imsi varchar(20) DEFAULT '',
  mobile_operator varchar(20) DEFAULT '',
  create_filename varchar(100) DEFAULT '',
  update_filename varchar(100) DEFAULT '',
  updated_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  system_type varchar(50) DEFAULT '',
  action varchar(50) DEFAULT '',
  period varchar(50) DEFAULT '',
  failed_rule_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  mobile_operator_id int DEFAULT '0',
  tax_paid int DEFAULT '0',
  feature_name varchar(50) DEFAULT '',
  record_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actual_imei varchar(20) DEFAULT '',
  record_type varchar(50) DEFAULT '',
  imei varchar(20) DEFAULT '',
  raw_cdr_file_name varchar(100) DEFAULT '',
  imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  source varchar(20) DEFAULT '',
  update_raw_cdr_file_name varchar(100) DEFAULT '',
  update_imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  update_source varchar(20) DEFAULT '',
  server_origin varchar(255) DEFAULT '',
  actual_operator varchar(20) DEFAULT '',
  is_test_imei int DEFAULT '0',
  is_used int DEFAULT '0',
  PRIMARY KEY (id),
  KEY INX_createdt (created_on),
  KEY ACTUALIMEIINDEXDUPDB (actual_imei),
  KEY DEVICE_DUPLICATE_DB_IMEI (imei),
  KEY aiwdm_msisdn (msisdn),
  KEY DVCDUPTACINDX (tac),
  KEY UNQ_IDX_DPLCT (imei,msisdn)
) ;

 CREATE TABLE  if not exists active_foreign_imei_with_different_msisdn (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  tac varchar(8) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  failed_rule_id int DEFAULT '0',
  failed_rule_name varchar(50) DEFAULT '',
  imsi varchar(20) DEFAULT '',
  mobile_operator varchar(20) DEFAULT '',
  create_filename varchar(100) DEFAULT '',
  update_filename varchar(100) DEFAULT '',
  updated_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  system_type varchar(50) DEFAULT '',
  action varchar(50) DEFAULT '',
  period varchar(50) DEFAULT '',
  failed_rule_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  mobile_operator_id int DEFAULT '0',
  tax_paid int DEFAULT '0',
  feature_name varchar(50) DEFAULT '',
  record_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  actual_imei varchar(20) DEFAULT '',
  record_type varchar(50) DEFAULT '',
  imei varchar(20) DEFAULT '',
  raw_cdr_file_name varchar(100) DEFAULT '',
  imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  source varchar(20) DEFAULT '',
  update_raw_cdr_file_name varchar(100) DEFAULT '',
  update_imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  update_source varchar(20) DEFAULT '',
  server_origin varchar(255) DEFAULT '',
  actual_operator varchar(20) DEFAULT NULL,
  is_test_imei int DEFAULT '0',
  is_used int DEFAULT '0',
  PRIMARY KEY (id),
  KEY INX_createdt (created_on),
  KEY INX_ACTUAL_IMEI_DUPDB (actual_imei),
  KEY INX_DEVICE_DUP_DB_IMEI (imei),
  KEY INX_DIFF_MSISDN (msisdn),
  KEY INX_DUP_TAC (tac),
  KEY INX_IMEI_MSISDN (imei,msisdn)
);

CREATE TABLE  if not exists active_imei_with_same_msisdn_different_imsi (
  id int NOT NULL AUTO_INCREMENT,
  imei varchar(20) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  old_imsi varchar(20) DEFAULT '',
  old_imsi_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  new_imsi varchar(20) DEFAULT '',
  new_imsi_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  operator varchar(20) DEFAULT '',
  file_name varchar(60) DEFAULT '',
  db_table varchar(60) DEFAULT '',
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY INX_createdt (created_on)
);

 CREATE TABLE  if not exists active_foreign_imei_with_same_msisdn_different_imsi (
  id int NOT NULL AUTO_INCREMENT,
  imei varchar(20) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  old_imsi varchar(20) DEFAULT '',
  old_imsi_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  new_imsi varchar(20) DEFAULT '',
  new_imsi_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  operator varchar(20) DEFAULT '',
  file_name varchar(60) DEFAULT '',
  db_table varchar(60) DEFAULT '',
  created_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY INX_createdt (created_on)
) ;

 CREATE TABLE if not exists cdr_file_pre_processing_detail (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  file_type varchar(10) DEFAULT '',
  file_name varchar(100) DEFAULT '',
  total_records bigint DEFAULT '0',
  total_blacklist_record bigint DEFAULT '0',
  total_error_records bigint DEFAULT '0',
  total_duplicate_records bigint DEFAULT '0',
  total_output_records bigint DEFAULT '0',
  start_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  end_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  time_taken int DEFAULT '0',
  tps int DEFAULT '0',
  operator_name varchar(20) DEFAULT '',
  source_name varchar(20) DEFAULT '',
  volume int DEFAULT '0',
  tag varchar(20) DEFAULT '',
  file_count int DEFAULT '0',
  head_count int DEFAULT '0',
  servername varchar(50) DEFAULT '',
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

 CREATE TABLE if not exists cdr_file_processed_detail (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  starttime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  endtime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  file_name varchar(100) DEFAULT '',
  operator varchar(20) DEFAULT '',
  source varchar(20) DEFAULT '',
  total_error_record_count int DEFAULT '0',
  total_insert_in_dup_db int DEFAULT '0',
  total_insert_in_null_db int DEFAULT '0',
  total_inserts_in_usage_db int DEFAULT '0',
  total_updates_in_usage_db int DEFAULT '0',
  total_updates_in_dup_db int DEFAULT '0',
  total_update_in_null_db int DEFAULT '0',
  total_records_count int DEFAULT '0',
  sql_process_start_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  sql_process_end_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  total_query_sql int DEFAULT '0',
  total_update_sql int DEFAULT '0',
  raw_cdr_file_name varchar(100) DEFAULT '',
  foreignmsisdn int DEFAULT '0',
  status varchar(50) DEFAULT '',
  server_origin varchar(50) DEFAULT '',
  total_insert_in_foreigndup_db int DEFAULT '0',
  total_inserts_in_foreignusage_db int DEFAULT '0',
  total_updates_in_foreignusage_db int DEFAULT '0',
  total_updates_in_foreigndup_db int DEFAULT '0',
  PRIMARY KEY (id)
);

 CREATE TABLE if not exists invalid_imei (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  device_launch_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  device_id_type varchar(255) DEFAULT '',
  device_status varchar(255) DEFAULT '',
  device_type varchar(255) DEFAULT '',
  file_name varchar(255) DEFAULT '',
  imei_esn_meid varchar(255) DEFAULT '',
  multiple_sim_status varchar(255) DEFAULT '',
  operator_id int DEFAULT '0',
  operator_name varchar(255) DEFAULT '',
  operator_type varchar(20) DEFAULT '',
  record_date varchar(50) DEFAULT '',
  rule_name varchar(255) DEFAULT '',
  sn_of_device varchar(255) DEFAULT '',
  imsi varchar(20) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  PRIMARY KEY (id)
);

CREATE TABLE if not exists test_imei_details (
  id int NOT NULL AUTO_INCREMENT,
  created_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  modified_on timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  imei varchar(20) DEFAULT '',
  imsi varchar(20) DEFAULT '',
  msisdn varchar(20) DEFAULT '',
  record_type varchar(15) DEFAULT '',
  system_type varchar(15) DEFAULT '',
  source varchar(20) DEFAULT '',
  raw_cdr_file_name varchar(50) DEFAULT '',
  imei_arrival_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  operator varchar(20) DEFAULT '',
  file_name varchar(60) DEFAULT '',
  PRIMARY KEY (id)
);


insert ignore into app.sys_param ( tag , value , feature_name,type,active,remark,description,user_type,modified_by) values ('CDR_IMEI_LENGTH_CHECK','True','CDR',0,1,'','cdr imei length check flag','system','system');
insert ignore into app.sys_param ( tag , value , feature_name,type,active,remark,description,user_type,modified_by) values ('CDR_IMEI_LENGTH_VALUE','14,15,16','CDR',0,1,'','cdr length valid values ','system','system');
insert ignore into app.sys_param ( tag , value , feature_name,type,active,remark,description,user_type,modified_by) values ('CDR_NULL_IMEI_CHECK','True','CDR',0,1,'','cdr null imie check flag','system','system');
insert ignore into app.sys_param ( tag , value , feature_name,type,active,remark,description,user_type,modified_by) values ('CDR_ALPHANUMERIC_IMEI_CHECK','True','CDR',0,1,'','cdr alpha numeric check flag ','system','system');
insert ignore into app.sys_param ( tag , value , feature_name,type,active,remark,description,user_type,modified_by) values ('CDR_NULL_IMEI_REPLACE_PATTERN', '9999999999999999','CDR',0,1,'cdr null imei replacement pattern','','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SEATEL_ST_PGW_FILE_PATTERN','PGW_CDR-7-8','CDR',0,1,'','file pattern for seatel st_pgw','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_MSC15_FILE_PATTERN','HW_MSC15-9-8','CDR',0,1,'','file pattern for metfone MF_MSC15','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_MSC09_FILE_PATTERN','HW_MSC09-9-8','CDR',0,1,'','file pattern for metfone MF_MSC09','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_MSC10_FILE_PATTERN','HW_MSC10-9-8','CDR',0,1,'','file pattern for metfone MF_MSC10','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_MSC11_FILE_PATTERN','HW_MSC11-9-8','CDR',0,1,'','file pattern for metfone MF_MSC11','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_MSC14_FILE_PATTERN','HW_MSC14-9-8','CDR',0,1,'','file pattern for metfone MF_MSC14 ','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_MSC16_FILE_PATTERN','HW_MSC16-9-8','CDR',0,1,'','file pattern for metfone MF_MSC16','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_SGSN_FILE_PATTERN' , 'VTC-12-8,R9-8-8,CG-19-8','CDR',0,1,'','file pattern for metfone mf_sgsn ','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_GGSN_FILE_PATTERN','HCG1_LTE-16-6','CDR',0,1,'','file pattern for cellcard cc_cgsn','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_MSC02_FILE_PATTERN','HWCS-4-8','CDR',0,1,'','file pattern for cellcard cc_msc02','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_MSC03_FILE_PATTERN','HWCS-4-8','CDR',0,1,'','file pattern for cellcard cc_msc03','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZMSC71_FILE_PATTERN','ZMSC71-7-8','CDR',0,1,'','file pattern for cellcard cc_zmsc71','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZMSC72_FILE_PATTERN','ZMSC72-7-8','CDR',0,1,'','file pattern for cellcard cc_zmsc72','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZMSC73_FILE_PATTERN','ZMSC73-7-8','CDR',0,1,'','file pattern for cellcard cc_zmsc73','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_IMS01_FILE_PATTERN','TKKvIMSAP-10-8,HQvIMSAP-9-8','CDR',0,1,'','file pattern for smart SM_ims01','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_MSC01_FILE_PATTERN', 'BTKK-4-8,BTKKAP2-7-8,BTKKAP3-7-8,BTKKAP4-7-8','CDR',0,1,'','file pattern for smart SM_msc01','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_MSC02_FILE_PATTERN','MSC02-8-8','CDR',0,1,'','file pattern for smart SM_msc02','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_SCDR_FILE_PATTERN','TKK_AP-14-8,HQ_AP-13-8','CDR',0,1,'','file pattern for smart SM_SCDR','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_SGW_FILE_PATTERN','TKK_AP-16-8,HQ_AP-15-8','CDR',0,1,'','file pattern for smart SM_sgw','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_IMS02_FILE_PATTERN','TKKvIMSAP-10-8,HQvIMSAP-9-8','CDR',0,1,'','file pattern for smart SM_IMS02','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_IMS_FILE_PATTERN','SSSCG-16-8,SSS_CG-22-8,SSSCG-21-8','CDR',0,1,'','file pattern for cellcard cc_ims','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZPGW21_FILE_PATTERN','CG-21-8,VTC-14-8,R9-10-8,N1PNH01ZPGW21-14-8 ','CDR',0,1,'','file pattern for cellcard cc_zpgw21','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZPGW22_FILE_PATTERN','N1PNH01ZPGW22-14-8','CDR',0,1,'','file pattern for cellcard cc_zpgw22','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZPGW23_FILE_PATTERN','N1PNH01ZPGW23-14-8','CDR',0,1,'','file pattern for cellcard cc_zpgw23','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('CELLCARD_CC_ZPGW24_FILE_PATTERN','N1PNH01ZPGW24-14-8','CDR',0,1,'','file pattern for cellcard cc_zpgw24','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_SGW_FILE_PATTERN','CG-21-8,VTC-14-8,R9-10-8','CDR',0,1,'','file pattern for mf_sgw','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('METFONE_MF_IMS_FILE_PATTERN', 'IMPT01CF2_-10-8,IMPT01_-7-8,IMPT01CF5_-10-8,IMPT01CF4_-10-8','CDR',0,1,'file pattern for METFONE_MF_IMS ','','system','system');
insert ignore into app.sys_param (tag , value, feature_name,type,active,remark,description,user_type,modified_by) values ('SMART_SM_PGW_FILE_PATTERN','TKK_AP-16-8,HQ_AP-15-8','CDR',0,1,'','file pattern for smart smpggw ','system','system');
insert ignore into app.sys_param (tag,value,feature_name,type,active,remark,description,user_type,modified_by) values ('TEST_IMEI_SERIES ','001,0044','CDR',0,1,'','test imei series','system','system');
insert ignore into app.sys_param (tag,value,feature_name,type,active,remark,description,user_type,modified_by) values ('IS_USED_EXTENDED_DAYS','365','CDR',0,1,'','used device days count critieria','system','system');
insert ignore into app.sys_param (tag,value, feature_name,type,active,remark,description,user_type,modified_by) values ('enableForeignSimHandling','True','CDR',0,1,'','Foreign Sim Handling Flag','system','system');

EOFMYSQL`

echo "********************Thank You DB Process is completed now*****************"




