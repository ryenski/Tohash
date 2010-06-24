class HomeController < ApplicationController
  def index
    @sample_hash = Tuple.first
  end

end
