server {

       listen _LISTEN_PORT_;
       server_name _SERVER_NAME_;

       set $level_id '_LEVEL_ID_';

       access_log /var/log/nginx/_LEVEL_INSTANCE_ID__access.log;
       error_log /var/log/nginx/_LEVEL_INSTANCE_ID__error.log;

       location / {
   		resolver 8.8.8.8;
       		access_by_lua_file '/pathwar/lua/auth.lua';
		proxy_set_header Host '_LEVEL_INSTANCE_ID_';
		proxy_set_header WWW-Authenticate '';
		proxy_pass http://_LEVEL_URL_;
       }
}