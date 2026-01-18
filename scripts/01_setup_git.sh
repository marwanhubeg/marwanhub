#!/bin/bash

echo "⚙️  إعداد Git Configuration..."

# التحقق من تثبيت Git
if ! command -v git &> /dev/null; then
    echo "📥 جاري تثبيت Git..."
    pkg install git -y
fi

# إعداد الاسم والبريد
git config --global user.name "Marwan Hub"
git config --global user.email "marwanhub.eg@gmail.com"

# إعدادات إضافية
git config --global init.defaultBranch main
git config --global color.ui true
git config --global pull.rebase false

echo "✅ تم إعداد Git بنجاح!"
echo ""
echo "📊 معلومات Git الحالية:"
git config --list | grep -E "(user\.name|user\.email)"
