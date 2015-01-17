class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.integer :level, :default => 1
      t.integer :user_id, :index => true
      t.float :donation, :default => 0
      t.string :email
      t.string :phone
      t.string :rep
      t.string :image_url

      t.timestamps
    end
  end
end
