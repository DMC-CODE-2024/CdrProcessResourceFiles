set -x

cd /u02/eirsdata/release/etl_cdr_module/1.1.0
tar -xzvf etl_cdr_1.1.0.tar.gz >>etl_cdr_1.1.0_untar_log.txt

mv etl_cdr_1.1.0/etl_cdr_p1_p2_1.1.0.jar ${RELEASE_HOME}/binary/
mv etl_cdr_1.1.0/etl_cdr_p3_1.1.0.jar ${RELEASE_HOME}/binary/

mv etl_cdr_1.1.0/application.properties etl_cdr_1.1.0/etl_cdr_p1_p2.sh  ${APP_HOME}/etl_cdr_module/etl_cdr_p1_p2/
mv etl_cdr_1.1.0/etl_cdr_sql.sh ${APP_HOME}/etl_cdr_module/etl_cdr_sql/

cd ${APP_HOME}/etl_cdr_module/etl_cdr_p1_p2/
rm etl_cdr_p1_p2.jar
ln -sf ${RELEASE_HOME}/binary/etl_cdr_p1_p2_1.1.0.jar etl_cdr_p1_p2.jar

cd ${APP_HOME}/etl_cdr_module/etl_cdr_p3/
rm etl_cdr_p3.jar
ln -sf ${RELEASE_HOME}/binary/etl_cdr_p3_1.1.0.jar etl_cdr_p3.jar
