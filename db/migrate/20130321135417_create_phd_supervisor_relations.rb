class CreatePhdSupervisorRelations < ActiveRecord::Migration
  def change
    create_table :phd_supervisor_relations do |t|
      t.integer :phd_id
      t.integer :supervisor_id

      t.timestamps
    end
  end
end
