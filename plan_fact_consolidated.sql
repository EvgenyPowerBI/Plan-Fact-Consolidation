
-- Создание витрины с расчётом план-факт с учётом вычета ВГО
CREATE OR REPLACE VIEW plan_fact_consolidated AS
WITH base AS (
    SELECT
        COALESCE(p.period, f.period) AS period,
        COALESCE(p.department, f.department) AS department,
        COALESCE(p.article, f.article) AS article,
        COALESCE(p.planned_amount, 0) AS planned_amount,
        COALESCE(f.fact_amount, 0) AS fact_amount
    FROM realistic_plan_budget p
    FULL OUTER JOIN realistic_fact_budget f
        ON p.period = f.period AND p.department = f.department AND p.article = f.article
),
adjusted AS (
    SELECT
        b.period,
        b.department,
        b.article,
        b.planned_amount,
        CASE
            WHEN ic.amount IS NOT NULL THEN b.fact_amount - ic.amount
            ELSE b.fact_amount
        END AS fact_cleaned
    FROM base b
    LEFT JOIN intercompany ic
        ON ic.period = b.period AND ic.receiver = b.department AND ic.article = b.article
)
SELECT
    period,
    department,
    article,
    planned_amount,
    fact_cleaned,
    fact_cleaned - planned_amount AS deviation,
    ROUND(
        CASE
            WHEN planned_amount = 0 THEN NULL
            ELSE (fact_cleaned - planned_amount) * 100.0 / planned_amount
        END, 2
    ) AS deviation_percent
FROM adjusted;
