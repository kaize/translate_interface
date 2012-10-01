class Web::UsersController < Web::ApplicationController

  before_filter 'authenticate_user!', :only => [:index, :show, :edit, :update, :delete]

  def index
    @users = User.web.page(params[:page]).per(params[:per_page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = UserEditType.new(params[:user])

    if @user.save
      UserRegistrationMailer.registration_email @user

      redirect_to @user, notice: t('.created')
    else
      render action: "new"
    end
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
