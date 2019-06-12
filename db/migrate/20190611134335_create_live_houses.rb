class CreateLiveHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :live_houses do |t|
      t.string :name

      t.timestamps
    end
  end
end
