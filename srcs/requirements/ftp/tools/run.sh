# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpoveda- <me@izenynn.com>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/25 01:02:44 by dpoveda-          #+#    #+#              #
#    Updated: 2022/02/25 13:17:47 by dpoveda-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

if [ ! -f /etc/vsftpd/vsftpd.old ]; then
	mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.old
	mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

	echo $FTP_USER >> /etc/vsftpd.userlist

	# wait for wordpress to finish installation
	while [ ! -f "/var/www/html/finish" ]; do
		sleep 1
	done
	rm /var/www/html/finish
	mkdir -p /var/www/html
	chown -R $FTP_USER:$FTP_USER /var/www/html
	ls -l /var/www/html > /tmp/out1

	echo "[INFO] started FTP server"
	echo $FTP_USER

	ls -l /var/www/html > /tmp/out2
	echo "11111111"
	sleep 50
	echo "22222222"
	ls -l /var/www/html > /tmp/out3
fi

vsftpd /etc/vsftpd/vsftpd.conf