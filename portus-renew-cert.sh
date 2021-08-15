#!/bin/bash  
echo 'renewal of cert...' 
 # tmp removal of http block glcoud firewall
 # certbot -q renew --pre-hook "gcloud compute instances add-tags portus --tags=http-server --zone=europe-west1-b" --post-hook "service nginx reload &&  gcloud compute instances remove-tags portus --tags=http-server --zone=europe-west1-b" 
 
 certbot renew
echo 'cert renewed' 


echo 'renewal of portus cert' 
cp /etc/letsencrypt/live/registry.my-domain.com/cert.pem /var/lib/registry/compose/secrets/
cp /etc/letsencrypt/live/registry.my-domain.com/chain.pem /var/lib/registry/compose/secrets/

cp /etc/letsencrypt/live/registry.my-domain.com/fullchain.pem /var/lib/registry/compose/secrets/
cp /etc/letsencrypt/live/registry.my-domain.com/fullchain.pem /var/lib/registry/compose/secrets/portus.crt

cp /etc/letsencrypt/live/registry.my-domain.com/privkey.pem /var/lib/registry/compose/secrets/
cp /etc/letsencrypt/live/registry.my-domain.com/privkey.pem /var/lib/registry/compose/secrets/portus.key
chown www-data:www-data /var/lib/registry/compose/secrets/
 echo 'cert renewed portus' 

