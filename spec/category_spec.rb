require("spec_helper")

  describe(Category) do
    describe('#recipes') do
      it("should return all of the recipes for this category") do
        test_category = Category.create({:group => "greek"})
        test_recipe1 = test_category.recipes.create({:title => "gyro"})
        test_recipe2 = test_category.recipes.create({:title => "spanapokita"})
        expect(test_category.recipes).to(eq([test_recipe1, test_recipe2]))
      end
    end
  end
