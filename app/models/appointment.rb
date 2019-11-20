class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  def summary
    "#{self.month} #{self.day} at #{self.time}"
  end

end
