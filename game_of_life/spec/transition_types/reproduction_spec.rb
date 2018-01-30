require_relative "../../transition_types/reproduction"
require_relative "../../cells/dead"

RSpec.describe TransitionType::Reproduction do
  let(:live_cell) { double(:live_cell, row: 99, col: 100) }
  subject { described_class.new(live_cell) }

  describe "#match?" do
    before do
      expect(subject).to receive(:live_neighbors_count).and_return(live_neighbors_count)
    end

    context "true" do
      let(:live_neighbors_count) { 3 }
      it { expect(subject.match?).to eq(true) }
    end

    context "false" do
      let(:live_neighbors_count) { 2 }
      it { expect(subject.match?).to eq(false) }
    end
  end

  describe "#new_generation" do
    it { expect(subject.new_generation).to match_cell(Live.new(99, 100)) }
  end
end
