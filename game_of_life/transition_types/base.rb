module TransitionType
  class Base
    attr_reader :cell

    def initialize(cell)
      @cell = cell
    end

    def live_neighbors_count
      cell.neighbors.count { |current| current.class == Live }
    end
  end
end
