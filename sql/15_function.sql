/*
 * Use a JOIN to count the number films in each category in the specified language.
 * Use table category, film_category, film, and language.
 */
CREATE OR REPLACE FUNCTION category_counts_by_language(lang TEXT) RETURNS TABLE(name TEXT, count BIGINT) AS
$$
SELECT category.name, COUNT(category.name) 
FROM film
INNER JOIN film_category USING (film_id)
INNER JOIN language USING (language_id)
INNER JOIN category USING (category_id)
WHERE language.name = lang
GROUP BY category.name
ORDER BY category.name ASC;
$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

SELECT * FROM category_counts_by_language('English');
SELECT * FROM category_counts_by_language('Italian');
SELECT * FROM category_counts_by_language('Japanese');
SELECT * FROM category_counts_by_language('Mandarin');
SELECT * FROM category_counts_by_language('French');
SELECT * FROM category_counts_by_language('German');
SELECT * FROM category_counts_by_language('Latin');
