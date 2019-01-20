class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :uuid
      t.references :transition
      t.references :status
      t.belongs_to :ticket

      t.timestamps
    end
  end
end
