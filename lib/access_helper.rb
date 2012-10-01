module AccessHelper
  include AuthHelper

  def acl
    YaAcl::Acl.instance
  end

  def can? route_method, object = nil, action = nil, options = {}

    return true # not needed now

    url_options = send "hash_for_#{route_method}_path"
    resource = "#{url_options[:controller].to_s.camelize}Controller"
    privilege = action || url_options[:action]
    current_roles_for_object = current_roles_for(object)

#    p current_roles_for_object

    acl.allow? resource, privilege, current_roles_for_object, options
  end

  def current_roles_for object
    signed_in? ? current_user.roles_for(object) : [:guest]
  end
end