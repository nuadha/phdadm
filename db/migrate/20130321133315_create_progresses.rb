class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.string :milestone
      t.date :plandate
      t.date :completedate
      t.string :name
      t.string :content_type
      t.binary :data, :limit => 10.megabytes

      t.timestamps
    end
  end
end
