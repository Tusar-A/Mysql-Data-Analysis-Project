-- We will need a list of staff members, including their first and last name, email address, and store id number where they work
SELECT 
    first_name, last_name, email, store_id
FROM
    staff;

#----
-- we will need to seperate counts of inventory items held at each of your two stores.
SELECT 
    store_id, COUNT(inventory_id) AS inventory_items
FROM
    inventory
GROUP BY store_id;

-- we will need a count of active customer for each of your stores. seperate please
SELECT 
    store_id, COUNT(customer_id)
FROM
    customer
WHERE active = 1
GROUP BY store_id;

-- In order to access the liability of a data breach, we will need you to provide a count of all customer email address stored in the database
SELECT 
    COUNT(email)
FROM
    customer;

/*  We are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future.
 Please provide a count of unique film title you have in inventory at each store and then provide a count of the unique category of film you provide.
*/
# Unique Movies
SELECT 
    store_id, COUNT(distinct film_id)
FROM
    inventory
GROUP BY store_id;

# Unique Categories
SELECT 
    COUNT(DISTINCT name) AS unique_categories
FROM
    category;

/* We would like to understand the replacement cost of your films. Please provide the replacement cost for the film that is least expensive to replace, the most
expensive to replace, and average of all films you carry.
*/
SELECT 
	MIN(replacement_cost) AS least_payment,
    MAX(replacement_cost) AS most_payment,
    AVG(replacement_cost) AS average_payment
FROM
    film;
    
/* -- we are interested in having you put payment monitoring system and maximum payment processing restrictions in place in order to 
minimize the future risk of fraud by your staff. Please provide the average payment you process, as well as the manimum payment you have processed.
*/
SELECT 
    AVG(amount) AS average_payment, MAX(amount) AS max_payment
FROM
    payment;
/* 
We would like to better understand what your customer base looks like. Please provide a list of full customer identification value,
with a count of rentals they have made all-time, with your highest volume customer at the top of the list.
*/
SELECT 
    customer_id, COUNT(rental_id)
FROM
    rental
GROUP BY customer_id
ORDER BY COUNT(rental_id) DESC;