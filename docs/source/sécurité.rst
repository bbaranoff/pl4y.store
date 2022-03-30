Examen sécurité de l’information
================================

Descriptif
----------

Contexte La ville de Cabestany (Pyrénnes-Orientales) va monter son
université spécialisée en chimie.

-  Elle est composée de 50 personnels administratifs et techniques et de
   50 enseignants chercheurs
-  Elle enseigne la chimie à 3000 étudiants
-  Elle a un laboratoire spécialisé dans les dissolvants à haute
   performance (avec 20 chercheurs et 2 secrétaires administratives).

Les livrables:
--------------

Examen « politique de sécurité »:
=================================

-  Faites une analyse de risques, en précisant les interlocuteurs que
   vous interrogerez et les réponses probables (ou simplement que vous
   imaginez) que vous obtiendrez. Personnel administratif Questions à
   poser “Quels sont les logiciels que vous allez utiliser” Reponses :
   Secrétaires “Suite Microsoft Office, Firefox (Même si ils veulent
   Chrome ou Edge… ), Windows 10 avec mise à jour forcées automatique,
   Impossibilité d’installer des logiciels (Système de ticket si
   nécessité) accès à l’intranet CRM, cloud” Questions à poser 50
   enseignants chercheurs 1 (ou +) poste par enseignants “Logiciels
   Labview, Matlab, COMSOL disponibles sur serveurs administratifs,
   accès l’intranet CRM Cloud, Logiciels scientifiques”

“Nombres d’ordinateurs? Puissance? OS? Services ?”

Réponses attendues : Besoin de SIP pour communiquer avec des secteurs de
recherches géographiquement eloigné. besoin de contrôle à distance pour
travail chez soi, besoin de calculateurs, selon les avis Windows MacOS
linux, besoin de mise en place de ticket pour les problèmes techniques
(panne d’ordinateur)

Politique de sécurité
---------------------

L’identité de l’utilisateur peut être établie l’ID du VLAN et le
matériel utilisé par son adresse MAC. On fait le choix de proscrire le
Wifi “Public” du moins les trames en clair sur le réseau. Et l’on
restreint au maximum les utilisateurs de Wifi sachant que l’on a 500
adresses IP pour 50+50+4*25+10~210 postes. On a la marge pour que les
enseignants (les secrétaires étant pas forcéments amenés a se deplacé
avec une nécissité d’ordinateur a travers la faculté) puisse bénéficier
d’un réseau Wifi. \``\` Après il faut “éduquer” sachant que les réseaux
Wifi (avec les Wifis Pineapple, Krack attacks,ou les rogues AP) ne sont
jamais complètement sécurisés. Préciser que si il n’y a pas le cadenas
qui garanti le chriffrement de la page sur l’URL le mot peut être
lisible par une personne en position d’homme du milieu. Et qu’en matière
de sécurité il s’agit beaucoup plus souvent de conditions nécessaires à
une transaction sécurisée et très rarement voire jamais suffisantes.
Analyse de risques

Risques internes (volontaires): Arnaque aux numéros surtaxés Clone de
badge RFID/NFC (Wireless) Human Interface Device Mise en place de
payload Apache/exe/… Risques interne (involontaires) : Bring Your Own
Device Ouverture d’un .docx vérolé (CVE-2021-40444)

Examen “Sécurisation d’un système informatique”:
------------------------------------------------

-  Comment structurez-vous votre réseau?
-  Quels équipements mettez-vous et où?
-  Indiquez, quand cela est possible, comment vous les paramétreriez
   soit avec des fichiers de configuration, soit avec des explications «
   textuelles », par exemple

Soit mettre des iptables Soit expliquer que tel réseau a accès à tel
autre pour tel service. - Quelles procédures mettez-vous en place? ->
Administratives ? -> Techniques ? - Faites-vous appel ou pas à des
prestations externes? Il n’est pas obligatoire de mettre tout ce qu’il
est possible d’envisager - Comment structurez-vous votre réseau?
Informatiquement -> Elle a un réseau en 193.49.49.0/23 (pas /24 !)

.. code:: bash

   nirvana@hp:~$ ipcalc 193.49.49.0/
   Address: 193.49.49.0 11000001.00110001.0011000 1.
   Netmask: 255.255.254.0 = 23 11111111.11111111.1111111 0.
   Wildcard: 0.0.1.255 00000000.00000000.0000000 1.
   =>
   Network: 193.49.48.0/23 11000001.00110001.0011000 0.
   HostMin: 193.49.48.1 11000001.00110001.0011000 0.
   HostMax: 193.49.49.254 11000001.00110001.0011000 1.
   Broadcast: 193.49.49.255 11000001.00110001.0011000 1.
   Hosts/Net: 510 Class C

5 serveurs, sous Unix, s’occuperont des logiciels administratifs
(appelez les adm1, adm2, etc.) On choisira le système d’exploitation
Ubuntu (Par préférence personnelle sur RedHat) mais l’on prendra la
version d’Ubuntu avec le support Advantage : CF
(https://ubuntu.com/support) Ubuntu Advantage Security, support and
managed open source for enterprises Future-proof the full stack, from
the data centre to containers to the database, LMA, server and
cloud-native applications with open source software support from
Canonical. Ubuntu Advantage is a single, per-node package of the most
comprehensive enterprise security and support for open source
infrastructure and applications, with managed service offerings
available.

::

   adm1.univ-cabes.frdédié aux CRM (exemple : Odoo)IP_CRM=192.9.48.5
   adm2.univ-cabes.frCloud Privé Datadoghq (Supervision, Monitoring, stockage, déploiement kubernetes docker aws... )IP_CLOUD=192.49.48.4
   adm3.univ-cabes.fr Logiciels Scientififiques (Matlab COMSOL... ) IP_SOFT=192.49.48.3
   adm4.univ-cabes.frAuthentification (LDAP, Active Directory)IP_AUTH=192.49.48.2
   adm5.univ-cabes.frVirtualisation, Monitoring, Sécurisation, Tests et détecteurs d’intrusions.IP_SEC=192.49.48.1

Chaque personnel a un ordinateur individuel sous Windows. On choisi le
sous-réseau192.49.48.0/24pour le personnel et les chercheurs 50
personnels administratifs et techniques 1 Poste Windows/Personne

Les étudiants ont 4 salles de TP informatique pour 25 ordinateurs. On
choisi le sous-réseau 192.49.49.0/24 Il y a aura un serveur de fichiers
ftp.univ-cabes.fr port 21 Une IP_DMZ 192.49.48.6 Un Frontend 192.49.48.7
puis un backend 192.49.48.8 comprennant : une messagerie interne Serveur
Psotfix/ client RoundCUBE SMTP port 465 Authenticated SMTP over SSL Port
(TLS) Non (SSL) Oui smtp.univ-cabes.fr Serveur imap Port SSL : 993
imap.univ-cabes.fr DNS port 53 dnsmasq Web port 80 443 Serveur web Nginx
http://www.univ-cabes.fr Proscrire le DHCP (pour éviter le DHCP
Snooping) VLAN par ID + Password (pour éviter le MAC Spoofing) IP Fixée
par l’id du VLAN.

::

   IP_BACKEND=192.49.48.8
   IP_FRONTEND=192.49.48.7
   IP_DMZ=192.49.48.6
   IP_PUB_DMZ=12.34.56.78

::

   ./protect_backend.sh
   iptables -P FORWARD DROP # we aren't a router
   iptables -A INPUT -m state --state INVALID -j DROP
   iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
   iptables -A INPUT -i lo -j ACCEPT
   iptables -A INPUT -p tcp -s $IP_FRONTEND --dport 443 -j ACCEPT
   iptables -A INPUT -p tcp -s $IP_FRONTEND --dport 21 -j ACCEPT
   iptables -A INPUT -p tcp -s $IP_SEC --dport 22 -j ACCEPT
   iptables -P INPUT DROP _# Drop everything we don't accept_
   ./protect_frontend.sh
   iptables -P FORWARD DROP _# we aren't a router_
   iptables -A INPUT -m state --state INVALID -j DROP
   iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
   iptables -A INPUT -i lo -j ACCEPT
   iptables -A INPUT -p tcp -s $IP_SEC -j ACCEPT
   iptables -A INPUT -p tcp --dport 21 -j ACCEPT
   iptables -A INPUT -p tcp --dport 80 -j ACCEPT
   iptables -A INPUT -p tcp --dport 443 -j ACCEPT
   iptables -P INPUT DROP _# Drop everything we don't accept_

remise_a_zero.sh

::

   iptables -F
   iptables -X
   iptables -t nat -F
   iptables -t nat -X
   iptables -t mangle -F
   iptables -t mangle -X
   iptables -P INPUT ACCEPT
   iptables -P FORWARD ACCEPT
   iptables -P OUTPUT ACCEPT

Serveur web Nginx backend /etc/apache2/nginx/000-default.cfg

::

   server {
       listen 443 ssl;
       listen [::]:443 ssl;
       ssl_certificate /etc/letsencrypt/live/www.univ-cabes.fr.store/fullchain.pem;
       # managed by Certbot
       ssl_certificate_key /etc/letsencrypt/live/www.univ-cabes.fr/privkey.pem;
       # managed by Certbot
       server_name univ-cabes.fr;
       root /var/www/;
       index index.php index.html;
       location ~* /orig/(.+\.jpg)$ {
       add_header Content-disposition "attachment; filename=$1";
   }
   location / {
       # This is cool because no php is touched for static content.
       # include the "?$args" part so non-default permalinks
       # doesn't break when using query string
       try_files $uri $uri/ /index.php?$args;
   }
       location /wp-admin/ {
       index index.php
       try_files $uri $uri/ /index.php?$args;
   }
       location ~\.php$ {
           try_files $uri =404;
           fastcgi_split_path_info ^(.+?\.php)(/.+)$;
           fastcgi_pass unix:/var/run/php7.4-fpm-example.sock;
           fastcgi_index index.php;
           fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
           include /etc/nginx/fastcgi_params;
       }
   }

Serveur Frontend :

Reverse Proxy

haproxy.cfg

::

   # timeouts so that long-running CLI commands will work.
   global
   maxconn 256
   log 127.0.0.1 local0 debug

   defaults
   log global
   maxconn 200
   timeout connect 5s
   timeout client 5min
   timeout server 5min

   frontend Local_Server
   bind $IP_FRONTEND:443 ssl crt /etc/letsencrypt/live/univ-cabes.fr/fullchain.pem
   acl is-blocked-ip src -f /etc/haproxy/blocklisted.ips
   http-request deny if is-blocked-ip
   # use a stick table to track request rates
   stick-table type ip size 100k expire 2m store http_req_rate(1m)
   http-request track-sc0 src
   # Deny if they exceed the limit
   acl too_many_requests sc_http_req_rate(0) gt 20
   http-request deny deny_status 429 if too_many_requests
   acl network_allowed src $IP_PUB_DMZ
   tcp-request connection reject if !network_allowed
   option tcplog
   mode tcp
   default_backend web
   backend web
   mode tcp
   option ssl-hello-chk
   server web $IP_BACKEND:443 ssl verify none

/etc/apache2/sites-enabled/000-default.cfg

::

   <VirtualHost *:80>
       ServerAdmin webmaster@localhost
       DocumentRoot /var/www/html
       Redirect permanent / https://univ-cabes.fr/
       ErrorLog ${APACHE_LOG_DIR}/error.log
       CustomLog ${APACHE_LOG_DIR}/access.log combined
   </VirtualHost>

Le Poste 192.49.48.1 a accès à tous les réseaux (réseau Sécurisation) et
toutes les machines Le sous-réseau 192.49.48.0/24 a accès a l’ensemble
du réseau 192.49.49.0/24 (accès au cloud, CRM logiciels scientifiques,
Web, messagerie, DNS) Le sous réseau 192.49.49.0/24 (réseau étudiant n’a
accès qu’à son propre sous réseau) on laissera tout de même un accès au
“cloud” et aux “logiciels scientifiques” sur demande de l’enseignant
avec un iptables FORWARD, plus un accès à la messagerie (accès
RoundCUBE) et au Web bien sûr en comptant que tout le monde est sensé
disposer de cet accès.

::

   .------------------------------------------------.
   |.---------.       .------------.                |
   ||Etudiants|------>|Serveurs    |   .--------.   |
   |.---------.       |FTP,SMTP,DNS|   |Web     |   |
   |.---------.       |Web_backend |<->|Frontend|<->|<->RENATER<->(Internet)
   ||Scolarité|------>|Imap Adm1-5 |   .--------.   |                 DMZ
   |.---------.       .------------.                |
   .------------------------------------------------.
                       Intranet

-  Quelles procédures mettez-vous en place? -> Administratives?
   Contacter RENATER leur demander une ligne avec du 1Gb/s soit
   ((1GB/s)/500 Postes)=2Mb/s pour tous les postes en condition maximum
   d’utilisation). Vérifier si les mesures sont conformes avec
   l’ISO-27001

-> Procédures techniques

DNS menteur Google safe search Machine 192.49.48.1 Nessus Shinken
iptables accept sur l’ensemble du réseau squid sur tous les serveurs
haproxy en reverse proxy sur le front-end WinJa sur les ordinateurs
Windows qui scanne et verifie sur VirusTotal un ensemble de fichiers
Mise en place d’un honeypot avec acl de haproxy qui rejettent les IP
atteignant ce honeypot. On fait en sorte que l’identité de l’utilisateur
soit établie avec l’ID du VLAN et le matériel utilisé par son adresse
MAC. On fait le choix de proscrire le Wifi “Public” du moins les trames
en clair sur le réseau.

Perspectives : Mise en place d’une boîte noire qui intercepte l’ensemble
des trames (en clair si possible) qui les stocke, impossibles d’accès
sans procédure judiciaire.
