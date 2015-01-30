class AddBandsVenues < ActiveRecord::Migration
  def change
    create_join_table :bands, :venues do |t|
      t.index :band_id
      t.index :venue_id
    end
  end
end
