#!/bin/bash

P=/home/priyank/vinsol_exercises_priyank_gupta/shell_scripting/backup

tar -czvf "$P/project_backups/backup_$( date +'%d_%m_%y_%H%M' ).tar.gz" "$P/project"
