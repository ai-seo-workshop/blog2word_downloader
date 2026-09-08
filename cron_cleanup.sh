#!/bin/bash
# 调用服务器 B 上的 Blob 清理接口，替代原 Vercel Cron。
# 使用方式：将 CRON_SECRET 与 APP_BASE_URL 替换为真实值后，加入 crontab。
# 示例 crontab：0 3 * * * /path/to/blog2word_downloader/cron_cleanup.sh
set -euo pipefail

CRON_SECRET="${CRON_SECRET:?请设置环境变量 CRON_SECRET}"
APP_BASE_URL="${APP_BASE_URL:-http://127.0.0.1:5000}"

curl -fsS -H "Authorization: ${CRON_SECRET}" "${APP_BASE_URL}/internal/cleanup"
