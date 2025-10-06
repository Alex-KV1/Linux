#!/bin/bash
spawn-fcgi -f /server -p 8080
nginx -g 'daemon off;'