FROM ckulka/rhodecode-rccontrol
LABEL maintainer="cyrill.kulka@gmail.com"

ENV RC_VERSION 4.9.0

RUN .rccontrol-profile/bin/rccontrol	\
		install VCSServer				\
		--version $RC_VERSION			\
		--accept-license				\
		'{"host": "0.0.0.0", "port": 9900}'

EXPOSE 9900
CMD rc_start
