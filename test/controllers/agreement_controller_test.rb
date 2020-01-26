require 'test_helper'

class AgreementControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get agreement_show_url
    assert_response :success
  end

end
