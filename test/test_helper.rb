ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  #log in user test
  def log_in_as(user, options = {})
<<<<<<< HEAD
    password = options[:password] || 'password'
=======
    password    = options[:password]    || 'password'
>>>>>>> ef5b458cfc2fc7b31cf6ba519ed95c4504ba2a57
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email: user.email,
                                  password: password,
                                  remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end
  
  private
  # Returns true inside an integration test.
  def integration_test?
    defined?(post_via_redirect)
  end
  
  
end
