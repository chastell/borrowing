require 'httparty'

class Borrowing

  include HTTParty

  def initialize(uri, dict = 'en')
    self.class.base_uri uri
    @dict = dict
  end

  def autocorrect text
    self.class.get("/dicts/#{@dict}/autocorrect", :query => { :text => text }).first
  end

  def check text
    self.class.get("/dicts/#{@dict}/check", :query => { :text => text }).first
  end

  def dicts
    self.class.get('/dicts').parsed_response
  end

  def errors text
    self.class.get("/dicts/#{@dict}/errors", :query => { :text => text })
  end

end
