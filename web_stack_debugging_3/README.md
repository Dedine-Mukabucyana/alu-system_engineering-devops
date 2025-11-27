# Web Stack Debugging #3

This project involves debugging a WordPress site running on a LAMP stack that's returning a 500 Internal Server Error.

## Task

Use strace to identify the issue causing Apache to return a 500 error, then automate the fix using Puppet.

## Solution

The issue is typically a typo in the WordPress settings file where a PHP file has the wrong extension (`.phpp` instead of `.php`). The Puppet manifest fixes this automatically.

## Usage
```bash
puppet apply 0-strace_is_your_friend.pp
```
