Проект: Управленческий учёт с план-факт анализом и консолидацией (PostgreSQL + Python + Power BI)
🔍 Описание проекта
Проект демонстрирует реализацию управленческого учёта с план-факт анализом и консолидацией по филиалам с учётом внутригруппового оборота (ВГО). Используется стек: PostgreSQL → Python (pandas) → Power BI. Все данные приближены к реальному бизнес-сценарию.

🧩 Структура проекта
📁 data/ — Источник данных
realistic_plan_budget.csv — бюджетные (плановые) данные

realistic_fact_budget.csv — фактические расходы

intercompany.csv — таблица внутригрупповых операций (ВГО)

⚙️ SQL-скрипт
Script-12.sql
— создание таблиц
— загрузка CSV-данных
— создание представления plan_fact_consolidated
— учёт ВГО и расчёт отклонений

📌 👉 plan_fact_consolidated (SQL) — создаётся как view в PostgreSQL

🐍 Python-ноутбук
777.ipynb
— альтернатива расчётам на SQL
— те же данные загружаются в pandas
— расчёт fact_cleaned, отклонений и KPI
— экспорт итоговой таблицы

📌 👉 plan_fact_consolidated.csv — сохранённая таблица из pandas

📊 Power BI
managment.pbix
— импорт данных из plan_fact_consolidated.csv
— визуализация отклонений, KPI, динамики
— фильтры по статьям затрат, филиалам и периодам

🖼️ Скриншоты
![Power BI Dashboard](screenshot.png)


🛠️ Используемые технологии
PostgreSQL

Python (pandas)

Power BI

SQL (CTE, агрегаты, JOIN)

GitHub

📌 Автор
Евгений Харьянов
GitHub портфолио →

![Dashboard](https://github.com/user-attachments/assets/899c3af2-1c8a-425a-8d70-5743386e4233)
