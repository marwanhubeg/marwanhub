#!/bin/bash

echo "🖥️  فحص النظام..."
echo "========================"

echo "📊 معلومات النظام:"
echo "- نظام التشغيل: $(uname -o)"
echo "- النواة: $(uname -r)"
echo "- المستخدم: $(whoami)"
echo ""

echo "🛠️  الأدوات المثبتة:"
tools=("git" "gh" "bash" "curl" "wget")
for tool in "${tools[@]}"; do
    if command -v "$tool" &> /dev/null; then
        echo "  ✅ $tool"
    else
        echo "  ❌ $tool"
    fi
done
echo ""

echo "📁 حالة المجلدات:"
echo "- المجلد الحالي: $(pwd)"
echo "- محتويات المجلد:"
ls -la
