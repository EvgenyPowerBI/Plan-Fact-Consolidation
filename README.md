# Проект: План-Факт Анализ с Консолидацией (1С → PostgreSQL → Python → Power BI)

## 🔧 Цель проекта
Реализация сквозного пайплайна для управленческого учёта с учётом консолидации по филиалам и исключением внутригруппового оборота (ВГО). 

## 🗂 Источник данных
Имитация выгрузки из 1С:
- `realistic_plan_budget.csv` — плановые значения по статьям и подразделениям
- `realistic_fact_budget.csv` — фактические значения
- `intercompany.csv` — данные по внутригрупповому обороту (ВГО)

## 📍 Этапы обработки данных

### 1. Загрузка и хранение в PostgreSQL
- Создание таблиц: `realistic_plan_budget`, `realistic_fact_budget`, `intercompany`
- Загрузка CSV-файлов в БД
- Создание `VIEW` с расчётом план-факт и очисткой от ВГО

SQL-скрипты:
- `Script-12.sql` — полный скрипт создания таблиц, `VIEW` и расчётов

### 2. Обработка в Python
- Объединение таблиц с использованием `pandas`
- Расчёт отклонений, KPI и очистка от ВГО
- Сохранение результирующей таблицы в `plan_fact_consolidated.csv`

Python-ноутбук:
- `777.ipynb` — Jupyter-ноутбук с подробными шагами и комментариями

### 3. Визуализация в Power BI
- Использован файл: `managment.pbix`
- Дашборд отражает:
  - План-факт отклонения
  - Конверсию в процентах
  - Расклад по филиалам и статьям
  - Учёт ВГО
  - KPI и флаги

## 🖼 Скриншот дашборда
Добавь в папку проекта файл `dashboard.png` и вставь сюда:

![Дашборд Power BI](dashboard.png)

## 🛠 Используемые технологии
- PostgreSQL
- Python (pandas)
- Power BI
- SQL (JOIN, CASE, CTE, агрегаты)
- Git + GitHub

## 📁 Структура репозитория

```
├── realistic_plan_budget.csv
├── realistic_fact_budget.csv
├── intercompany.csv
├── plan_fact_consolidated.csv
├── Script-12.sql
├── 777.ipynb
├── managment.pbix
├── dashboard.png
└── README.md
```

## 💡 Автор
Евгений Харьянов  
[GitHub: EvgenyPowerBI](https://github.com/EvgenyPowerBI)
