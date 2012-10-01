class Web::Projects::Keys::ApplicationController < Web::Projects::ApplicationController

  def key_resource
    project = project_resource

    project.keys.find(params[:key_id])
  end
end
