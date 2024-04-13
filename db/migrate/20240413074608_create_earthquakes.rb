class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.string :external_id
      t.decimal :magnitude, precision: 5, scale: 3
      t.string :place
      t.datetime :time
      t.string :url
      t.integer :tsunami
      t.string :magnitude_type
      t.string :title
      t.decimal :longitude, precision: 10, scale: 7
      t.decimal :latitude, precision: 10, scale: 7
      t.timestamps
    end
  end
end
