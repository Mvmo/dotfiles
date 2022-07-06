script_executable_path=$HOME/.scripts/exec.d/

# load all executable scripts in the exec.d directory to list them in the fuzzy finder and add an alias to them
executable_scripts=$(find $script_executable_path -type f -name '*.sh' -not -name '*.sh.swp' | sed 's/^.*\///g' | sed 's/\.sh$//g')

for script in $executable_scripts; do
    echo $script
    alias "$(basename ${script%.sh})"="$script"
done

s() {
    to_execute=$(echo $executable_scripts | fzf)
    bash $script_executable_path$to_execute.sh
}

# source all utility scripts
if [ -d $HOME/.scripts/util.d ]; then
  for file in $HOME/.scripts/util.d/*.sh; do
    source $file
  done
fi