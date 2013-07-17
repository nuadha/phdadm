class AddDetailsToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :enrollment_date, :date
    add_column :enrollments, :completion_date, :date
  end
end
