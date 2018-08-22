#! /bin/bash

# Check if crontab for vagrant exists
# Check if crontab has moodle records if falsem start installation
if ! [ -f /var/spool/cron/vagrant ] || ! [ "$(sudo -u vagrant crontab -l | grep moodle)" ]; then
    sudo /usr/bin/php /var/www/html/moodle/admin/cli/install.php --wwwroot=http://192.168.22.200/moodle --dataroot=/var/moodledata --dbtype=pgsql --dbhost=192.168.22.200 --dbname=moodledb --dbuser=moodleuser --dbpass=m00dLe --fullname="Moodle LMS for SS ITA" --adminpass=m00dLe  --shortname="Moodle" --non-interactive --agree-license --skip-database
else
    echo "*** Skipped **** Moodle already installed. "
fi 