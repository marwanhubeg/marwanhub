#!/bin/bash

echo "🚀 رفع التغييرات إلى GitHub..."

# 1. التحقق من Git
if [ ! -d .git ]; then
    echo "⚙️  تهيئة مستودع Git جديد..."
    git init
    git checkout -b main
fi

# 2. إضافة جميع الملفات
echo "📦 إضافة الملفات..."
git add .

# 3. التحقق من التغييرات
CHANGES=$(git status --porcelain)
if [ -z "$CHANGES" ]; then
    echo "ℹ️  لا توجد تغييرات جديدة"
    exit 0
fi

# 4. إنشاء رسالة commit
COMMIT_MSG="🚀 تحديث Marwan Hub - $(date '+%Y-%m-%d %H:%M:%S')"
echo "💾 حفظ التغييرات: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# 5. التحقق من Remote
if ! git remote | grep -q origin; then
    echo "⚠️  لم يتم إضافة Remote"
    echo ""
    echo "🔗 لإضافة Remote وتوصيل GitHub:"
    echo "1. git remote add origin https://github.com/marwanhub/marwanhub.git"
    echo "2. git branch -M main"
    echo "3. git push -u origin main"
    echo ""
    echo "📌 أو استخدم GitHub CLI:"
    echo "gh repo create marwanhub/marwanhub --public --description 'Marwan Hub - مركز الحلول الرقمية'"
else
    # 6. رفع التغييرات
    echo "📤 رفع إلى GitHub..."
    if git push origin main; then
        echo "✅ تم الرفع بنجاح!"
        echo ""
        echo "🔗 روابط:"
        echo "- 📍 GitHub: https://github.com/marwanhub"
        echo "- 📄 المستودع: https://github.com/marwanhub/marwanhub"
    else
        echo "❌ فشل الرفع. تحقق من اتصال الإنترنت أو صلاحيات GitHub"
    fi
fi
