require_relative "../../transition_types/base"
require_relative "../../cells/live"
require_relative "../../cells/dead"

RSpec.describe TransitionType::Base do
  subject { described_class.new(cell) }

  describe "#live_neighbors_count" do
    let(:cell) { double(:cell, neighbors: [Live.new(0,0), Dead.new(0,1), Live.new(0,2)]) }
    it { expect(subject.live_neighbors_count).to eq(2) }
  end
end
