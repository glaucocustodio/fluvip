require_relative "base"
require_relative "../cells/live"

module TransitionType
  class Reproduction < Base
    def match?
      live_neighbors_count == 3
    end

    def new_generation
      Live.new(cell.row, cell.col)
    end
  end
end
