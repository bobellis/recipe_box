require("spec_helper")

  describe(Ingredient) do
    describe('#recipes') do
      it("should return all of the recipes with this ingredient") do
        test_ingredient = Ingredient.create({:name => "spinach"})
        test_recipe1 = test_ingredient.recipes.create({:title => "gyro"})
        test_recipe2 = test_ingredient.recipes.create({:title => "spanapokita"})
        expect(test_ingredient.recipes).to(eq([test_recipe1, test_recipe2]))
      end
    end
  end
