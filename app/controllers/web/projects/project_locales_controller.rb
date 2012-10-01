class Web::Projects::ProjectLocalesController < Web::Projects::ApplicationController

  def index
    project_locales = project_resource.project_locales

    @project_locales = project_locales.page(params[:page]).per(params[:per_page])
  end

  def show
    project_locales = project_resource.project_locales

    @project_locale = project_locales.find(params[:id])
  end

  def new
    project_locales = project_resource.project_locales

    @project_locale = project_locales.build
  end

  def create
    project_locales = project_resource.project_locales

    @project_locale = project_locales.build params[:project_locale]

    if @project_locale.save
      redirect_to [@project_locale.project, @project_locale], notice: t('.created')
    else
      render action: "new"
    end
  end

  def destroy
    project_locales = project_resource.project_locales

    @project_locale = project_locales.find(params[:id])

    @project_locale.destroy

    redirect_to project_project_locales_path
  end

end
