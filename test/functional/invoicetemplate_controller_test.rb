require File.dirname(__FILE__) + '/../test_helper'
require 'invoicetemplate_controller'

# Re-raise errors caught by the controller.
class InvoicetemplateController; def rescue_action(e) raise e end; end

class InvoicetemplateControllerTest < Test::Unit::TestCase
  def setup
    @controller = InvoicetemplateController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
