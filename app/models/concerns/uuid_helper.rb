module UUIDHelper
  def set_uuid
    self.uuid = SecureRandom.uuid if self.new_record?
  end
end
