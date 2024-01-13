class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer "user_id", null: false
      t.string "origine"
      t.string "destination"
      t.time "heure"
      t.string "cout"
      t.integer "place"
      t.string "type_car"
      t.integer "duree"
      t.datetime "date_trip"
      t.index ["user_id"], name: "index_trips_on_user_id"
      t.timestamps
    end
  end
end