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
    # -- copy local environment files from emergenc    
    repo=$1
    name=$2
    config="trunk/application/config"

    # -- If user input contains "/", remove it
    if [[ $1 =~ '/'$ ]]; then
        repo=${repo::${#repo}-1}
    fi

    # -- filepaths
    updates="$repo/trunk/updates"
    doctrine="$repo/$config/doctrine"
    update_php="$repo/$config/update.php"
    name_database="$repo/$config/$2.database.php"

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
    
    if [[ -z "$2" ]]; then
        printf "Error: Did not copy database.php -> your-name.database.php
You must supply 3 arguments when running the update command
    1. update
    2. the repo you are updating
    3. your name\n\n"
    
    else
        copy_file "$repo/$config/database.php" $name_database
    fi

    copy_directory "emergenc/trunk/updates" $updates
    copy_directory "emergenc/$config/doctrine" $doctrine
    copy_file "emergenc/$config/update.php" $update_php
}

alias set777="cd ~/www/emergenc/trunk && set_permissions"
alias update="update_files $1 $2"