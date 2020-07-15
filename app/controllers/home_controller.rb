class HomeController < ApplicationController
  def index
    @article = Areicle.first
  end

  def about
  end
end  