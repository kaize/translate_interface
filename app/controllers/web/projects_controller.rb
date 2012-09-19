class Web::ProjectsController < Web::ProtectedController

#  extend FriendlyId

#  friendly_id :id, use: :slugged

  def index
    @projects = Project.page(params[:page]).per(params[:per_page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new params[:project]

    owner = Role.find_by_name(:owner)

    @project.members.build :user => current_user, :role => role

    if @project.save
      redirect_to @project, notice: t('.created')
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: t('.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

end
