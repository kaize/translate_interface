class Web::UsersController < Web::ProtectedController

  # GET /users
  # GET /users.json
  def index
    @users = User.
        order("name").
        page(params[:page]).
        per(params[:per_page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = UserEditType.new(params[:user])

    if @user.save
      redirect_to @user, notice: t('.created')
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = UserEditType.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: t('.updated')
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

      redirect_to users_path
  end
end
