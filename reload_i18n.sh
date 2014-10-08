#!/bin/bash
# A simple script to reload translations from github

cd /tmp
git clone https://github.com/taypo/discourse-turkish-i18n-kpn.git
cp -rT discourse-turkish-i18n-kpn/ /var/www/discourse/
cp -f discourse-turkish-i18n-kpn/reload_i18n.sh /root/reload_i18n.sh
chmod +x /root/reload_i18n.sh
rm -rf discourse-turkish-i18n-kpn
cd /var/www/discourse
sudo -u discourse RAILS_ENV=production bundle exec rake assets:clobber assets:precompile
