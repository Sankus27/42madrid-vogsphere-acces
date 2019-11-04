#!/bin/bash

### We set up the kerberos config file to access to 42's kerberos server.

mv /etc/krb5.conf /etc/krb5.conf_before42vogsphereaccess

echo "Original /etc/krb5.conf renamed : /etc/krb5.conf_before42vogsphereaccess" 

cat >> /etc/krb5.conf << EOF
[libdefaults]
	default_realm = 42MADRID.COM
	forwardable = true
	proxiable = true
      	dns_lookup_kdc = no
      	dns_lookup_realm = no
	allow_weak_crypto = true
	rdns = false

[realms]
	42MADRID.COM = {
                kdc = ldap.42madrid.com
                kdc = ldap.42madrid.com
                admin_server = ldap.42madrid.com
		database_module = openldap_ldapconf
		default_domain = 42madrid.com
		default_lifetime = 7d
                ticket_lifetime = 7d
	}
        STAFF.42MADRID.COM = {
                kdc = ldap.staff.42madrid.com
                admin_server = ldap.staff.42madrid.com
                default_domain = staff.42madrid.com
	}

[domain_realm]
	.42madrid.com = 42MADRID.COM
	42madrid.com = 42MADRID.COM
	.staff.42madrid.com = STAFF.42MADRID.COM
	staff.42madrid.com = STAFF.42MADRID.COM
EOF

### We set up the ssh config file to access to 42's git server (vogsphere)
### using your kerberos identification

cat >> /etc/ssh/ssh_config << EOF
Host *.42MADRID.COM
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "root part finished !"
