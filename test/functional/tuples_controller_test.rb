require 'test_helper'

class TuplesControllerTest < ActionController::TestCase
  def setup
    @tuple = Tuple.create(:content => {:test => "true"})
  end
  
  test "should get show" do
    get :show, :id => @tuple.sha2
    assert_response :success
  end

end
