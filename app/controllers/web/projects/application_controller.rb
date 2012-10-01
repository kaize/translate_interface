class Web::Projects::ApplicationController < Web::ProtectedController

  def project_resource
    Project.find(params[:project_id])
  end
end
