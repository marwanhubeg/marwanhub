#!/bin/bash

echo "🏗️  إنشاء الهيكل المنظم..."

# الهيكل الأساسي
mkdir -p .github/workflows
mkdir -p docs/{ar,en}
mkdir -p config/{development,production}
mkdir -p templates/{readme,repo,profile}
mkdir -p assets/{images,icons,banners}
mkdir -p projects/{website,ecommerce,marketing}
mkdir -p scripts/{setup,deploy,maintenance}

# ملفات التوثيق الأساسية
touch docs/ar/README.md
touch docs/en/README.md
touch docs/ar/SERVICES.md
touch docs/en/SERVICES.md

# ملفات الإعداد
touch config/development/env.example
touch config/production/deploy.yml

# ملفات المشاريع
touch projects/website/plan.md
touch projects/ecommerce/plan.md
touch projects/marketing/plan.md

echo "✅ تم إنشاء الهيكل المنظم"
tree -d -L 3
