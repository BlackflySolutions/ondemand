#!/bin/bash
# Give the server a name to avoid warnings, this is Ubuntu specific
echo "ServerName $VSITE_DOMAIN" | tee /etc/apache2/conf-available/fqdn.conf
a2enconf fqdn
apache2-foreground
