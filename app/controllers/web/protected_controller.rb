class Web::ProtectedController < Web::ApplicationController
  before_filter 'authenticate_user!'
end