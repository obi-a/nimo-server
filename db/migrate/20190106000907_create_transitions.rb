class CreateTransitions < ActiveRecord::Migration[5.2]
  def change
    create_table :transitions do |t|
      t.string     :uuid
      t.references :start
      t.references :end

      t.timestamps
    end
  end
end
