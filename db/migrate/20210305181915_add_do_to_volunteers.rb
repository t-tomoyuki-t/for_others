class AddDoToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :do_from, :date
    add_column :volunteers, :do_to, :date
  end
end
