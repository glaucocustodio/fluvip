require_relative "cell"
require_relative "../transition_types/reproduction"

class Dead < Cell
  def new_generation
    figure_out_new_generation
  end

  private

  def figure_out_new_generation
    klass = [reproduction].find { |current| current.match? }
    klass&.new_generation || self
  end

  def reproduction
    TransitionType::Reproduction.new(self)
  end
end
