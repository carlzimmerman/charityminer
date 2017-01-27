class NeighborhoodController < ApplicationController

def index
  @neighborhoods = Neighborhood.all
end

end
