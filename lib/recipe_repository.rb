require_relative 'database_connection'
require_relative 'recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    sql = ('SELECT id, name, cooking_time, rating FROM recipes;')
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |listing|
      recipe = Recipe.new
      recipe.id = listing['id'].to_i
      recipe.name = listing['name']
      recipe.cooking_time = listing['cooking_time'].to_i
      recipe.rating = listing['rating'].to_i

      recipes << recipe 

    end 

    return recipes

  end 

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)

    sql = ('SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;')
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM students WHERE id = $1;
    requested_recipe = result_set[0]

    recipe = Recipe.new
    recipe.id = requested_recipe['id'].to_i
    recipe.name = requested_recipe['name']
    recipe.cooking_time = requested_recipe['cooking_time'].to_i
    recipe.rating = requested_recipe['rating'].to_i

    return recipe
    # Returns a single Recipe object.
  end
end 