require_relative "../cells/live"
require_relative "../cells/dead"

RSpec.describe Cell do
  subject { described_class.new(row, col, generation) }

  describe "#neighbors" do
    context "no neighbors" do
      let(:row) { 0 }
      let(:col) { 0 }
      let(:generation) { [Live.new(0,0)] }

      it { expect(subject.neighbors).to eq([]) }
    end

    context "only n5" do
      let(:row) { 0 }
      let(:col) { 0 }
      let(:generation) { [Live.new(0,0), Live.new(0,1)] }

      it do
        expect(subject.neighbors.length).to eq(1)
        expect(subject.neighbors[0]).to match_cell(Live.new(0,1))
      end
    end

    context "only [n1, n2, n4]" do
      let(:row) { 1 }
      let(:col) { 1 }
      let(:generation) do
       [
         Live.new(0,0), Live.new(0,1),
         Dead.new(1,0), Live.new(1,1),
       ]
      end

      it do
        expect(subject.neighbors.length).to eq(3)
        expect(subject.neighbors[0]).to match_cell(Live.new(0,0))
        expect(subject.neighbors[1]).to match_cell(Live.new(0,1))
        expect(subject.neighbors[2]).to match_cell(Dead.new(1,0))
      end
    end

    context "all neighbors" do
      let(:row) { 1 }
      let(:col) { 1 }
      let(:generation) do
       [
         Live.new(0,0), Live.new(0,1), Dead.new(0,2),
         Dead.new(1,0), Live.new(1,1), Dead.new(1,2),
         Live.new(2,0), Dead.new(2,1), Dead.new(2,2)
       ]
      end

      it do
        expect(subject.neighbors.length).to eq(8)
        expect(subject.neighbors[0]).to match_cell(Live.new(0,0))
        expect(subject.neighbors[1]).to match_cell(Live.new(0,1))
        expect(subject.neighbors[2]).to match_cell(Dead.new(0,2))

        expect(subject.neighbors[3]).to match_cell(Dead.new(1,0))
        expect(subject.neighbors[4]).to match_cell(Dead.new(1,2))

        expect(subject.neighbors[5]).to match_cell(Live.new(2,0))
        expect(subject.neighbors[6]).to match_cell(Dead.new(2,1))
        expect(subject.neighbors[7]).to match_cell(Dead.new(2,2))
      end
    end
  end

  describe "#like" do
    let(:row) { 0 }
    let(:col) { 0 }
    let(:generation) { nil }

    context "true" do
      let(:other_cell) { described_class.new(0,0) }
      it { expect(subject.like(other_cell)).to eq(true) }
    end

    context "false" do
      let(:other_cell) { described_class.new(1,0) }
      it { expect(subject.like(other_cell)).to eq(false) }
    end
  end

  describe "#new_generation" do
    let(:row) { 0 }
    let(:col) { 0 }
    let(:generation) { nil }

    it { expect(subject.new_generation).to eq(subject) }
  end
end
