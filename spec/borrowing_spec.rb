# encoding: UTF-8

describe Borrowing do

  before :all do
    @en_GB = Borrowing.new 'localhost:9292', 'en_GB'
    @en_US = Borrowing.new 'localhost:9292', 'en_US'
  end

  describe '#autocorrect' do

    it 'autocorrects a sentence’s spelling' do
      @en_GB.autocorrect('sanitised aluminum').should == 'sanitised aluminium'
      @en_US.autocorrect('sanitised aluminum').should == 'sanitized aluminum'
    end

  end

  describe '#check' do

    it 'checks a sentence’s spelling' do
      @en_GB.check('colour of magic').should be_true
      @en_US.check('colour of magic').should be_false
    end

  end

  describe '#dicts' do

    it 'returns the available dictionaries' do
      @en_GB.dicts.should == ['en', 'en_CA', 'en_GB', 'en_US']
    end

  end

  describe '#errors' do

    it 'finds misspelled words in sentences' do
      @en_GB.errors('a sentence wtih smoe errors').should == ['wtih', 'smoe']
    end

  end

  describe '#suggest' do

    it 'suggests alternative spellings for a given word' do
      @en_GB.suggest('rewolutionary').should == ['revolutionary', 'evolutionary', 'reflationary', "revolutionary's"]
    end

  end

end
