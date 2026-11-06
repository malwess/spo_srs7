@echo off
cd /d "%~dp0"
rem Локальный запуск в режиме разработки.
rem Ключ ниже только для компьютера разработчика, на сервере он задаётся в Render.
set DJANGO_SECRET_KEY=local-dev-only-not-for-production
set DJANGO_DEBUG=True
set DJANGO_ALLOWED_HOSTS=127.0.0.1,localhost
if not exist venv (
    python -m venv venv || py -m venv venv
)
call venv\Scripts\activate.bat
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput
start http://127.0.0.1:8000/accounts/login/
python manage.py runserver
pause
