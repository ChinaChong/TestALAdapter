#!/bin/bash

# ===============修改podspec的版本号===========================

PodName="SinoTestShell"

echo "\n🔫当前版本号："
# 打印一下当前情况
sed -n '/Mark/ p' $PodName.podspec

# 提示输入版本号
echo "\n🔫请输入即将发布的版本号："

# 接收终端输入的参数
read verNum

# 打印参数
echo "\n🔫输入的是：$verNum"

# 使用sed进行替换 把1-5行的 数字.数字.数字 替换为1.4.3。保存到临时文件。
#sed "1,5 s/[0-9].[0-9].[0-9]/$verNum/" ShellTest.podspec > Temp.podspec
# 可以不指定行号 而是去匹配标记行，在行尾的注释中做标记
sed "/Mark/ s/[0-9].[0-9].[0-9]/$verNum/" $PodName.podspec > Temp.podspec

# 删除源文件
rm $PodName.podspec

# 修改临时文件名为源文件名
mv Temp.podspec $PodName.podspec

echo "\n🔫修改完毕"
sed -n '/Mark/ p' $PodName.podspec

# ===============验证语法============================

# 加不加--skip-import-validation

echo "\n🔫开始验证podspec文件语法"
checkRes=`pod spec lint $PodName.podspec`
checkKey="$PodName.podspec passed validation."

echo "🔫$checkRes"

if [[ $checkRes =~ $checkKey ]]
then
    # 包含
    echo "\n\n🔫验证通过，开始上传pod..."
    
# ===============正式上传============================

    pushRes=`pod trunk push $PodName.podspec`
    # 打印上传结果
    echo "\n🔫$pushRes\n\n"
    # 根据上传结果判断是否继续
    echo "🔫是否继续[y/n]"
    read stillContinue
    if [[ "$stillContinue" == "y" ]]
    then

# ===============重置索引============================

        echo "🔫开始setup\n\n"
        pod setup
        echo "🔫开始删除原索引\n\n"
        rm ~/Library/Caches/CocoaPods/search_index.json
        echo "🔫开始search\n\n"
        searchRes=`pod search $PodName`
        echo "$searchRes"
    fi

else
    # 不包含
    echo "\n\n🔫验证未通过"
fi
