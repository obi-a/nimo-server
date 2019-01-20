module UserHelper
  def set_default_user_group
    self.groups << create_group if self.new_record?
  end

  private

  def create_group
    Group.create(
      name: "default_for:#{self.uuid}",
      owner: self,
      description: 'This is a default group'
    )
  end
end
