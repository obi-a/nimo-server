class CreateWorkflowTransitions < ActiveRecord::Migration[5.2]
  def change
    create_table :workflow_transitions do |t|
      t.belongs_to :workflow,   index: true
      t.belongs_to :transition, index: true

      t.timestamps
    end
  end
end
