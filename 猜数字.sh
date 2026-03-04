#!/bin/bash

# ========================================
#        Bash 猜数字游戏
# ========================================

# 生成 1-100 的随机整数
secret=$((RANDOM % 100 + 1))
attempts = 0

# 清屏（可选，提升体验）
clear

echo "=========================================="
echo "        🎮 欢迎来到猜数字游戏！🎮"
echo "=========================================="
echo "💡 我已想好一个 1 到 100 之间的整数"
echo "💡 输入 'q' 可随时退出游戏"
echo "=========================================="
echo ""

while true  ; do
    read -p "❓ 请输入你的猜测 (1-100): " guess

    # 处理退出指令（支持 q/quit/Q）
    if [[ "$guess" =~ ^[Qq]$ || "$guess" == "quit" || "$guess" == "QUIT" ]]; then
        echo -e "\n👋 游戏已退出。正确答案是: $secret"
        exit 0
    fi

    # 验证是否为数字
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "❌ 错误：请输入有效的整数（1-100）或 'q' 退出"
        continue
    fi

    # 验证范围
    if ((guess < 1 || guess > 100)); then
        echo "❌ 错误：数字必须在 1 到 100 之间！"
        continue
    fi

    ((attempts++))

    # 判断结果
    if ((guess < secret)); then
        echo "📉 太小了！再试一次～"
    elif ((guess > secret)); then
        echo "📈 太大了！再试一次～"
    else
        echo -e "\n=========================================="
        echo "🎉 恭喜你！猜对了！🎉"
        echo "✅ 正确答案是: $secret"
        echo "🎯 你总共尝试了 $attempts 次"
        echo "=========================================="
        break
    fi
    echo ""
done
