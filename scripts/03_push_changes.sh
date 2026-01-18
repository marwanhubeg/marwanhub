#!/bin/bash

echo "🚀 رفع التغييرات إلى GitHub..."

# التحقق من Git
if [ ! -d .git ]; then
    echo "⚙️  جاري تهيئة Git..."
    git init
fi

# إضافة الملفات
git add .

# التحقق من التغييرات
if git diff --cached --quiet; then
    echo "ℹ️  لا توجد تغييرات جديدة"
else
    echo "💾 جاري حفظ التغييرات..."
    git commit -m "📅 تحديث: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # التحقق من Remote
    if ! git remote | grep -q origin; then
        echo "⚠️  لم يتم إضافة Remote"
        echo "🔗 لإضافة Remote:"
        echo "git remote add origin https://github.com/marwanhub/marwanhub.git"
    else
        echo "📤 جاري الرفع..."
        git push origin main
        echo "✅ تم الرفع بنجاح!"
    fi
fi
