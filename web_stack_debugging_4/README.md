# Web Stack Debugging #4

This project involves fixing an Nginx server that's failing to handle high load properly.

## Problem

When benchmarking with ApacheBench (ab), the server is experiencing 943 failed requests out of 2000 when under pressure (100 concurrent requests).

## Solution

The issue is caused by Nginx hitting the system limit for open file descriptors. The default limit (typically 15) is too low for high concurrency.

The Puppet manifest:
- Increases the ULIMIT value in `/etc/default/nginx` from 15 to 4096
- Reloads Nginx to apply the changes

## Usage
```bash
puppet apply 0-the_sky_is_the_limit_not.pp
```

## Result

After applying the fix:
- Failed requests: 943 → 0
- All 2000 requests complete successfully
