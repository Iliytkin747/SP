#!/bin/bash

clear
echo "-------------------------------------------------------------------------"
echo "       A skript for finding a repository and automatic swithing status"
echo "------------------------------------------------------------------------"
echo "The programm displays a list of all repositories, asks to choose a repository from list and swithing status"
echo ""
echo "                         Creator: Makxim Iliutkin"
echo "-------------------------------------------------------------------------"

function first
{
        var="$(grep -m1 'enabled=' /etc/yum.repos.d/amzn2-core.repo)"
        echo "$var" 
        if [ "$var"  = 'enabled=0' ]
        then 
             	yum-config-manager --enable  "Amazon Linux 2 core repository"
                echo "" 
                echo "Status has been change to 'enabled'!"
                echo ""
        else
            	yum-config-manager --disable  "Amazon Linux 2 core repository" 
                echo ""
                echo "Status has been change to 'disabled'!"
                echo ""
                fi 
}

function second
{
        var="$(grep -m2 'enabled=' /etc/yum.repos.d/amzn2-core.repo | tail -1)"
        echo "$var" 
        if [ "$var"  = 'enabled=0' ]
        then 
             	yum-config-manager --enable  "Amazon Linux 2 core repository - source packages" 
                echo "" 
                echo "Status has been change to 'enabled'!"
                echo ""
        else
            	yum-config-manager --disable  "Amazon Linux 2 core repository - source packages"
                echo ""
                echo "Status has been change to 'disabled'!"
                echo ""
        fi 
}

function third
{
        var="$(grep -m3 'enabled=' /etc/yum.repos.d/amzn2-core.repo | tail -1)"
        echo "$var" 
        if [ "$var"  = 'enabled=0' ]
        then 
             	yum-config-manager --enable  "Amazon Linux 2 core repository - debuginfo packages" 
                echo "" 
                echo "Status has been change to 'enabled'!"
                echo ""
        else
            	yum-config-manager --disable  "Amazon Linux 2 core repository - debuginfo packages"
                echo ""
                echo "Status has been change to 'disabled'!"
                echo ""
        fi 
}

while true
 	do
	{
                yum repolist all
                while true
                do
                { 
                  	echo "Repositories:"
                        echo "1) Amazon Linux 2 core repository"
                        echo "2) Amazon Linux 2 core repository - source packages"
                        echo "3) Amazon Linux 2 core repository - debuginfo packages"
                        echo "Select a repository: (1/2/3):"
                        read temp
                        case "$temp" in 
                                "1") first; break;;
                                "2") second; break;;
                                "3") third; break;;
                                *) echo "Input error"  >/dev/stderr;; 
                        esac
                }
                done
                while true
                do
                {
                        yum repolist all
                        echo "Close the program? (y/n)"
                        read temp
                        case "$temp" in 
                                "Y" | "y") echo "The program has been disabled!"; exit ;;
                                "N" | "n") echo ""; break;;
                                *) echo "Input error"  >/dev/stderr;; 
                         esac
                }
                done
        }
	done
