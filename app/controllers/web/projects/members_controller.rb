class Web::Projects::MembersController < Web::Projects::ApplicationController

  def index
    members = project_resource.members

    @members = members.page(params[:page]).per(params[:per_page])
  end

  def show
    members = project_resource.members

    @member = members.find(params[:id])
  end

  def new
    members = project_resource.members

    @member = members.build
  end
=begin
  def edit
    members = project_resource.members

    @member = members.find(params[:id])
  end
=end
  def create
    members = project_resource.members

    @member = members.build params[:member]

    if @member.save
      redirect_to [@member.project, @member], notice: t('.created')
    else
      render action: "new"
    end
  end
=begin
  def update
    members = project_resource.members

    @member = members.find(params[:id])

    if @member.update_attributes(params[:member])
      redirect_to [@member.project, @member], notice: t('.updated')
    else
      render action: "edit"
    end
  end
=end
  def destroy
    members = project_resource.members

    @member = members.find(params[:id])

    @member.destroy

    redirect_to project_members_path
  end

end
