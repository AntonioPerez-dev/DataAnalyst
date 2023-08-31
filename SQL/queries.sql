--Slide 1
WITH fam_film AS (
    SELECT f.film_id,
           f.title AS film_title,
           c.name  AS cat_name
      FROM film AS f
      JOIN film_category AS fc
        ON fc.film_id = f.film_id
      JOIN category AS c
        ON c.category_id = fc.category_id
     WHERE c.name IN ('Animation',
                      'Children',
                      'Classics',
                      'Comedy',
                      'Family',
                      'Music')
)
SELECT ff.cat_name,
       COUNT(*) AS rental_count
  FROM fam_film  AS ff
  JOIN inventory AS i
    ON i.film_id = ff.film_id
  JOIN rental AS r
    ON r.inventory_id = i.inventory_id
 GROUP BY 1
 ORDER BY 2 DESC;


--Slide 2
WITH fam_film AS (
    SELECT f.film_id,
           f.title AS film_title,
           c.name  AS cat_name,
           f.rental_duration,
           NTILE(4) OVER (ORDER BY f.rental_duration)
      FROM film AS f
      JOIN film_category AS fc
        ON fc.film_id = f.film_id
      JOIN category AS c
        ON c.category_id = fc.category_id
     WHERE c.name IN ('Animation',
                      'Children',
                      'Classics',
                      'Comedy',
                      'Family',
                      'Music')
)
SELECT cat_name AS name, 
       ntile AS standard_quartile, 
       COUNT(*)
  FROM fam_film
 GROUP BY 1,2
 ORDER BY 1,2;


--Slide 3
SELECT DATE_PART('month',r.rental_date) AS rental_month,
       DATE_PART('year',r.rental_date)  AS rental_year,
       s.store_id,
       COUNT(*)
  FROM rental AS r
  JOIN staff  AS s
    ON s.staff_id = r.staff_id
 GROUP BY 1,2,3
 ORDER BY 2,1,4 DESC;


--Slide 4
WITH top10cust AS (
    SELECT customer_id,
           SUM(amount) AS sum_amount
      FROM payment
     GROUP BY 1
     ORDER BY 2 DESC
     LIMIT 10
)
SELECT DATE_TRUNC('month',p.payment_date) AS pay_mon,
       c.first_name || ' ' || c.last_name AS fullname,
       COUNT(*),
       SUM(p.amount) AS pay_amount
  FROM payment  AS p
  JOIN customer AS c
    ON p.customer_id = c.customer_id
 WHERE c.customer_id IN (SELECT customer_id
                           FROM top10cust)
 GROUP BY 1,2
 ORDER BY 2,1;

/* CHANGES
1. Formated all queries for readability.
   Changed TABS for SPACES to have consistent results among editors
   (atom, udacity workspace, pgAdmin)
2. Modified 'Query Slide 1' to avoid further processing between output and graph
3. Changed commenting style for single line comments to double dash
4. Sorted bars on query 'Slide 1' .
5. Added 'AS' keyword on line 48 since was producing an error on udacity workspace.*/
