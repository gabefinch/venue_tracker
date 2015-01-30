class AddBandsAddVenues < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
      t.column(:style, :string)
      t.column(:hometown, :string)
      t.column(:rating, :integer)
      t.timestamps
    end
    create_table(:venues) do |t|
      t.column(:name, :string)
      t.column(:address, :string)
      t.column(:rating, :integer)
      t.timestamps
    end
  end
end
