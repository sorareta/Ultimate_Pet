class ChangeAgeToBirthdayPets < ActiveRecord::Migration
  def change
  	remove_column :pets, :age, :integer
  	add_column :pets, :birthday, :date
  end
end
