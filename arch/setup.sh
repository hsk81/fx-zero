#!/bin/bash

TAR=${1-"build"} # target directory or empty
cd $TAR ;

## ###########################################################################
PF=django-* ; cd $PF/ ; ## requires: python, sqlite
## ###########################################################################

sudo python setup.py install ;
if [ $? != 0 ] ; then exit ; fi ; cd .. ;

## ###########################################################################
PF=zeromq-* ; cd $PF/ ; ## requires: gcc
## ###########################################################################

./configure && make && sudo make install && sudo ldconfig ;
if [ $? != 0 ] ; then exit ; fi ; cd .. ;

## ###########################################################################
PF=pyzmq-* ; cd $PF/ ; ## requires: python-dev headers & easy_install
## ###########################################################################

sudo easy_install pyzmq ;
if [ $? != 0 ] ; then exit ; fi ; cd .. ;

## ###########################################################################
PF=zeromq-jzmq-* ; cd $PF/ ; ## requires: JAVA_HOME=$JDK ; export JAVA_HOME
## ###########################################################################

./autogen.sh && ./configure && make && sudo make install && sudo ldconfig ;
if [ $? != 0 ] ; then exit ; fi ; cd .. ;

## ###########################################################################
## ###########################################################################

cd .. ;