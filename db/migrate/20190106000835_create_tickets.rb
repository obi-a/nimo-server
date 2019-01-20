class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :uuid
      t.string :summary
      t.text :description

      t.references :creator
      t.references :assignee
      t.references :workflow
      t.references :project

      t.timestamps
    end
  end
end
