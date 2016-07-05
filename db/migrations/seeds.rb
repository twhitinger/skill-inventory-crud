# db/seeds.rb

require 'sqlite3'

database = SQLite3::Database.new("db/skill_inventory_development.db")

#Delete existing records from the skills table before inserting these new records; we'll start from scratch.
database.execute("DELETE FROM skills")

# Insert records.
database.execute(
                "INSERT INTO skills
          (title, description)
        VALUES
          ('Eat Pizza', 'Makes you fat'),
          ('Fly fishing', 'obviously'),
          ('Smoke a bowl', 'Pottery is my thing'),
          ('Love life', 'rap like atmosphere');"

)

# verifying that our SQL INSERT statement worked
p database.execute("SELECT * FROM skills;")
