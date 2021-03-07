class AddDateToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :do_on, :date
  end
end
