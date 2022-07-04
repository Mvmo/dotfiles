script_executable_path=$HOME/.scripts/exec/
script_utility_path=$HOME/.scripts/util/

## -- EXECUTABLE SCRIPTS -- ##
executable_scripts=$(find $script_executable_path -type f -name '*.sh' -not -name '*.sh.swp' | sed 's/^.*\///g' | sed 's/\.sh$//g')

for script in $executable_scripts; do
    alias "$(basename ${script%.sh})"="$script"
done

s() {
    to_execute=$(echo $executable_scripts | fzf)
    bash $HOME/.scripts/exec/$to_execute.sh
}

## -- EXECUTABLE SCRIPTS -- ##

## -- UTILITY SCRIPTS -- ##

utility_scripts=$(find $script_utility_path -type f -name '*.sh' -not -name '*.sh.swp')
for script in $utility_scripts; do
    source $script
done

## -- UTILITY SCRIPTS -- ##