class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table(:recipes) do |r|
      r.column(:title, :string)
      r.column(:instructions, :string)
      r.column(:rating, :int)

      r.timestamps()
    end

    create_table(:ingredients) do |i|
      i.column(:name, :string)

      i.timestamps()
    end

    create_table(:ingredients_recipes) do |ir|
      ir.column(:recipe_id, :int)
      ir.column(:ingredient_id, :int)

      ir.timestamps()
    end

    create_table(:categories) do |c|
      c.column(:group, :string)

      c.timestamps()
    end

    create_table(:category_recipe) do |cr|
      cr.column(:category_id, :int)
      cr.column(:recipe_id, :int)

      cr.timestamps()
    end
  end
end
