# $FreeBSD$

PORTNAME=	kotlin
PORTVERSION=	1.2.21
CATEGORIES=	lang
MASTER_SITES=	https://github.com/JetBrains/kotlin/releases/download/v${PORTVERSION}/
DISTNAME=	kotlin-compiler-${PORTVERSION}

MAINTAINER=	lwhsu@FreeBSD.org
COMMENT=	Kotlin Programming Language

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/license/LICENSE.txt

RUN_DEPENDS=	bash:/shells/bash

USES=	zip

WRKSRC=	${WRKDIR}/kotlinc

NO_BUILD=	yes

post-extract:
	${RM} ${WRKSRC}/bin/*.bat

do-install:
	cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${PREFIX}/bin
	cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/libexec
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/build.txt ${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
