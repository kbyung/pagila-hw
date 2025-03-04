/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */
SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS "sum"
FROM staff
INNER JOIN payment ON staff.staff_id = payment.staff_id
WHERE payment.payment_date >= '2020-01-01 00:00:00' AND
payment.payment_date < '2020-01-31 23:59:59'
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY staff.first_name;
