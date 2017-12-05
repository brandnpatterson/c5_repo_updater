# C5 Repo Updater 🚀 v1.0.1

## Purpose
+ Set up C5 localhost more quickly by relying on local emergenc files
+ Automates the following:
    1. set permissions for emergenc folders
    2. copy / paste files used with localhost that aren't version controlled
<br >

## Terminal Commands Used
+ `set777`: sets emergenc permissions
+ `update repo your-name`: copies files and folders from emergenc
<br >


## If you have done the following, skip to Part B:
```
cd ~/www/emergenc/trunk &&
chmod 777 application/config &&
chmod 777 packages &&
chmod 777 application/files &&
chmod 777 application/config
```
<br >


## Part A: Set Permissions
```
cd ~/www/emergenc/trunk
set777
```
You will be prompted about the changes
<br >
<br >


## Part B: Add C5 Repo Updater to your .bash_profile
```
cd && code .
```
+ place C5 Repo Updater code into your .bash_profile
+ restart terminal
<br >


## Part C: Copy files that aren't under version control
```
cd ~/www
$ update repo your-name
```
This takes 3 arguments including the repo's name and your name 
<br >
You will be prompted about the changes
<br >
<br >


## Part D: Add array to start.php
Open in code editor
```
repo/trunk/application/boostrap/start.php
```
Add array
+ add an array with the title of your `name`
+ fill the array with your machine's hostname
+ if on a mac, also add hostname.local
<br >
<br >


## Part E: Create local version of database
1. Open in code editor
```
repo/trunk/application/config/database.php
```

2. put database info into Sequel Pro / phpmyadmin, add (SHS) to name if added to Favorites

3. File/Export Database and close session

4. Be sure xampp/mamp is running and open localhost

5. Add Database to localhost
+ Database/Add Database
    - Name: repo
    - Database Encoding: UTF-8 Unicode (utf8)

6. Enter Database Credentials
replace file with one array and fill it with the newly created database credentials
