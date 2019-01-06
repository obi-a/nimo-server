class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :transition
      t.references :status

      t.timestamps
    end
  end
end
