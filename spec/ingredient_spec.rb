require("spec_helper")

  describe(Ingredient) do
    describe('#recipes') do
      it("should return all of the recipes with this ingredient") do
        test_recipe = Recipe.create({:title => "spanapokita"})
        test_recipe2 = Recipe.create({:title => "gyro"})
        test_ingredient = Ingredient.create({:name => "spinach"})
        test_recipe.ingredients.push(test_ingredient)
        expect(test_ingredient.recipes).to(eq([test_recipe]))
      end
    end
  end
