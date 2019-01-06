class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid
      t.boolean :admin

      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
