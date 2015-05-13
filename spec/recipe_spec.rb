require("spec_helper")

describe(Recipe) do
  describe("#ingredients") do
    it("should return all of the ingredients for a specific recipe") do
      test_recipe = Recipe.create({:title => "spanapokita"})
      test_ingredient1 = test_recipe.ingredients.create({:name => "spinach"})
      test_ingredient2 = test_recipe.ingredients.create({:name => "tomato"})
      expect(test_recipe.ingredients).to(eq([test_ingredient1, test_ingredient2]))
    end
  end

  describe("#categories") do
    it("should return all of the categories for a specific recipe") do
      test_recipe = Recipe.create({:title => "spanapokita"})
      test_category1 = test_recipe.categories.create({:group => "greek"})
      test_category2 = test_recipe.categories.create({:group => "vegetarian"})
      expect(test_recipe.categories).to(eq([test_category1, test_category2]))
    end
  end

end
