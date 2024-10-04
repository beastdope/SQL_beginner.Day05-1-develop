CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SELECT *
FROM menu
WHERE pizzeria_id = 1
    AND pizza_name = 'cheese pizza'
    OR pizza_name = 'pepperoni piza';