class RenameCategoryRecipeTable < ActiveRecord::Migration
  def change
    rename_table :category_recipe, :categories_recipes
  end
end
