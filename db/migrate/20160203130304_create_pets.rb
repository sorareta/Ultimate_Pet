class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :category
      t.references :user, index: true

      t.timestamps
    end
  end
end
