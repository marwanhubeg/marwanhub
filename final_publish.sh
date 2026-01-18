#!/bin/bash

echo "🚀 النشر النهائي لـ Marwan Hub..."

# 1. الحصول على اسم المستخدم
USERNAME="marwanhubeg"
echo "👤 نشر كـ: $USERNAME"

# 2. إنشاء المستودع
echo "📦 إنشاء المستودع..."
if gh repo create "$USERNAME/marwanhub" \
    --public \
    --description "Marwan Hub - مركز الحلول الرقمية المتكاملة" \
    --homepage "https://$USERNAME.github.io" \
    --confirm; then
    echo "✅ تم إنشاء المستودع"
else
    echo "⚠️  المستودع موجود بالفعل"
fi

# 3. ربط Git
echo "🔗 ربط Git..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/$USERNAME/marwanhub.git"

# 4. رفع الملفات
echo "📤 رفع الملفات..."
git add .
git commit -m "🚀 Marwan Hub Official Launch - $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null || echo "No new changes"
git branch -M main
git push -u origin main --force

echo ""
echo "🎉 تم النشر بنجاح!"
echo "🔗 الروابط:"
echo "• 📍 GitHub Profile: https://github.com/$USERNAME"
echo "• 📂 المستودع: https://github.com/$USERNAME/marwanhub"
echo "• 🌐 الصفحة: https://$USERNAME.github.io"
echo ""
echo "✅ Marwan Hub الآن على GitHub!"
