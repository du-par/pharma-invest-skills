#!/bin/bash
#
# 怀格杜Par 医药投资 Hermes Agent Skill 包 — 一键安装脚本
# 作者：杜江波博士（怀格资本）
#
set -e

SKILLS_DIR="${HOME}/.hermes/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=============================="
echo "🧬 怀格杜Par 医药投资 Skill 包"
echo "=============================="
echo ""

# 检查 Hermes 是否已安装
if [ ! -d "${HOME}/.hermes" ]; then
  echo "⚠️  未检测到 ~/.hermes 目录，请先安装 Hermes Agent"
  echo "   https://github.com/NousResearch/hermes-agent"
  exit 1
fi

# 创建 skills 目录
mkdir -p "${SKILLS_DIR}"

# 安装 pharma-eval
if [ -d "${SCRIPT_DIR}/pharma-eval" ]; then
  echo "📦 安装 pharma-eval（医药项目深度投资评估）..."
  cp -r "${SCRIPT_DIR}/pharma-eval" "${SKILLS_DIR}/"
  echo "   ✅ pharma-eval 安装完成"
else
  echo "   ⚠️  未找到 pharma-eval 目录，跳过"
fi

# 安装 pharma-asset-strategist
if [ -d "${SCRIPT_DIR}/pharma-asset-strategist" ]; then
  echo "📦 安装 pharma-asset-strategist（新药价值评估模型 3.0）..."
  cp -r "${SCRIPT_DIR}/pharma-asset-strategist" "${SKILLS_DIR}/"
  echo "   ✅ pharma-asset-strategist 安装完成"
else
  echo "   ⚠️  未找到 pharma-asset-strategist 目录，跳过"
fi

echo ""
echo "=============================="
echo "🎉 安装成功！"
echo "=============================="
echo ""
echo "请重启 Hermes Agent 即可使用。"
echo ""
echo "快速使用："
echo "  1. pharma-eval：上传BP后说 \"@项目评估\""
echo "  2. pharma-asset-strategist：描述管线后触发对话"
echo ""
