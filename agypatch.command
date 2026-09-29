#!/bin/bash

echo "================================================="
echo "   Open AG Patcher (macOS Auto-Installer)        "
echo "================================================="

# Переходим в директорию самого скрипта
cd "$(dirname "$0")"

REPO_URL="https://github.com/trustybird/AvenCores-open-antigravity-patcher.git"
PROJECT_DIR="open-antigravity-patcher"

# 1. Скачивание или обновление оригинального кода
if [ ! -d "$PROJECT_DIR" ]; then
    echo "[*] Клонирование оригинального репозитория..."
    git clone "$REPO_URL" "$PROJECT_DIR"
else
    echo "[*] Репозиторий найден. Проверка обновлений..."
    cd "$PROJECT_DIR"
    git pull origin main
    cd ..
fi

cd "$PROJECT_DIR" || exit

# 2. Очистка несовместимого окружения Windows
if [ -d "venv" ]; then
    rm -rf venv
fi

# 3. Создание правильного macOS окружения
if [ ! -d "mac_venv" ]; then
    echo "[*] Создание виртуального окружения для macOS..."
    python3 -m venv mac_venv
fi

# 4. Активация и установка зависимостей
echo "[*] Установка зависимостей..."
source mac_venv/bin/activate
pip3 install -r source/requirements.txt --quiet

# 5. Запуск патчера
echo "[*] Запуск патчера..."
# Запускаем все .py файлы в папке source (обычно там один главный файл, например main.py)
python3 source/*.py

echo "================================================="
echo "Готово! Можно закрывать это окно."
