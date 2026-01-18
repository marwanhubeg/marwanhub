#!/bin/bash

echo "🏗️  إنشاء المستودعات..."

# التحقق من GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "📦 GitHub CLI غير مثبت"
    echo "🔗 للتثبيت: pkg install gh"
    exit 1
fi

# التحقق من تسجيل الدخول
if ! gh auth status &> /dev/null; then
    echo "🔐 يرجى تسجيل الدخول:"
    gh auth login
fi

echo "📋 قائمة المستودعات المقترحة:"
echo "1. marwanhub-website"
echo "2. ecommerce-template"
echo "3. marketing-tools"
echo ""
echo "📌 لإنشاء مستودع: gh repo create marwanhub/اسم-المستودع"
