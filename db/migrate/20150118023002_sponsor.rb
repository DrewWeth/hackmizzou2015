class Sponsor < ActiveRecord::Migration
  def change
    add_column :email_lists, :sponsor, :boolean
  end
end
