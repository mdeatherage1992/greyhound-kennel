class CreateGreyhounds < ActiveRecord::Migration
  def change
    create_table :greyhounds do |t|
      t.string :name
      t.integer :kennel_id
      t.string :grade


    t.timestamps null:false
    end
  end
end
