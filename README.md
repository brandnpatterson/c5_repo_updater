# SHS Repo Updater 🚀 v1.0.4

## Purpose

- Sets up localhost more quickly (rely on local emergenc files for c5 sites)
- Automates copy / paste files used with localhost that are not version controlled
- Creates virtial host in httpd-vhosts.conf and a localhost in /etc/hosts for the repo
  <br >

## Terminal Commands Used

- `update repo`: copies files and folders from emergenc
  (The Following: Currently no support for mamp)
- `sudo newhost.sh repo`: creates virtial host in /etc/hosts and xampp's or mamp's httpd-vhosts
  <br >

## 1. Add Repo Updater to your .bash_profile

```
cd && code .
```

- place Repo Updater code into your .bash_profile
- restart terminal

## 2. Copy files that aren't under version control

```
$ update repo (example: c5_ojairesort)
```

<br >
You will be prompted about the changes

## 3. Add array to start.php

Open in code editor

```
repo/trunk/application/boostrap/start.php
```

Add array

- add an array with the title of your `name`
- fill the array with your machine's hostname
- if on a mac, also add hostname.local

## 4. Create local version of database

Open in code editor

```
repo/trunk/application/config/database.php
```

Put database info into Sequel Pro / phpmyadmin, add (SHS) to name if added to Favorites

File/Export Database and close session

Be sure your server is running and open localhost

Add Database to localhost

- Database/Add Database
  - Name: repo
  - Database Encoding: UTF-8 Unicode (utf8)

Enter Database Credentials
replace file with one array and fill it with the newly created database credentials

## 5. Create local virtual host

1. Place newhost.sh into `/usr/local/bin`
2. Restart terminal
3. cd to the directory where you checked out the repo
4. run `sudo newhost.sh repo`
5. Parameters will be created for `/etc/hosts` as well as xampp's or mamp's `httpd-vhosts.conf`
6. Your new virtual host is now created and can be used in the browser at http://repo.localhost
