describe Borrowing do

  context '#dicts' do

    it 'returns the available dictionaries' do
      Borrowing.new('localhost:9292').dicts.should == ['en', 'en_CA', 'en_GB', 'en_US']
    end

  end

end
