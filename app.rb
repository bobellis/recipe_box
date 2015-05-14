require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/recipe_edit/') do
  @new_recipe = Recipe.create({:title => params.fetch("recipe_title")})
  @id = @new_recipe.id()
  @recipe = Recipe.find(@id)
  @ingredients = Ingredient.all()
  @categories = Category.all()
  erb(:recipe_edit)
end

get('/recipe/:id') do
  @id = params.fetch('id')
  @recipe = Recipe.find(@id)
  @ingredients = @recipe.ingredients()
  @instructions = @recipe.instructions()
  @categories = @recipe.categories()
  erb(:recipe_info)
end

get('/add_ingredients/') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredient_save/') do
  Ingredient.create({:name => params.fetch("ingredient_name")})
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

delete('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  @recipe.destroy()
  @recipes = Recipe.all()
  erb(:index)
end

patch('/save_recipe/:id') do
  @instructions = params.fetch('instructions')
  @new_recipe = Recipe.find(params.fetch('id'))
  @new_recipe.update({:instructions => @instructions})
  @ingredient_ids = params.fetch('ingredient_ids')
  @ingredient_ids.each do |ingredient_id|
    @new_ingredient = Ingredient.find(ingredient_id)
    @new_recipe.ingredients.push(@new_ingredient)
  end
  @category_ids = params.fetch('category_ids')
  @category_ids.each do |category_id|
    @new_category = Category.find(category_id)
    @new_recipe.categories.push(@new_category)
  end
  @recipe = @new_recipe
  @ingredients = @recipe.ingredients()
  @instructions = @recipe.instructions()
  @categories = @recipe.categories()
  erb(:recipe_info)
end

get('/add_categories/') do
  @categories = Category.all()
  erb(:categories)
end

post('/category_save/') do
  Category.create({:group => params.fetch("category_group")})
  @categories = Category.all()
  erb(:categories)
end
