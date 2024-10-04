SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
    max(rating) OVER (
        PARTITION BY rating
        ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS k
FROM menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,
    2;
CREATE INDEX idx_menu_pizza_name_rating ON menu(pizza_name, pizzeria_id);
CREATE INDEX idx_pizzeria_rating ON pizzeria(rating, id);
CREATE INDEX idx_1 ON pizzeria(rating);
CREATE INDEX idx_pizzeria_id ON pizzeria (id);
CREATE INDEX idx_menu_pizzeria_id_2 ON menu (pizzeria_id);