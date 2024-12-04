#!/bin/bash
set -x
conffile=/u01/eirsapp/configuration/configuration.properties

tar -xzvf etl_cdr_1.0.0.tar.gz >>etl_cdr_1.0.0_untar_log.txt
mkdir -p ${APP_HOME}/etl_cdr_module/

mv etl_cdr_1.0.0/etl_cdr_p1_p2/etl_cdr_p1_p2_1.0.0.jar ${RELEASE_HOME}/binary/

mv etl_cdr_1.0.0/etl_cdr_p3/etl_cdr_p3_1.0.0.jar ${RELEASE_HOME}/binary/

mv etl_cdr_1.0.0/*  ${APP_HOME}/etl_cdr_module/

cd ${APP_HOME}/etl_cdr_module/etl_cdr_p1_p2/
ln -sf ${RELEASE_HOME}/binary/etl_cdr_p1_p2_1.0.0.jar etl_cdr_p1_p2.jar
ln -sf ${RELEASE_HOME}/global_config/log4j2.xml log4j2.xml
chmod +x *.sh

cd ${APP_HOME}/etl_cdr_module/etl_cdr_p3/
ln -sf ${RELEASE_HOME}/binary/etl_cdr_p3_1.0.0.jar etl_cdr_p3.jar
ln -sf ${RELEASE_HOME}/global_config/log4j2.xml log4j2.xml
chmod +x *.sh

cd ${APP_HOME}/etl_cdr_module/
chmod +x *.sh 



base="${DATA_HOME}/etl_cdr_module/"
p1_path="etl_cdr_p1_p2"

for i in output ; do
  for j in seatel metfone cellcard smart; do
    tmp=""
    if [ "$j" == "seatel" ]; then
      tmp="st_pgw all_cdr"
    elif [ "$j" == "metfone" ]; then
      tmp="mf_msc09 mf_msc10 mf_msc11 mf_msc14 mf_msc15 mf_msc16 mf_sgsn mf_sgw mf_ims all_cdr"
    elif [ "$j" == "smart" ]; then
      tmp="sm_msc01 sm_msc02 sm_ims01 sm_scdr sm_sgw sm_ims02 sm_pgw all_cdr"      
    elif [ "$j" == "cellcard" ]; then
      tmp="cc_zmsc71 cc_zmsc72 cc_zmsc73 cc_msc02 cc_msc03 cc_ims cc_zpgw21 cc_zpgw22 cc_zpgw23 cc_zpgw24 all_cdr"
    fi
    for k in $tmp; do
      for l in error processed output; do
        mkdir -p "$base/$p1_path/$i/$j/$k/$l"
      done
    done
  done
done


for x in etl_cdr_p3 etl_cdr_sql; do
  for y in input processed; do
   for t in seatel metfone cellcard smart; do
    for z in {1..10}; do
      mkdir -p "$base/$x/$y/$t/$z"
    done
  done
 done
done


exit ;












