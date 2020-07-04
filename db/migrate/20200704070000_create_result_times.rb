class CreateResultTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :result_times do |t|

      t.timestamps
    end
  end
end
