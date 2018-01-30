class Cell
  attr_reader :row, :col
  attr_accessor :generation

  def initialize(row, col, generation = nil)
    @row = row
    @col = col
    @generation = generation
  end

  def neighbors
    [n1, n2, n3, n4, n5, n6, n7, n8].compact
  end

  def like(other_cell)
    row == other_cell.row && col == other_cell.col
  end

  def new_generation
    self
  end

  private

  def n1
    find_in_generation Cell.new(row-1, col-1)
  end

  def n2
    find_in_generation Cell.new(row-1, col)
  end

  def n3
    find_in_generation Cell.new(row-1, col+1)
  end

  def n4
    find_in_generation Cell.new(row, col-1)
  end

  def n5
    find_in_generation Cell.new(row, col+1)
  end

  def n6
    find_in_generation Cell.new(row+1, col-1)
  end

  def n7
    find_in_generation Cell.new(row+1, col)
  end

  def n8
    find_in_generation Cell.new(row+1, col+1)
  end

  def find_in_generation(cell)
    generation.find { |current| current.like(cell) }
  end
end
