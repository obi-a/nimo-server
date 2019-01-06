class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :uuid
      t.string :email
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
