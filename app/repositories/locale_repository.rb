module LocaleRepository
  extend ActiveSupport::Concern
  include UsefullScopes

  included do
    scope :web, ->{by_name}
  end
end