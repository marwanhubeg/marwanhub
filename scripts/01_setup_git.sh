#!/bin/bash

echo "⚙️  إعداد Git لمشروع Marwan Hub..."

# 1. التحقق من Git
if ! command -v git &> /dev/null; then
    echo "📦 تثبيت Git..."
    pkg install git -y
fi

# 2. إعداد الاسم والبريد
git config --global user.name "Marwan Hub"
git config --global user.email "marwanhub.eg@gmail.com"

# 3. إعدادات متقدمة
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global core.autocrlf false
git config --global pull.rebase false
git config --global credential.helper store

# 4. إنشاء ملف .gitignore شامل
cat > .gitignore << 'GITIGNORE'
# نظام
.DS_Store
Thumbs.db
*.swp
*.swo

# بيئات التطوير
.vscode/
.idea/
*.swp

# تبعيات
node_modules/
__pycache__/
*.pyc
.env
.env.local

# ملفات البناء
dist/
build/
*.exe
*.dll

# سجلات
*.log
logs/
GITIGNORE

# 5. تهيئة Git إذا لم تكن مهيأة
if [ ! -d .git ]; then
    git init
    echo "✅ تم تهيئة مستودع Git جديد"
fi

# 6. عرض الإعدادات
echo ""
echo "📊 إعدادات Git الحالية:"
echo "========================="
git config --list | grep -E "(user\.|init\.|color\.|core\.)"
echo "========================="
echo ""
echo "✅ تم إعداد Git بنجاح!"
