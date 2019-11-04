#!/bin/bash

### We set up the kerberos config file to access to 42's kerberos server.

cat >> /etc/krb5.conf << EOF
[libdefaults]
    default_realm = 42madrid.com
    forwardable = true
    proxiable = true
    dns_lookup_kdc = no
    dns_lookup_realm = no
    allow_weak_crypto = true

[realms]
    42madrid.com = {
        kdc = ldap.42madrid.com
        admin_server = ldap.42madrid.com
        default_domain = 42madrid.com
        default_lifetime = 7d
        ticket_lifetime = 7d
    }

[domain_realm]
    .42madrid.com = 42madrid.com
    42madrid.com = 42madrid.com
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.42madrid.com
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "root part finished !"
