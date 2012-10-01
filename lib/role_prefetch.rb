module RolePrefetch
  def self.included(base)
    base.class_eval do
      include AccessHelper
    end

    base.singleton_class.class_eval do
      roles = base.new.acl.roles

      roles_hash = {}

      roles.each do |r, _|
        define_method r do
           roles_hash[r] ||= base.find_by_name(r)
        end
      end
    end
  end
end