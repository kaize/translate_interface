class Web::ProjectLocalesController < Web::ProtectedController

  def index
    @project_locales = ProjectLocale.page(params[:page]).per(params[:per_page])
  end

  def show
    @project_locale = ProjectLocale.find(params[:id])
  end

  def new
    @project_locale = ProjectLocale.new
  end

  def create
    @project_locale = ProjectLocaleEditType.new params[:project_locale_id]

    if @project_locale.save
      redirect_to @project_locale, notice: t('.created')
    else
      render action: "new"
    end
  end

=begin
  % does it need to be updated?

  def edit
    @project_locale = ProjectLocale.find(params[:id])
  end

  def update
    @project_locale = ProjectLocaleEditType.find(params[:id])

    if @project_locale.update_attributes(params[:project_locale])
      redirect_to @project_locale, notice: t('.updated')
    else
      render action: "edit"
    end
  end
=end

  def destroy
    @project_locale = ProjectLocale.find(params[:id])
    @project_locale.destroy

    redirect_to project_locales_path
  end

end
