class Web::SessionsController < Web::ApplicationController
  def new
  end

  def create
    user = UserEditType.find_by_name(params[:user][:name])

    if user.try(:authenticate, params[:user][:password])
      reset_session

      sign_in(user)

      flash.now[:notice] = t('login.successful')
      redirect_to users_path
    else
      flash.now[:error] = 'lol'
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end
end