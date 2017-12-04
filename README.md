# C5 Repo Updater 🚀


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

### 1. cd emergenc/trunk
`cd ~/www/emergenc/trunk`

### 2. Run set777 to chmod 777 necessary folders
`set777`
You will be prompted about the changes
<br >
<br >

## Part B: Add C5 Repo Updater to your .bash_profile

### 1. cd root and open in your code editor of choice
`cd && code .`

### 2. Open ~/.bash_profile
+ place C5 Repo Updater code into your .bash_profile
+ restart terminal
<br >


## Part C: Copy files that aren't under version control

### 1. cd dev folder
`cd ~/www`

### 2. Run update
`$ update repo your-name` <br >
This takes 3 arguments including the repo's name and your name <br >
You will be prompted about the changes
<br >
<br >

## Part D: Add your name to start.php array
### 1. Open in code editor
`repo/trunk/application/bootstrap/start.php`

### 2. Add new array
+ create array titled `your-name`
+ fill array with hostname of your machine
+ if on mac, add hostname.localhost to your new array as well

### 3. Open in code editor
`repo/trunk/application/config/database.php`

### 4. Open Sequel Pro / phpmyadmin
put database info into SQL, add (SHS) to name if added to Favorites

### 5. Export Database
File/Export Database and close session

### 6. Connect to localhost
Be sure xampp/mamp is running and open localhost

### 7. Add Database to localhost
+ Database/Add Database
    - Name: repo
    - Database Encoding: UTF-8 Unicode (utf8)

### 8. Open in code editor
`repo/trunk/application/config/your-name.database.php`

### 9. Enter Database Credentials
replace file with one array and fill it with the newly created database credentials