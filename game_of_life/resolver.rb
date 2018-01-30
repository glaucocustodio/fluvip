require_relative "cells/live"
require_relative "cells/dead"

class Resolver
  attr_reader :generation

  def initialize(generation)
    @generation = generation
  end

  def generate
    generation.map do |current_cell|
      current_cell.generation = generation
      current_cell.new_generation
    end
  end
end
