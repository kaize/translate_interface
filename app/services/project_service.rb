class ProjectService
  def self.create args = {}
    name = args[:name]
    user = args[:user]
    project = Project.new :name => name

    project.save

    owner = Role.find_by_name :owner

    member = Member.new :user => user,
                     :project => project,
                        :role => owner

    member.save and project.save and return project
  end
end