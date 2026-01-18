#!/bin/bash

echo "📅 تحديث يومي - $(date '+%Y-%m-%d')"

# تحديث ملف السجل
echo "### $(date '+%Y-%m-%d %H:%M:%S')" >> daily_log.md
echo "- ✅ تم التحديث التلقائي" >> daily_log.md
echo "" >> daily_log.md

echo "📝 تم تسجيل التحديث في daily_log.md"
