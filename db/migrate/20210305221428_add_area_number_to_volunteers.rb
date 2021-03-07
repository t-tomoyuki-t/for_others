class AddAreaNumberToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :area_number, :integer
  end
end
