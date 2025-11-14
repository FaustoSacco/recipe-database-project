# 🍽️ Recipe & Ingredients Database (MySQL / MariaDB)

Small practice project to learn basic **relational database design**, SQL, and working with **EC2 + MariaDB** on AWS.

The goal:  
> Given some ingredients, which recipes can I make?  
> And for a recipe, which ingredients do I need?

---

## 🧱 Tech Stack

- AWS EC2 (Amazon Linux 2023)
- MariaDB / MySQL
- SQL (DDL + DML)
- `mysqldump` for exporting the database

---

## 📂 Project Files

| File           | Description                                       |
|----------------|---------------------------------------------------|
| `recipe_db.sql` | Full database dump (schema + sample data). Run this to recreate the database on any MySQL/MariaDB server. |

---

## 🗂️ Database Schema

The project models a **many-to-many** relationship:

- One **recipe** has many **ingredients**
- One **ingredient** can belong to many **recipes**

Tables:

1. **recipes**
   - `recipe_id` (INT, PK)
   - `name` (VARCHAR)

2. **ingredients**
   - `ingredient_id` (INT, PK)
   - `name` (VARCHAR)

3. **recipe_ingredients**
   - `recipe_id` (INT, FK → recipes.recipe_id)
   - `ingredient_id` (INT, FK → ingredients.ingredient_id)
   - Composite PK (`recipe_id`, `ingredient_id`)

### ER-style text diagram

```text
recipes (1) ───< recipe_ingredients >─── (1) ingredients

recipes
  - recipe_id (PK)
  - name

ingredients
  - ingredient_id (PK)
  - name

recipe_ingredients
  - recipe_id (FK → recipes.recipe_id)
  - ingredient_id (FK → ingredients.ingredient_id)

