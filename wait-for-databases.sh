#!/bin/bash

set -e

until PGPASSWORD=${GEONODE_DATABASE_PASSWORD} psql -h ${GEONODE_DATABASE_HOST} -p ${GEONODE_DATABASE_PORT} -U ${GEONODE_DATABASE_USER} -d ${GEONODE_DATABASE} -P "pager=off" -c '\l'; do
  >&2 echo "${GEONODE_DATABASE} is unavailable - sleeping"
  sleep 1
done

until PGPASSWORD=${GEONODE_GEODATABASE_PASSWORD} psql -h ${GEONODE_GEODATABASE_HOST} -p ${GEONODE_GEODATABASE_PORT} -U ${GEONODE_GEODATABASE_USER} -d ${GEONODE_GEODATABASE} -P "pager=off" -c '\l'; do
  >&2 echo "${GEONODE_GEODATABASE} is unavailable - sleeping"
  sleep 1
done

>&2 echo "GeoNode databases are up - executing command"
