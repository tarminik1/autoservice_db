-- 1. Запрос предназначен для выбора производителей автомобилей, у которых количество автомобилей в базе данных превышает 3. Его цель - исследовать производителей, которые представлены в базе данных автосервиса с значительным количеством автомобилей.
SELECT maker,
       COUNT(*) AS car_count
FROM auto.car
GROUP BY maker
HAVING COUNT(*) > 3;

-- 2. Запрос позволяет выбрать клиентов, у которых количество заказов превышает 2 и средняя сумма платежа больше 1000. Это может быть полезным для идентификации клиентов с высокой активностью и значительными средними платежами, что может быть интересно для анализа или принятия управленческих решений.
SELECT c.customer_id,
       c.customer_nm,
       COUNT(o.order_id) AS order_count
FROM auto.customer c
         JOIN
     auto.car cr ON c.customer_id = cr.customer_id
         JOIN
     auto.order o ON cr.car_id = o.car_id
GROUP BY c.customer_id,
         c.customer_nm
HAVING COUNT(*) > 2
   AND AVG(payment_amt) > 1000;

--3. Запрос позволяет выбрать клиентов из базы данных автосервиса и отсортировать их по общей сумме продаж в порядке убывания. Это может быть полезно для идентификации клиентов с наибольшими продажами и выделения наиболее значимых клиентов в контексте автосервиса.
SELECT
  customer_id,
  customer_nm,
  total_sales
FROM
  auto.customer
ORDER BY
  total_sales DESC;