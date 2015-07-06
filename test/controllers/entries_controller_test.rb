require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
     protect_from_forgery with: :exception
     before_action :authenticate_user!
end
