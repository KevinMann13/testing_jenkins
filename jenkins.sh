#!/bin/bash

# source this script to build and enter virtualenv for Jenkins job workspaces
# 1. supply a requirements.txt file at the root of your workspace
# 2. supports secrets files

export PATH
export CLASSPATH
export WORKSPACE

# Utility function for manipulating path list variables.
#
# - $1 :: the path to add
# - $2 :: the name of the list (default ``PATH'')
# - $3 :: if ``after'' the path will be added to the end of the list
# add_to_list () {
#     case :$(eval "echo \$${2:-PATH}"): in
#             *:"$1":*)
#                 true
#                 ;;
#             *)
#                 if [ 'after' = "$3" ]
#                 then
#                     eval "${2:-PATH}=\"\$${2:-PATH}:$1\""
#                 else
#                     eval "${2:-PATH}=\"$1:\$${2:-PATH}\""
#                 fi
#                 ;;
#     esac
# }
#
# # Configures Java CLASSPATH to include Teradata JDBC drivers.
# add_to_list "${WORKSPACE}/lib/terajdbc4.jar" CLASSPATH
# add_to_list "${WORKSPACE}/lib/tdgssconfig.jar" CLASSPATH
# add_to_list "${WORKSPACE}/lib/jisql-2.0.7.jar" CLASSPATH

delete_venv () {
    rm -rf venv
}

build_venv () {
    virtualenv --system-site-packages venv
}

[ -n "${REBUILD_VENV}" ] && delete_venv && build_venv ;
[ ! -f "venv/bin/activate" ] && build_venv ;

. venv/bin/activate

# update to a pip that can support the wheel distribution format

# install requirements
pip install -r requirements.txt
