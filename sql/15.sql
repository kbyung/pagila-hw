/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */
SELECT category.name, COUNT(category.name) AS "sum"
FROM film
INNER JOIN film_category USING (film_id)
INNER JOIN language USING (language_id)
INNER JOIN category USING (category_id)
WHERE language.name = 'English' 
GROUP BY category.name
ORDER BY category.name ASC;
