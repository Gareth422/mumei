require 'rails_helper'
describe Pruner::DestroyRemover do
  let(:board){ FactoryGirl.create(:board) }
  let(:board2){ FactoryGirl.create(:board) }

  before do
    5.times do
      FactoryGirl.create(:topic, board: board)
    end
    FactoryGirl.create(:topic, board: board2)
  end

  it "destroys topic in provided ids" do
    ids = [board.topics.first.id, board.topics.last.id]
    described_class.new(board, ids).perform
    board.topics.pluck(:id).should_not include(ids)
    board.topics.count.should == 3
  end

  it "does not destroy topic not belonging to the board" do
    ids = board2.topics.pluck(:id)

    described_class.new(board, ids).perform

    board2.topics.pluck(:id).should == ids
  end
end

