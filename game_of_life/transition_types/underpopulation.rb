require_relative "base"
require_relative "../cells/dead"

module TransitionType
  class Underpopulation < Base
    def match?
      live_neighbors_count < 2
    end

    def new_generation
      Dead.new(cell.row, cell.col)
    end
  end
end
