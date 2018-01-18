class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
