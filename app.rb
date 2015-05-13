require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/recipe_save/') do
  new_recipe = Recipe.create({:title => params.fetch("recipe_title")})
  @id = new_recipe.id()
  @recipe = Recipe.find(@id)
  @ingredients = Ingredient.all()
  erb(:recipe_add)
end

get('/recipe/:id') do
  @id = params.fetch('id')
  @recipe = Recipe.find(@id)
  @ingredients = @recipe.ingredients()
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
  @id = params.fetch('id')
  @recipe = Recipe.find(@id)
  @recipe.destroy()
  @recipes = Recipe.all()
  erb(:index)
end
