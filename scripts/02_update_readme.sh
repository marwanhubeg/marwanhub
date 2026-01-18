#!/bin/bash

echo "🎨 تحديث README.md..."

# إنشاء قالب README إذا لم يكن موجوداً
if [ ! -f templates/README_template.md ]; then
    mkdir -p templates
    cat > templates/README_template.md << 'TEMPLATE'
# 🚀 Marwan Hub | مركز الحلول الرقمية

## 👋 مرحباً بكم

نحن **Marwan Hub**، مركز متكامل للحلول الرقمية نقدم:
- 🌐 تصميم وتطوير المواقع
- 📱 تطبيقات الجوال والويب  
- 🎯 التسويق الإلكتروني
- 🔧 حلول برمجية مخصصة

## 📞 تواصل معنا
📧 marwanhub.eg@gmail.com

## 📊 إحصائيات
![GitHub Stats](https://github-readme-stats.vercel.app/api?username=marwanhub)

---
© $(date +%Y) Marwan Hub
TEMPLATE
    echo "✅ تم إنشاء قالب README"
fi

# نسخ القالب إلى README.md
cp templates/README_template.md README.md
echo "📄 تم تحديث README.md"
