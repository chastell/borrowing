require 'httparty'

class Borrowing

  include HTTParty

  def initialize uri
    self.class.base_uri uri
  end

  def dicts
    self.class.get('/dicts').parsed_response
  end

end
