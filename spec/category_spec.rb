require("spec_helper")

  describe(Category) do
    describe('#recipes') do
      it("should return all of the recipes for this category") do
        test_recipe = Recipe.create({:title => "spanapokita"})
        test_recipe2 = Recipe.create({:title => "gyro"})
        test_category = Category.create({:group => "greek"})
        test_category2 = Category.create({:group => "thai"})
        test_recipe.categories.push(test_category)
        expect(test_recipe.categories).to(eq([test_category]))
      end
    end
  end
