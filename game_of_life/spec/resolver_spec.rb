require_relative "../resolver"

RSpec.describe Resolver do
  subject { described_class.new(generation) }

  describe "#generate" do
    context "any live cell with fewer than two live neighbors dies (underpopulation)" do
      let(:generation) do
        [
          Live.new(0,0), Dead.new(0,1), Dead.new(0,2),
          Live.new(1,0), Dead.new(1,1), Dead.new(1,2)
        ]
      end
      it do
        expect(subject.generate[0]).to match_cell(Dead.new(0,0))
        expect(subject.generate[1]).to match_cell(Dead.new(0,1))
        expect(subject.generate[2]).to match_cell(Dead.new(0,2))

        expect(subject.generate[3]).to match_cell(Dead.new(1,0))
        expect(subject.generate[4]).to match_cell(Dead.new(1,1))
        expect(subject.generate[5]).to match_cell(Dead.new(1,2))
      end
    end

    context "any live cell with two or three live neighbors lives" do
      context "two live neighbors" do
        let(:generation) do
          [
            Live.new(0,0), Live.new(0,1), Live.new(0,2)
          ]
        end
        it do
          expect(subject.generate[0]).to match_cell(Dead.new(0,0))
          expect(subject.generate[1]).to match_cell(Live.new(0,1))
          expect(subject.generate[2]).to match_cell(Dead.new(0,2))
        end
      end

      context "three live neighbors" do
        let(:generation) do
          [
            Live.new(0,0), Live.new(0,1), Dead.new(0,2),
            Live.new(1,0), Live.new(1,1), Dead.new(1,2)
          ]
        end
        it do
          expect(subject.generate[0]).to match_cell(Live.new(0,0))
          expect(subject.generate[1]).to match_cell(Live.new(0,1))
          expect(subject.generate[2]).to match_cell(Dead.new(0,2))

          expect(subject.generate[3]).to match_cell(Live.new(1,0))
          expect(subject.generate[4]).to match_cell(Live.new(1,1))
          expect(subject.generate[5]).to match_cell(Dead.new(1,2))
        end
      end
    end

    context "any live cell with more than three live neighbors dies (overpopulation)" do
      let(:generation) do
        [
          Live.new(0,0), Live.new(0,1), Live.new(0,2),
          Live.new(1,0), Live.new(1,1), Live.new(1,2)
        ]
      end
      it do
        expect(subject.generate[0]).to match_cell(Live.new(0,0))
        expect(subject.generate[1]).to match_cell(Dead.new(0,1))
        expect(subject.generate[2]).to match_cell(Live.new(0,2))

        expect(subject.generate[3]).to match_cell(Live.new(1,0))
        expect(subject.generate[4]).to match_cell(Dead.new(1,1))
        expect(subject.generate[5]).to match_cell(Live.new(1,2))
      end
    end

    context "any dead cell with exactly three live neighbors becomes a live cell (reproduction)" do
      let(:generation) do
        [
          Live.new(0,0), Live.new(0,1), Dead.new(0,2),
          Dead.new(1,0), Live.new(1,1), Dead.new(1,2)
        ]
      end
      it do
        expect(subject.generate[0]).to match_cell(Live.new(0,0))
        expect(subject.generate[1]).to match_cell(Live.new(0,1))
        expect(subject.generate[2]).to match_cell(Dead.new(0,2))

        expect(subject.generate[3]).to match_cell(Live.new(1,0))
        expect(subject.generate[4]).to match_cell(Live.new(1,1))
        expect(subject.generate[5]).to match_cell(Dead.new(1,2))
      end
    end
  end
end
