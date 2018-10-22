# INSERT INTO authority  VALUES(1,'ROLE_OAUTH_ADMIN');
# INSERT INTO authority VALUES(2,'ROLE_RESOURCE_ADMIN');
# INSERT INTO authority VALUES(3,'ROLE_PRODUCT_ADMIN');
# INSERT INTO credentials VALUES(1,b'1','oauth_admin','$2a$10$BurTWIy5NTF9GJJH4magz.9Bd4bBurWYG8tmXxeQh1vs7r/wnCFG2','0');
# INSERT INTO credentials VALUES(2,b'1','resource_admin','$2a$10$BurTWIy5NTF9GJJH4magz.9Bd4bBurWYG8tmXxeQh1vs7r/wnCFG2','0');
# INSERT INTO credentials  VALUES(3,b'1','product_admin','$2a$10$BurTWIy5NTF9GJJH4magz.9Bd4bBurWYG8tmXxeQh1vs7r/wnCFG2','0');
# INSERT INTO credentials_authorities VALUE (1,1);
# INSERT INTO credentials_authorities VALUE (2,2);
# INSERT INTO credentials_authorities VALUE (3,3);
#
#
# INSERT INTO oauth_client_details VALUES ('curl_client', 'product_api', '$2a$10$BurTWIy5NTF9GJJH4magz.9Bd4bBurWYG8tmXxeQh1vs7r/wnCFG2', 'read,write,update,delete', 'client_credentials,password,authorization_code,refresh_token,implicit', 'http://127.0.0.1', 'ROLE_PRODUCT_ADMIN', 10000, 10000, null, 'true');
# INSERT INTO oauth_client_details VALUES ('curl_client1', 'product_api', '$2a$10$BurTWIy5NTF9GJJH4magz.9Bd4bBurWYG8tmXxeQh1vs7r/wnCFG2', 'read,write,update,delete', 'password,authorization_code,refresh_token,implicit', 'http://127.0.0.1', 'ROLE_PRODUCT_ADMIN', 10000, 10000, null, 'true');