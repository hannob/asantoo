# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Configuration files to use Gentoo with Address Sanitizer"
HOMEPAGE="https://github.com/hannob/asantoo"
SRC_URI=""
LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=""
S="${WORKDIR}"

src_install() {
	insinto /etc/portage/package.env
	newins "${FILESDIR}/package.env-asantoo" asantoo

	insinto /etc/portage/env
	newins "${FILESDIR}/env-noasan" noasan
	newins "${FILESDIR}/env-pthread" pthread

	insinto /etc/env.d
	doins "${FILESDIR}/99asan"

	dodir /var/log/asan
	fperms 01777 /var/log/asan

	insinto /etc/portage
	newins "${FILESDIR}/portage-bashrc" bashrc
}
