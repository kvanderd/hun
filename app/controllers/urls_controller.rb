class UrlsController < ApplicationController

  def index
  end

  def new
  	@url = Url.new
  end

  def create
  	long_url = params[:url][:long]
  	short = "http://www.hun.io/" + SecureRandom.hex(2)
  	@url = Url.new(long: long_url, short: short)
    #if there are errors you can't save
    if @url.valid? == false
      puts "I am invalid and these are my errors" * 9
    else
      @url.save!
    end
  	respond_to do |format|
       format.html
       format.js
    end
  end

  def show
    @url = Url.find(params)
  end

   def show
    url = Url.find(params[:id])
    redirect_to url.long
  end

end