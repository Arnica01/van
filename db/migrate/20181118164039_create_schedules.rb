class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :destination
      t.time :time

      t.timestamps
    end
  end
end
