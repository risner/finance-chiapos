# $FreeBSD$

PORTNAME=	chiapos
DISTVERSION=	1.0.3
CATEGORIES=	finance python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	risner@stdio.com
COMMENT=	Chia proof of space plotting, proving, and verifying (cmake part)

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake:noninja
USE_GITHUB=	nodefault
GH_TUPLE=	jarro2783:cxxopts:302302b30839505703d37fb82f536c53cf9172fa:c/src-ext/cxxopts \
		gulrak:filesystem:4e21ab305794f5309a1454b4ae82ab9a0f5e0d25:g/src-ext/gulrak
USE_PYTHON=	autoplist concurrent distutils
CMAKE_ARGS+=	-DCOMPILER_CXXFLAGS="${CXXFLAGS}" \
		-DCOMPILER_FLAGS="${CFLAGS}"

post-extract:
# This example is experimental, currently broken (upstream) and unnecessary.
# The placeholder Makefile is for when/if they release a future fixed version.
	@${CP} ${FILESDIR}/Hellman-Makefile ${WRKSRC}/hellman_example/Makefile
# Remove extraneous unused files to prevent confusion
	@${RM} ${WRKSRC}/lib/FiniteStateEntropy/fetch-content-CMakeLists.txt
	@${RM} ${WRKSRC}/pyproject.toml

do-test: stage
	${WRKDIR}/.build/RunTests

.include <bsd.port.mk>
