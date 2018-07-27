class CreateKennels < ActiveRecord::Migration
  def change
    create_table :kennels do |t|
      t.string :name
      t.text :email
      t.string :password_digest
      t.timestamps null:false
    end
  end
end
