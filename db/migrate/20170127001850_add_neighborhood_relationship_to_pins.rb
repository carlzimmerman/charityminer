class AddNeighborhoodRelationshipToPins < ActiveRecord::Migration
  def change
    change_table :pins do |t|
      t.belongs_to :neighborhood, index: true
    end
  end
end
