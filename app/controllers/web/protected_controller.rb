class Web::ProtectedController < Web::ApplicationController
  include AuthHelper
  include AccessHelper

  before_filter 'authenticate_user!'
end