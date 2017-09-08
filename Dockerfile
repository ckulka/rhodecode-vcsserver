FROM ckulka/rhodecode-rccontrol
LABEL maintainer="cyrill.kulka@gmail.com"

ENV RC_VERSION 4.9.0

RUN .rccontrol-profile/bin/rccontrol	\
		install VCSServer				\
		--version $RC_VERSION			\
		--accept-license				\
		'{"host": "0.0.0.0", "port": 8080}'

EXPOSE 8080
CMD .rccontrol/vcsserver-1/profile/bin/gunicorn --error-logfile=- --paster=$HOME/.rccontrol/vcsserver-1/vcsserver.ini --config=$HOME/.rccontrol/vcsserver-1/gunicorn_conf.py
