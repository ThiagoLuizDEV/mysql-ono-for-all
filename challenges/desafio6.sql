SELECT
  FORMAT(MIN(plan.plan_price), 2) AS 'faturamento_minimo',
  FORMAT(MAX(plan.plan_price), 2) AS 'faturamento_maximo',
  FORMAT(AVG(plan.plan_price), 2) AS 'faturamento_medio',
  FORMAT(SUM(plan.plan_price), 2) AS 'faturamento_total'
FROM
  users
  JOIN plan USING (plan_id)