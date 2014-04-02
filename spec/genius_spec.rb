require "./genius"

describe Genius do
  describe '#increment' do
    it 'increment the sequence' do
      genius = Genius.new
      size = genius.sequence.length
      genius.increment
      expect(genius.sequence.length).to eq(size+1)
    end
  end

  describe '#guess' do
  	it 'throw expcetion if make a wrong guess' do
  		genius = Genius.new
      expect{genius.guess(5)}.to raise_error
    end
    it 'increment the sequence if it`s the last guess' do
      genius = Genius.new
      genius.stub({:increment => true, :sequence => [2]})
      genius.guess(2)
      expect(genius).to(have_received(:increment))
    end
    it 'should be true if its the last guess' do
      genius = Genius.new
      genius.stub(:sequence => [2])
      expect(genius.guess(2)).to eq(true)
    end
    it 'should be false if its not the last guess' do
      genius = Genius.new
      genius.stub(:sequence => [2,3])
      expect(genius.guess(2)).to eq(false)
    end
  end
end