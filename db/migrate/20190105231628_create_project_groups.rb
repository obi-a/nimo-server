class CreateProjectGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :project_groups do |t|
      t.belongs_to :group,   index: true
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
