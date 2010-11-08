# encoding: UTF-8

describe Borrowing do

  context '#check' do

    it 'checks a sentence’s spelling' do
      Borrowing.new('localhost:9292', 'en_GB').check('colour of magic').should be_true
      Borrowing.new('localhost:9292', 'en_US').check('colour of magic').should be_false
    end

  end

  context '#dicts' do

    it 'returns the available dictionaries' do
      Borrowing.new('localhost:9292').dicts.should == ['en', 'en_CA', 'en_GB', 'en_US']
    end

  end

end
