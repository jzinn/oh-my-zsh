_rake_does_task_list_need_generating () {
  if [ ! -f .rake_tasks~ ]; then return 0;
  else
    accurate=$(stat -f%m .rake_tasks~)
    changed=$(stat -f%m Rakefile)
    return $(expr $accurate '>=' $changed)
  fi
}

_rake () {
  if [ -f Rakefile ]; then
    if _rake_does_task_list_need_generating; then
      echo "\nGenerating .rake_tasks~..." > /dev/stderr
      rake --silent --tasks | cut -d " " -f 2 > .rake_tasks~
    fi
    compadd `cat .rake_tasks~`
  fi
}

compctl -K _rake rake

_cap_does_task_list_need_generating () {
  if [ ! -f .cap_tasks~ ]; then
    return 0;
  else
    accurate=$(stat -f%m .cap_tasks~)
    changed=$(stat -f%m config/deploy.rb)
    return $(expr $accurate '>=' $changed)
  fi
}

_cap () {
  if [ -f config/deploy.rb ]; then
    if _cap_does_task_list_need_generating; then
      echo "\nGenerating .cap_tasks~..." > /dev/stderr
      cap -vT | awk 'FB != 1 {if ($0 ~ /^$/){FB=1}else{print $2}}' > .cap_tasks~
    fi
    compadd `cat .cap_tasks~`
  fi
}

compdef _cap cap
