require 'httparty'

class Borrowing

  include HTTParty

  def initialize(uri, dict = 'en')
    self.class.base_uri uri
    @dict = dict
  end

  def dicts
    self.class.get('/dicts').parsed_response
  end

  def method_missing(method, *args, &block)
    case method
    when :autocorrect, :check then fetch(method, args.first)
    when :errors, :suggest    then fetch(method, args.first, false)
    else super
    end
  end

  private

  def fetch(call, text, unwrap = true)
    result = self.class.get("/dicts/#{@dict}/#{call}", :query => { :text => text }).parsed_response
    unwrap ? result.first : result
  end

end
