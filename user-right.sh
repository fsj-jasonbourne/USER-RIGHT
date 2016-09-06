#!/bin/bash
# 系统用户权限发生改变---user_right_change
# 系统用户组权限发生改变---group_right_change
# 系统用户增加---user_add
# 系统用户减少---user_del
# 系统用户组增加---group_add
# 系统用户组减少---group_del
# 系统用户状态发生改变---user_state_change

user_name="usertest"

function user_right_change()
{
    for (( i=1;i<100;i++ ))
    do 
    {
        userdate=`date +%Y-%m-%d-%H:%M:%S`
        usermod -g ${user_name}${i}  ${user_name}${i+1} 
        echo "usermod -g  ${user_name}${i}-----${userdate}-----${i}" >> /home/fsj/moduser.dat
        sleep 30
    }
    done
}

function group_right_change()
{
    for (( i=1;i<100;i++ ))
    do 
    {
        userdate=`date +%Y-%m-%d-%H:%M:%S`
        usermod -G ${user_name}${i}  ${user_name}${i+1} 
        echo "usermod -G ${user_name}${i}-----${userdate}-----${i}" >> /home/fsj/modgroup.dat
        sleep 30
    }
    done
}

function user_add()
{
    for (( i=1;i<100;i++ ))
    do 
    {
        userdate=`date +%Y-%m-%d-%H:%M:%S`
        useradd ${user_name}${i} 
        echo "add ${user_name}${i}-----${userdate}-----${i}" >> /home/fsj/adduser_group.dat
        sleep 30
    }
    done
}

function user_del()
{
    for (( i=1;i<100;i++ ))
    do 
    {
        userdate=`date +%Y-%m-%d-%H:%M:%S`
        userdel ${user_name}${i} 
        echo "del ${user_name}${i}-----${userdate}-----${i}" >> /home/fsj/deluser_group.dat
        sleep 30
    }
    done
}

function group_add()
{
    #same as user_add
    echo "aa"
}

function group_del()
{
    #same as group_add
    echo "aa"
}

function user_state_change()
{
    for (( i=1;i<100;i++ ))
    do 
    {
        userdate=`date +%Y-%m-%d-%H:%M:%S`
        usermod -L  userdel ${user_name}
        echo "lock ${user_name}${i}-----${userdate}-----${i}" >> /home/fsj/deluser.dat
	sleep 3
        usermod -U  userdel ${user_name}
        echo "unlock ${user_name}${i}-----${userdate}-----${i}" >> /home/fsj/deluser.dat
        sleep 30
    }
    done

}

function Main()
{
    #增加用户/用户组
    user_add
    #改变用户属性
    user_right_change
    #改变用户组属性
    group_right_change
    #改变用户状态
    user_state_change
    #删除用户/用户组
    user_del
}

Main
