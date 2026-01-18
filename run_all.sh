#!/bin/bash

# ============================================
# 🚀 Marwan Hub GitHub Setup - السكربت الرئيسي
# ============================================

echo ""
echo "╔════════════════════════════════════════════╗"
echo "║      🚀 Marwan Hub GitHub Setup          ║"
echo "║      مركز الحلول الرقمية المتكاملة       ║"
echo "╚════════════════════════════════════════════╝"
echo ""

# التحقق من الموقع
CURRENT_DIR=$(pwd)
echo "📁 المجلد الحالي: $CURRENT_DIR"
echo ""

# إنشاء مجلد السكربتات
echo "🔧 إنشاء مجلد السكربتات..."
mkdir -p scripts

# ============================================
# 1. سكربت إعداد Git
# ============================================
echo "📦 إنشاء 01_setup_git.sh..."
cat > scripts/01_setup_git.sh << 'EOF'
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
EOF

# ============================================
# 2. سكربت تحديث README
# ============================================
echo "📝 إنشاء 02_update_readme.sh..."
cat > scripts/02_update_readme.sh << 'EOF'
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
EOF

# ============================================
# 3. سكربت رفع التغييرات
# ============================================
echo "📤 إنشاء 03_push_changes.sh..."
cat > scripts/03_push_changes.sh << 'EOF'
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
EOF

# ============================================
# 4. سكربت إنشاء المستودعات
# ============================================
echo "📁 إنشاء 04_create_repos.sh..."
cat > scripts/04_create_repos.sh << 'EOF'
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
EOF

# ============================================
# 5. سكربت التحديث اليومي
# ============================================
echo "🔄 إنشاء 06_daily_update.sh..."
cat > scripts/06_daily_update.sh << 'EOF'
#!/bin/bash

echo "📅 تحديث يومي - $(date '+%Y-%m-%d')"

# تحديث ملف السجل
echo "### $(date '+%Y-%m-%d %H:%M:%S')" >> daily_log.md
echo "- ✅ تم التحديث التلقائي" >> daily_log.md
echo "" >> daily_log.md

echo "📝 تم تسجيل التحديث في daily_log.md"
EOF

# ============================================
# 6. سكربت فحص النظام
# ============================================
echo "🔍 إنشاء 07_check_system.sh..."
cat > scripts/07_check_system.sh << 'EOF'
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
EOF

# منح صلاحيات التنفيذ
echo "🔐 منح صلاحيات التنفيذ..."
chmod +x scripts/*.sh

# ============================================
# عرض النتيجة النهائية
# ============================================
echo ""
echo "🎉 اكتمل إنشاء جميع السكربتات!"
echo "================================"
echo ""
echo "📂 محتويات مجلد scripts/:"
ls -la scripts/
echo ""
echo "🚀 أوامر التشغيل:"
echo "1. إعداد Git:        ./scripts/01_setup_git.sh"
echo "2. تحديث README:     ./scripts/02_update_readme.sh"
echo "3. رفع التغييرات:    ./scripts/03_push_changes.sh"
echo "4. إنشاء مستودعات:   ./scripts/04_create_repos.sh"
echo "5. تحديث يومي:       ./scripts/06_daily_update.sh"
echo "6. فحص النظام:       ./scripts/07_check_system.sh"
echo ""
echo "📞 للدعم: marwanhub.eg@gmail.com"
echo ""
