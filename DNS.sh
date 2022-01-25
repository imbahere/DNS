#!/bin/bash

# Secure Permanent DNS installer
# https://github.com/imbahere/lite-wireguard

RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m'

function isRoot() {
	if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
	fi
}

function installQuestions() {
	echo "Thank you for using Permanent DNS by Akmal@imbahere"
	echo ""
	echo "I need to ask you a few questions before starting the setup."
	echo ""

	# DNS by Akmal
	read -rp "SILA MASUKKAN DNS YANG DIBERI OLEH AKMAL@imbahere" -e -i 103.197.58.46 CLIENT_DNS_1

	done

	echo ""
	echo "Okay, that was all I needed. We are ready to setup your Permanent DNS now."
	read -n1 -r -p "Press any key to continue..."
}

function installResolv() {
	# Run setup questions first
	installQuestions

	# Install WireGuard tools and module
	if [[ ${OS} == 'ubuntu' ]] || [[ ${OS} == 'debian' && ${VERSION_ID} -gt 10 ]]; then
		apt-get update
		apt-get install -y resolvconf
	elif [[ ${OS} == 'debian' ]]; then
		if ! grep -rqs "^deb .* buster-backports" /etc/apt/; then
			echo "deb http://deb.debian.org/debian buster-backports main" >/etc/apt/sources.list.d/backports.list
			apt-get update
	fi

	# Save DNS settings
	echo CLIENT_DNS_1=${CLIENT_DNS_1}" >/etc/resolvconf/resolv.conf.d/head
CLIENT_DNS_1=${CLIENT_DNS_1}" >/etc/resolv.conf

wget -q -O /usr/local/bin/menu 'https://raw.githubusercontent.com/imbahere/doctype/default/plugins/menu' && \
chmod +x /usr/local/bin/menu

# Check for root, virt, OS...
initialCheck

# Check if resolv is already installed and load params
if [[ -e /etc/resolvconf/resolv.conf.d/head ]]; then
	source /etc/resolvconf/resolv.conf.d/head
	manageMenu
else
	installResolv
fi
