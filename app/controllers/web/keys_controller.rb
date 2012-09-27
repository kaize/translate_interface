class Web::KeysController < Web::ProtectedController

  def index
    @keys = Key.page(params[:page]).per(params[:per_page])
  end

  def show
    @key = Key.find(params[:id])
  end

  def new
    @key = Key.new
  end

  def edit
    @key = Key.find(params[:id])
  end

  def create
    @key = Key.new params[:key]

    if @key.save
      redirect_to @key, notice: t('.created')
    else
      render action: "new"
    end
  end

  def update
    @key = Key.find(params[:id])

    if @key.update_attributes(params[:key])
      redirect_to @key, notice: t('.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @key = Key.find(params[:id])
    @key.destroy

    redirect_to keys_path
  end

end
