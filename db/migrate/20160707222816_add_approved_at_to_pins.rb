class AddApprovedAtToPins < ActiveRecord::Migration
  def change
    change_table :pins do |t|
      t.datetime :approved_at, default: nil
    end
  end
end
