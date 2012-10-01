class Web::Projects::KeysController < Web::Projects::ApplicationController

  def index
    keys = project_resource.keys

    @keys = keys.page(params[:page]).per(params[:per_page])
  end

  def show
    keys = project_resource.keys

    @key = keys.find(params[:id])
  end

  def new
    keys = project_resource.keys

    @key = keys.build
  end

  def edit
    keys = project_resource.keys

    @key = keys.find(params[:id])
  end

  def create
    keys = project_resource.keys

    @key = keys.build params[:key]

    if @key.save
      redirect_to [@key.project, @key], notice: t('.created')
    else
      render action: "new"
    end
  end

  def update
    keys = project_resource.keys

    @key = keys.find(params[:id])

    if @key.update_attributes(params[:key])
      redirect_to [@key.project, @key], notice: t('.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    project = project_resource

    keys = project.keys

    @key = keys.find(params[:id])

    @key.destroy

    redirect_to project_key_path
  end

end
