USE sakila;
SELECT c.category_id, c.name, COUNT(*) AS film_count
FROM sakila.category c
JOIN sakila.film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name;


SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a ON s.address_id = a.address_id;


SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM sakila.staff s
JOIN sakila.payment p ON s.staff_id = p.staff_id
JOIN sakila.rental r ON p.rental_id = r.rental_id
WHERE MONTH(r.rental_date) = 8 AND YEAR(r.rental_date) = 2005
GROUP BY s.staff_id, s.first_name, s.last_name;

SELECT f.film_id, f.title, COUNT(a.actor_id) AS actor_count
FROM sakila.film f
JOIN sakila.film_actor fa ON f.film_id = fa.film_id
JOIN sakila.actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id, f.title;

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount
FROM sakila.customer c
JOIN sakila.payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name;
