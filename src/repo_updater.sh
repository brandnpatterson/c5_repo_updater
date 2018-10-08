##
## -- c5_repo_updater
##

set_permissions () {
    # -- set local permissions for emergenc/trunk
    packages="packages"
    app_files="application/files"
    app_config="application/config"
    updates="updates"

    chmod 777 $packages
    chmod 777 $app_files
    chmod 777 $app_config
    chmod 777 $updates

    printf "chmod 777 has been run on the following directories:
    $packages
    $app_files
    $app_config
    $updates\n"
}

update_files () {
    repo=$1
    read -p "Enter branch: " branch
    read -p "Enter name: " name

    # -- If user input contains "/", remove it
    if [[ $repo =~ '/'$ ]]; then
        repo=${repo::${#repo}-1}
    fi

    copy_directory () {
        if [[ ! -d $2 ]]; then
            cp -R $1 $2
            echo "Created: $2"
        else
            echo "Exists: $2"
        fi
    }

    copy_file () {
        if [[ ! -f $2 ]]; then
            cp $1 $2
            echo "Created: $2"
        else
            echo "Exists: $2"
        fi
    }
    
    if [[ -z "$name" ]]; then
        printf "Error: Did not copy database.php -> your-name.database.php
You must supply 3 arguments when running the update command
    1. update
    2. the repo you are updating
    3. your name\n\n"

    elif [[ ! -f "$repo/$branch/application/config/$name.database.php" ]]; then
        printf "<?php
return array(
    'default-connection' => 'concrete',
    'connections' => array(
        'concrete' => array(
            'driver' => 'c5_pdo_mysql',
            'server' => 'localhost',
            'database' => '$repo',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8'
        )
    )
);" >> "$repo/$branch/application/config/$name.database.php"
        echo "Created: $repo/$branch/application/config/$name.database.php"
    else
        echo "Exists: $repo/$branch/application/config/$name.database.php"
    fi

    copy_directory "emergenc/trunk/updates" "$repo/$branch/updates"
    copy_directory "emergenc/trunk/application/config/doctrine" "$repo/$branch/application/config/doctrine"
    copy_file "emergenc/trunk/application/config/update.php" "$repo/$branch/application/config/update.php"
}

alias update="update_files $1"

alias set777="cd ~/www/emergenc/trunk && set_permissions"
