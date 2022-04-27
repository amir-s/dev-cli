export DEV_CLI_BIN_PATH="<$SHELL_BIN_PATH$>"

<$SHELL_FN_NAME$> () {
  exec 3>&1
  output=$(<$SHELL_BIN_PATH$> $* 2>&1 1>&3) 
  exec 3>&-
  
  if [[ ! -z "$output" ]] && [[ $output == COMMAND* ]]; then
    command=$(echo "$output" | cut -c 9-)
    eval "$command"
  else
    echo "$output"
  fi
  return 0
}
