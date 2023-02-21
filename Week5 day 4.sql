create or replace procedure create_new_movie(title VARCHAR(225), description text, release_year year, language_id int2, rental_duration int2, rental_rate numeric(4,2), "length" int2, replacement_cost numeric(5,2), rating mpaa_rating)
language plpgsql
as $$
begin 
    insert into film(title = title, description = descriptiom, release_year = release_year, language_id = language_id, rental_duratiom = rental_duration, "length" = "length", replacement_cost = replacement_cost, rating = rating)    
end;
$$;

create or replace function get_category_number(category_id integer)
returns Integer
language plpgsql
as $$
    declare category_num INTEGER;
begin
    select COUNT(*) into category_num
    from category c
    join film_category fc 
    on c.category_id = fc.category_id 
    join film f 
    on f.film_id = fc.film_id 
    where c.category_id = category_id;
    return category_id;
end;


