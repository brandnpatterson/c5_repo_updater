# --
# -- shs-repo-updater
# --
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

# --
# -- cloudforge
# --
svn_co_immediates () {
    if [[ -z "$1" ]]; then
        echo 'Error: Repo Must Be Defied'
        echo 'https://app.cloudforge.com/'
    else
        svn co "$1" --depth immediates
    fi
}

set_depth_trunk () {
    if [[ -z "$1" ]]; then
        echo 'Error: Repo Must Be Defied'
        echo 'https://app.cloudforge.com/'
    else
        svn up --set-depth infinity "$1/trunk"
    fi
}

# --
# -- svn:help
# --
svn_help () {
    printf "svn:coi     co --depth immediates
svn:sdt     --set-depth infinity trunk
branch: svn up --set-depth infinity branches/branch
"
}
alias svn:help="svn_help"
alias svn:h="svn:help"
alias svn:coi="svn_co_immediates $1"
alias svn:sdt="set_depth_trunk $1"

# -- svn revert
alias svn:rev="svn revert conf/conf.php && svn revert index.php"
