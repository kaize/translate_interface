class Web::Admin::UsersController < Web::ProtectedController

  def index
    @users = User.web.page(params[:page]).per(params[:per_page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = UserEditType.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: t('.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

      redirect_to users_path
  end

end
