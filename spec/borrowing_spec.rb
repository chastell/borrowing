# encoding: UTF-8

describe Borrowing do

  before :all do
    @en_GB = Borrowing.new('localhost:9292', 'en_GB')
    @en_US = Borrowing.new('localhost:9292', 'en_US')
  end

  context '#check' do

    it 'checks a sentence’s spelling' do
      @en_GB.check('colour of magic').should be_true
      @en_US.check('colour of magic').should be_false
    end

  end

  context '#dicts' do

    it 'returns the available dictionaries' do
      @en_GB.dicts.should == ['en', 'en_CA', 'en_GB', 'en_US']
    end

  end

  context '#errors' do

    it 'finds misspelled words in sentences' do
      @en_GB.errors('a sentence wtih smoe errors').should == ['wtih', 'smoe']
    end

  end

end
