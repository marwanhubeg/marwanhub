#!/bin/bash

echo "🎨 بناء README.md احترافي..."

# إنشاء مجلد القوالب إذا لم يكن موجوداً
mkdir -p templates/readme

# إذا لم يوجد قالب، أنشئ واحداً بسيطاً
if [ ! -f templates/readme/full_template.md ]; then
    echo "📝 إنشاء قالب جديد..."
    cat > templates/readme/full_template.md << 'TEMPLATE'
# 🚀 Marwan Hub | مركز الحلول الرقمية

## 👋 مرحباً بكم

نحن **Marwan Hub**، مركز متكامل للحلول الرقمية نقدم حلولاً شاملة للشركات.

## 📞 تواصل معنا
📧 marwanhub.eg@gmail.com

---
© {{CURRENT_YEAR}} Marwan Hub
TEMPLATE
fi

# نسخ القالب
cp templates/readme/full_template.md README.md

# استبدال المتغيرات
CURRENT_DATE=$(date '+%Y-%m-%d')
CURRENT_YEAR=$(date +%Y)
CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')

sed -i "s/{{UPDATE_DATE}}/$CURRENT_DATE/g" README.md
sed -i "s/{{CURRENT_YEAR}}/$CURRENT_YEAR/g" README.md
sed -i "s/{{UPDATE_TIME}}/$CURRENT_TIME/g" README.md

echo "✅ تم تحديث README.md بنجاح!"
echo "📅 التاريخ: $CURRENT_TIME"
