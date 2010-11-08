require 'httparty'

class Borrowing

  include HTTParty

  def initialize(uri, dict = 'en')
    self.class.base_uri uri
    @dict = dict
  end

  def autocorrect text
    fetch('autocorrect', text)
  end

  def check text
    fetch('check', text)
  end

  def dicts
    self.class.get('/dicts').parsed_response
  end

  def errors text
    fetch('errors', text, false)
  end

  private

  def fetch(call, text, unwrap = true)
    result = self.class.get("/dicts/#{@dict}/#{call}", :query => { :text => text }).parsed_response
    unwrap ? result.first : result
  end

end
