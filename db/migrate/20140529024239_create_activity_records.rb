class CreateActivityRecords < ActiveRecord::Migration
  def change
    create_table :activity_records do |t|
      t.point :coords

      t.timestamps
    end
  end
end
