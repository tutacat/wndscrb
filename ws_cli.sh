#!/bin/bash
case $1 in
  c*)
    set a=connect ;
    shift ;;
  dc*|di*)
    set a=disconnect ;
    shift ;;
  fw*|fi*)
    set a=firewall ;
    shift ;;
  rc|recon*)
    command windscribe-cli disconnect &&
      command windscribe-cli connect &&
      return 0 ||
      return 1
    ;;
  lc*|lo*)
    set a=locations ;
    shift ;;
  h*|*)
    command windscribe-cli help;
    return 1 ;;
esac
command windscribe-cli $a $@
