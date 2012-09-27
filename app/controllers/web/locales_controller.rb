class Web::LocalesController < Web::ProtectedController

  def index
    @locales = Locale.page(params[:page]).per(params[:per_page])
  end

  def show
    @locale = Locale.find(params[:id])
  end

  def new
    @locale = Locale.new
  end

  def create
    @locale = Locale.new params[:locale]

    if @locale.save
      redirect_to @locale, notice: t('.created')
    else
      render action: "new"
    end
  end

  def edit
    @locale = Locale.find(params[:id])
  end

  def update
    @locale = Locale.find(params[:id])

    if @locale.update_attributes(params[:locale])
      redirect_to @locale, notice: t('.updated')
    else
      render action: "edit"
    end
  end

  def destroy
    @locale = Locale.find(params[:id])
    @locale.destroy

    redirect_to locales_path
  end

end
