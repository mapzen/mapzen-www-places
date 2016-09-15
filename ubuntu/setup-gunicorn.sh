#!/bin/sh

PYTHON=`which python`
PERL=`which perl`

WHOAMI=`${PYTHON} -c 'import os, sys; print os.path.realpath(sys.argv[1])' $0`
PARENT=`dirname $WHOAMI`

PROJECT=`dirname $PARENT`
PROJECT_NAME=`basename ${PROJECT}`

# echo "project ${PROJECT}"
# echo "project name ${PROJECT_NAME}"

FLASK_CONFIG="${PROJECT}/config/${PROJECT_NAME}-flask.cfg"
GUNICORN_CONFIG="${PROJECT}/config/${PROJECT_NAME}-gunicorn.cfg"
INITD_SCRIPT="${PROJECT}/init.d/${PROJECT_NAME}.sh"

if [ ! -f ${FLASK_CONFIG} ]
then
    cp ${FLASK_CONFIG}.example ${FLASK_CONFIG}

    ${PERL} -p -i -e "s!YOUR-PLACES-SEARCH-HOST-GOES-HERE!localhost!" ${FLASK_CONFIG}
    ${PERL} -p -i -e "s!YOUR-PLACES-SEARCH-PORT-GOES-HERE!9200!" ${FLASK_CONFIG}
fi

if [ ! -f ${GUNICORN_CONFIG} ]
then
    cp ${GUNICORN_CONFIG}.example ${GUNICORN_CONFIG}

    ${PERL} -p -i -e "s!YOUR-PLACES-WWW-HOST-GOES-HERE!127.0.0.1!" ${GUNICORN_CONFIG}
    ${PERL} -p -i -e "s!YOUR-PLACES-WWW-PORT-GOES-HERE!7777!" ${GUNICORN_CONFIG}
    ${PERL} -p -i -e "s!YOUR-PLACES-WWW-ROOT-GOES-HERE!${PROJECT}/www!" ${GUNICORN_CONFIG}
    ${PERL} -p -i -e "s!YOUR-PLACES-FLASK-CONFIG-GOES-HERE!${FLASK_CONFIG}!" ${GUNICORN_CONFIG}
fi

if [ ! -f ${INITD_SCRIPT} ]
then

    cp ${INITD_SCRIPT}.example ${INITD_SCRIPT}
fi

${PERL} -p -i -e "s!YOUR-PLACES-NAME!${PROJECT_NAME}!g" ${INITD_SCRIPT}
${PERL} -p -i -e "s!YOUR-PLACES-WWW-ROOT-GOES-HERE!${PROJECT}/www!" ${INITD_SCRIPT}
${PERL} -p -i -e "s!YOUR-PLACES-GUNICORN-CONFIG-GOES-HERE!${GUNICORN_CONFIG}!" ${INITD_SCRIPT}

if [ ! -f /etc/init.d/${PROJECT_NAME}.sh ]
then
    sudo ln -s ${PROJECT}/init.d/${PROJECT_NAME}.sh /etc/init.d/${PROJECT_NAME}.sh
    sudo update-rc.d ${PROJECT_NAME}.sh defaults

    sudo /etc/init.d/${PROJECT_NAME}.sh start
fi

exit 0
