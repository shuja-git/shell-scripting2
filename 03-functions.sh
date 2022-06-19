#!/bin/bash

function sample() {
  echo one
  echo two
}
sample1(){
  echo three
  echo four
}

sample
sample1

sample2(){
  echo first argument = $1
  echo Numbr of arguments = $#
  echo value of a in function = ${a}
  b=200
}
a=100
sample2 123 abc
echo value of b = ${b}