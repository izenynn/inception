# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpoveda- <me@izenynn.com>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/25 21:06:45 by dpoveda-          #+#    #+#              #
#    Updated: 2022/02/25 21:29:18 by dpoveda-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# check for phpmyadmin
if [ ! -d "/var/www/html/phpmyadmin" ]; then
	echo "[INFO] installing phpmyadmin..."
	wget -q "http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz" || (echo "[ERROR] wget failed, installation failed")
	tar zxf "phpMyAdmin-5.0.2-all-languages.tar.gz"
	rm "phpMyAdmin-5.0.2-all-languages.tar.gz"
	mv "phpMyAdmin-5.0.2-all-languages" "phpmyadmin"
	cp "/var/www/html/phpmyadmin/config.sample.inc.php" "/var/www/html/phpmyadmin/config.inc.php"
	sed -i "s|localhost|$MYSQL_HOST|g" /var/www/html/phpmyadmin/config.inc.php
fi
