class Web::Projects::Keys::TranslationsController < Web::Projects::Keys::ApplicationController

  def index
    translations = key_resource.translations

    @translations = translations.page(params[:page]).per(params[:per_page])
  end

  def show
    translations = key_resource.translations

    @translation = translations.find(params[:id])
  end

  def new
    translations = key_resource.translations

    @translation = translations.build
  end
=begin
  def edit
    @translation = key_resource.translations.find(params[:id])
  end
=end
  def create
    translations = key_resource.translations

    @translation = translations.build params[:translation]

    member = Member.find_by_user_id_and_project_id current_user, project_resource

    @translation.member = member

    if @translation.save
      redirect_to [@translation.project, @translation.key, @translation], notice: t('.created')
    else
      render action: "new"
    end
  end
=begin
  def update
    @translation = key_resource.translations.find(params[:id])

    if @translation.update_attributes(params[:translation])
      redirect_to @translation, notice: t('.updated')
    else
      render action: "edit"
    end
  end
=end
  def destroy
    translations = key_resource.translations

    @translation = translations.find(params[:id])

    @translation.destroy

    redirect_to project_key_translations_path
  end

end
