class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description

      t.references :owner

      t.timestamps
    end
  end
end
