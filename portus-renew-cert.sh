#!/bin/bash  
echo 'renewal of cert...' 
 # tmp removal of http block glcoud firewall
 # certbot -q renew --pre-hook "gcloud compute instances add-tags portus --tags=http-server --zone=europe-west1-b" --post-hook "service nginx reload &&  gcloud compute instances remove-tags portus --tags=http-server --zone=europe-west1-b" 
 
 certbot renew
echo 'cert renewed' 


echo 'renewal of portus cert' 
cp /etc/letsencrypt/live/registry.my-domain.com/cert.pem /opt/portus/compose/secrets/
cp /etc/letsencrypt/live/registry.my-domain.com/chain.pem /opt/portus/compose/secrets/

cp /etc/letsencrypt/live/registry.my-domain.com/fullchain.pem /opt/portus/compose/secrets/
cp /etc/letsencrypt/live/registry.my-domain.com/fullchain.pem /opt/portus/compose/secrets/portus.crt

cp /etc/letsencrypt/live/registry.my-domain.com/privkey.pem /opt/portus/compose/secrets/
cp /etc/letsencrypt/live/registry.my-domain.com/privkey.pem /opt/portus/compose/secrets/portus.key
chown www-data:www-data /opt/portus/compose/secrets/
 echo 'cert renewed portus' 

