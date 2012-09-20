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
    @member = Member.new params[:member]

    if @member.save
      redirect_to @member, notice: t('.created')
    else
      render action: "new"
    end
  end

  def update
    @member = Member.find(params[:id])

    puts "#{params[:member].inspect}\n"

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
