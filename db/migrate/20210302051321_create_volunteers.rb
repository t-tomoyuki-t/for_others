class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :title
      t.string :area
      t.string :from_area
      t.string :gender
      t.string :text

      t.timestamps
    end
  end
end
