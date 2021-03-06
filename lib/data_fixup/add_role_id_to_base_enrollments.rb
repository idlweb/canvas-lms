module DataFixup::AddRoleIdToBaseEnrollments
  def self.run
    Role.built_in_course_roles.each do |base_role|
      while Enrollment.where("role_id IS NULL AND type = ?", base_role.name).limit(1000).update_all(:role_id => base_role.id) > 0; end
    end
  end
end