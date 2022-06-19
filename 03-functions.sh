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
  first argument =$1
  Numbr of arguments = $#

}
sample2 123 abc