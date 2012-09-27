class Web::MembersController < Web::ProtectedController

  def index
    @members = Member.page(params[:page]).per(params[:per_page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = MemberEditType.new params[:member]

    if @member.save
      redirect_to @member, notice: t('.created')
    else
      render action: "new"
    end
  end

  def update
    @member = MemberEditType.find(params[:id])

    if @member.update_attributes(params[:member])
      redirect_to @member, notice: t('.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_path
  end

end
