class CreateSupervisorProgressDeclarations < ActiveRecord::Migration
  def change
    create_table :supervisor_progress_declarations do |t|
      t.date :date
      t.boolean :scientific_progress
      t.boolean :following_student_plan
      t.integer :phd_id
      t.integer :supervisor_id

      t.timestamps
    end
  end
end
