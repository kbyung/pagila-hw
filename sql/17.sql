/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */
SELECT country, SUM(payment.amount) AS profit
FROM country
INNER JOIN city USING (country_id)
INNER JOIN address USING (city_id)
INNER JOIN customer USING (address_id)
INNER JOIN rental USING (customer_id)
INNER JOIN payment USING (rental_id)
GROUP BY country.country
ORDER BY country.country ASC;
