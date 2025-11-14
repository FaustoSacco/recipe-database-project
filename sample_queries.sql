-- List all recipes
SELECT * FROM recipes;

-- List all ingredients for Pancakes
SELECT i.name
FROM ingredients i
JOIN recipe_ingredients ri ON i.ingredient_id = ri.ingredient_id
JOIN recipes r ON r.recipe_id = ri.recipe_id
WHERE r.name = 'Pancakes';

-- List all recipes that use Eggs
SELECT r.name
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON i.ingredient_id = ri.ingredient_id
WHERE i.name = 'Eggs';

-- Recipes that use BOTH Eggs and Milk
SELECT r.name
FROM recipes r
JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
JOIN ingredients i ON i.ingredient_id = ri.ingredient_id
WHERE i.name IN ('Eggs', 'Milk')
GROUP BY r.name
HAVING COUNT(DISTINCT i.name) = 2;

