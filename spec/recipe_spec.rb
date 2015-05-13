require("spec_helper")

  describe(Recipe) do
    describe("#ingredients") do
    it("should return all of the ingredients for a specific recipe") do
      test_recipe = Recipe.create({:title => "spanapokita"})
      test_ingredient = Ingredient.create({:name => "spinach"})
      test_recipe.ingredients.push(test_ingredient)
      expect(test_recipe.ingredients).to(eq([test_ingredient]))
    end
  end

    describe("#categories") do
    it("should return all of the categories for a specific recipe") do
      test_recipe = Recipe.create({:title => "spanapokita"})
      test_category = Category.create({:group => "greek"})
      test_recipe.categories.push(test_category)
      expect(test_recipe.categories).to(eq([test_category]))
    end
  end
end
