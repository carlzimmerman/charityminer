class GenerateNeighborhoods < ActiveRecord::Migration
  def up
    neighborhood_names.each do |name|
      Neighborhood.create(name: name)
    end
  end
  def down
    Neighborhood.destroy_all
  end

  def neighborhood_names
    ["Myers Park", "Noda", "Uptown", "South Park"]
  end
end
