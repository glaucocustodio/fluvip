require_relative "cell"
require_relative "../transition_types/underpopulation"
require_relative "../transition_types/overpopulation"

class Live < Cell
  def new_generation
    figure_out_new_generation
  end

  private

  def figure_out_new_generation
    klass = [underpopulation, overpopulation].find { |current| current.match? }
    klass&.new_generation || self
  end

  def underpopulation
    TransitionType::Underpopulation.new(self)
  end

  def overpopulation
    TransitionType::Overpopulation.new(self)
  end
end
