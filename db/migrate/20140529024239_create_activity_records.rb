class CreateActivityRecords < ActiveRecord::Migration
  def change
    create_table :activity_records do |t|
      t.point :coords, :srid => 3785
    end
    change_table :check_ins do |t|
      t.index :coords, :spatial => true
    end
  end
end
