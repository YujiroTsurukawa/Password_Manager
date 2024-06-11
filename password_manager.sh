#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while true ; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"; read input
  case $input in
  "Add Password" )
     echo "サービス名を入力してください:"; read service_name
     echo "ユーザー名を入力してください:"; read user_name
     echo "パスワードを入力してください:"; read user_password
     echo "パスワードの追加は成功しました。"
     echo "$service_name $user_name $user_password" > "$service_name".txt
  ;;  
  "Get Password" )
     echo "サービス名を入力してください:"; read service_name
     array=($(cat $service_name.txt))
     const=("サービス名:${array[0]}" "ユーザー名:${array[1]}" "パスワード:${array[2]}")

     for i in ${const[@]}; do
        echo "$i"
     done
  ;;
  "Exit" )
     echo "Thank you!"
     break
  ;;
  * )
     echo "入力が間違えています。Add Password/Get Password/Exit から入力してください:"
  ;;
  esac
done
