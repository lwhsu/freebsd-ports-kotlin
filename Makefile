# $FreeBSD$

PORTNAME=	kotlin
PORTVERSION=	1.3.41
CATEGORIES=	lang
MASTER_SITES=	https://github.com/JetBrains/kotlin/releases/download/v${PORTVERSION}/
DISTNAME=	kotlin-compiler-${PORTVERSION}

MAINTAINER=	lwhsu@FreeBSD.org
COMMENT=	Kotlin Programming Language

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/license/LICENSE.txt

RUN_DEPENDS=	bash:shells/bash

USES=	zip

WRKSRC=	${WRKDIR}/kotlinc

NO_BUILD=	yes

post-extract:
	${RM} ${WRKSRC}/bin/*.bat

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/lib
	${MKDIR} ${STAGEDIR}${DATADIR}/bin
	cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${DATADIR}/bin
	cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}/lib
	${LN} -sf ${DATADIR}/bin/kapt ${STAGEDIR}${PREFIX}/bin/kapt
	${LN} -sf ${DATADIR}/bin/kotlin ${STAGEDIR}${PREFIX}/bin/kotlin
	${LN} -sf ${DATADIR}/bin/kotlin-dce-js ${STAGEDIR}${PREFIX}/bin/kotlin-dce-js
	${LN} -sf ${DATADIR}/bin/kotlinc ${STAGEDIR}${PREFIX}/bin/kotlinc
	${LN} -sf ${DATADIR}/bin/kotlinc-js ${STAGEDIR}${PREFIX}/bin/kotlinc-js
	${LN} -sf ${DATADIR}/bin/kotlinc-jvm ${STAGEDIR}${PREFIX}/bin/kotlinc-jvm
	${INSTALL_DATA} ${WRKSRC}/build.txt ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
