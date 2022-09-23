#!/bin/bash
confApache="/etc/apache2/apache2.conf"

serverTokens="ServerTokens Prod"
serverSignature="ServerSignature Off"
eTag="FileETag None"
trace="TraceEnable off"
cookie="Header edit Set-Cookie ^(.*)$ $1;HttpOnly;Secure"
clickjacking="Header always append X-Frame-Options SAMEORIGIN"
xss='Header set X-XSS-Protection "1; mode=block"'
rewrite="RewriteEngine On \b RewriteCond %{THE_REQUEST} !HTTP/1.1$ \b" 

echo $serverSignature >> $confApache
echo $serverTokens >> $confApache
echo $eTag >> $confApache
echo $trace >> $confApache
echo $cookie >> $confApache
echo $clickjacking >> $confApache
echo $xss >> $confApache
echo $timeout >> $confApache
echo $rewrite >> $confApache
sed -i "s/Options Indexes FollowSymLinks/Options None/" $confApache
sed -i "s/Timeout 300/Timeout 60/" $confApache 
a2enmod headers
a2enmod rewrite
service apache2 restart