#!/bin/bash
clone_repository(){ 
while IFS='' read -r l || [ -n "$l" ]; do
 # cd remote_repositories
  git clone "$l" remote_repositories | sed '$!d;s_.*=[^/]*/\([^/]*\)/.*_\1_'
#  cd ..
done < "repository-list.txt"
}
# clone files from repositories 

check_latest_commit(){
v=$(grep -o -P '(?<=https://github.com).*(?=git)' "repository-list.txt")
echo "$v"
v1=$(echo "$v" | grep -o -P '(?<=/).*(?=/)')
echo "$v1"
v2=$(echo "$v" | grep -o -P "(?<=$v1/).*(?=.)")
echo "$v2"

cd remote_repositories
cd sample $v2
git status 
git fetch "$v2"
git merge "$v2"
cd ..
cd ..
}
# parameters:
#  $1: 복제된repository의organization name
#  $2: 복제된repository의repository name#
#echo $1
# repository의디렉토리에서git 명령어로fetch실시
# Feature branch에새로운commit이있으면
# origin/feature를local Feature에merge


#auto_testing(){}
#echo $1
# parameters:
#  $1: 복제된repository의organization name
#  $2: 복제된repository의repository name#
 # 복제된repository 내부의cicd-setting.txt에서
# Build 명령어, Run 명령어, Input, output, error,
 # time_out데이터를읽음
# Build 명령어로code를build 및Run 명령어로
# execute하고output or error 를확인
# error 발생시, error_flag1로바꾸고errorlog file로저장
# test 완료-> call merge_brachfunction with error_flag

#merge_branch(){}
#echo $1
# parameters:
#  $1: 복제된repository의organization name
#  $2: 복제된repository의repository name
#  $3: error_flag# 
# 복제된repository의token을tokens/ 에서읽음
# error_flag1 -> error log file을feature에push
# error_flag0 -> master에feature을merge하고push
# github에push할때token의github_id, token을활용
#testy
#
#============
# main  script 
cd remote_repositories
#git init
cd ..
clone_repository
#check_latest_commit
