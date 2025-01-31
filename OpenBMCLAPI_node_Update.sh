#!/bin/bash
echo "开始运行云望IT-OpenBMCLAPI自动更新程序..."
echo "由云望IT提供Github加速Proxy"
if [ "$(pwd)" = "/" ]; then
  echo "Error：禁止在根目录运行此脚本 请传递正确的工作目录参数后重试..." >&2
  exit 1
fi
if [ -z "$1" ]; then
  echo "未指定工作目录，将使用程序当前运行目录。"
  WORK_DIR=$(pwd)
else
  WORK_DIR="$1"
fi
echo "使用的工作目录为: ${WORK_DIR}"
cd "${WORK_DIR}"
echo "正在删除旧版本文件..."
find . -maxdepth 1 ! -name '.env' ! -name 'cache' ! -name '.' ! -name '..' -exec rm -rf {} +
echo "旧版本文件删除成功！"
echo "正在拉取更新包..."
curl -L https://github.yun-wang.top/https://github.com/bangbang93/openbmclapi/releases/latest/download/openbmclapi-linux.tar.xz -o "${WORK_DIR}/openbmclapi-linux.tar.xz"
echo "拉取更新包成功！"
echo "正在解压更新包..."
tar -xvf "${WORK_DIR}/openbmclapi-linux.tar.xz" -C "${WORK_DIR}"
echo "更新包解压完成！"
echo "正在清理更新残余文件..."
rm -f "${WORK_DIR}/openbmclapi-linux.tar.xz"
echo "更新残余文件清理完成！"
echo "更新程序执行完成，OpenBMCLAPI_Node 已经更新并解压到指定的工作目录 ${WORK_DIR}";
