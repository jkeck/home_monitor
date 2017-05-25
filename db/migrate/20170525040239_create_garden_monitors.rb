class CreateGardenMonitors < ActiveRecord::Migration[5.1]
  def change
    create_table :garden_monitors do |t|
      t.string :name
      t.string :temp
      t.string :moisture
      t.string :light
      t.timestamps
    end

    add_index :garden_monitors, %i[created_at name]
  end
end
