YaAcl::Builder.build do
  roles do
    role :admin
    role :owner
    role :translator
    role :user
    role :guest
  end

  resources :guest do
    resource 'Web::UsersController' do
      privilege :new
      privilege :create
    end

    resource 'Web::WelcomeController' do
      privilege :index
    end
  end

  resources :admin do
    resources :user do
      resource 'Web::UsersController' do
        privilege :index
        privilege :show
        privilege :edit
        privilege :update
        privilege :delete
      end
    end

    resource 'Web::LocalesController' do
      privilege :new
      privilege :create
      privilege :index
      privilege :show
      privilege :destroy
    end

    resource 'Web::RoleController' do
      privilege :new
      privilege :create
      privilege :index
      privilege :show
      privilege :destroy
    end

    resources :owner do
      resource 'Web::ProjectsController', [:user, :translator] do
        privilege :new, [:user]
        privilege :create, [:user]
        privilege :index, [:user, :translator]
        privilege :show, [:translator]
        privilege :edit
        privilege :update
        privilege :destroy
      end

      resource 'Web::Projects::KeysController', [:translator] do
        privilege :index, [:translator]
        privilege :show, [:translator]
        privilege :new
        privilege :create
        privilege :destroy
      end

      resource 'Web::Projects::TranslationsController', [:translator] do
        privilege :new, [:translator]
        privilege :create, [:translator]
        privilege :index, [:translator]
        privilege :show, [:translator]
        privilege :destroy
      end

      resource 'Web::Projects::ProjectLocalesController', [:translator] do
        privilege :new
        privilege :create
        privilege :index, [:translator]
        privilege :show, [:translator]
        privilege :destroy
      end

      resource 'Web::Projects::MembersController', [:translator] do
        privilege :new
        privilege :create
        privilege :edit
        privilege :update
        privilege :index, [:translator]
        privilege :show, [:translator]
        privilege :destroy
      end
    end
  end
  # user    - users read,
  #           guests create,
  #           admin writes

  # member(project)
  #         - users read,
  #           owner(project) writes

  # role    - users read,
  #           admin write

  # project - users create,
  #           owner(project)/admin writes,
  #           owner(project) controls state

  # key     - members(key.project) read,
  #           owner(key.project) loads

  # translation
  #         - members(translation.key.project) read/write,
  #           owner(translation.key.project) controls state

  # project_locale
  #         - members(project_locale.project) read
  #         - owner(project_locale.project) writes/controls_state
end