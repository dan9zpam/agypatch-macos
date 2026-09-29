# Open Antigravity Patcher (macOS Installer) 🍏

*Данный проект сделан на основе оригинального репозитория: [AvenCores-open-antigravity-patcher](https://github.com/trustybird/AvenCores-open-antigravity-patcher)*

Опенсорс патчер для Antigravity 2.0, Antigravity IDE, Antigravity CLI и расширения Google Antigravity для VS Code: снимает регионные ограничения без VPN и смены региона аккаунта Google. 

> **Важно:** Этот проект — автоматизированный лаунчер для оригинального [Open Antigravity Patcher](https://github.com/trustybird/AvenCores-open-antigravity-patcher), специально адаптированный для пользователей Mac.
> Оригинальный репозиторий содержит виртуальное окружение (`venv`), созданное под Windows, из-за чего на Mac возникает ошибка `source: no such file or directory: venv/bin/activate`. Данный скрипт полностью решает эту проблему.

## 🚀 Как использовать (в 2 клика)

1. Скачайте этот репозиторий: нажмите зеленую кнопку **Code** -> **Download ZIP**.
2. Распакуйте архив и откройте папку.
3. Дважды кликните по файлу `agypatch.command`.

**Если по двойному клику открывается текстовый редактор, а не Терминал:**
1. Откройте Терминал.
2. Напишите `sh ` (с пробелом на конце).
3. Перетащите файл `agypatch.command` в окно Терминала и нажмите Enter.

## Что делает скрипт?
- Автоматически скачивает свежую версию оригинального патчера.
- Удаляет Windows-окружение и создает правильное изолированное окружение (`mac_venv`) для macOS.
- Устанавливает все зависимости.
- Запускает патчер.
- При повторных запусках скачивает обновления оригинального кода.

---

## ⚠️ Решение частых проблем (на macOS)

### Ошибка HTTP 429 Too Many Requests / RESOURCE_EXHAUSTED
При отправке промпта в Antigravity появляется ошибка исчерпания квоты.
**Решение:** сброс папки данных (чистая конфигурация + свежие токены).

**1.** Полностью закройте Antigravity (`Cmd+Q`, проверьте, что точки под иконкой в Dock нет).
**2.** Переместите папку данных в безопасное место (бэкап):
```bash
mv ~/Library/Application\ Support/Antigravity ~/Desktop/Antigravity-backup
```
**3.** Запустите Antigravity, авторизуйтесь, отправьте тестовый промпт — ошибка 429 должна уйти.
**4.** Если всё ОК — закройте Antigravity (`Cmd+Q`).
**5.** *(Опционально, восстановление диалогов)* Удалите пустые хранилища чатов в новой папке и скопируйте их из бэкапа:
```bash
rm -rf ~/Library/Application\ Support/Antigravity/User/globalStorage
rm -rf ~/Library/Application\ Support/Antigravity/User/workspaceStorage

cp -a ~/Desktop/Antigravity-backup/User/globalStorage ~/Library/Application\ Support/Antigravity/User/
cp -a ~/Desktop/Antigravity-backup/User/workspaceStorage ~/Library/Application\ Support/Antigravity/User/
```
> ⚠️ **Не копируйте** файл `settings.json` из бэкапа — иначе вернёте старую проблемную конфигурацию.

**6.** Запустите Antigravity, проверьте диалоги. Если всё работает — удалите бэкап:
```bash
rm -rf ~/Desktop/Antigravity-backup
```

### Ошибка HTTP 400 Bad Request
Сообщение `User location is not supported for the API use`. Google определил ваше местоположение как неподдерживаемое (часто при использовании VPN).
**Решение:** Примените патч (выберите в меню `1`). Патчер настроит корректный обход `isGoogleInternal` на уровне кода.

### Ошибка HTTP 403 Forbidden / SUBSCRIPTION_REQUIRED
Ошибка связана с API Google и состоянием аккаунта (лицензией). Патчер меняет только локальные файлы и с этой ошибкой не поможет. Требуется сменить регион аккаунта или приобрести официальную подписку.

### Ошибка HTTP 500 Internal Server Error
Если при запросе появляется ошибка HTTP 500, то ничего не поделать, меняйте аккаунт (желательно на регион, где Antigravity официально работает).

## 📜 Кредиты
Вся логика обхода и оригинальный код патчера принадлежат автору репозитория [trustybird](https://github.com/trustybird). Данный инструмент создан исключительно для удобного запуска патчера на системах macOS.
