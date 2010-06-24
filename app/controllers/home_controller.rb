class HomeController < ApplicationController
  def index
    @sample_hash = Tuple.find_by_sha2("56bbdda335500fc38e1c10458f2e5865e1927c5978e9b0a3667db67196fc77dc")
  end

end
