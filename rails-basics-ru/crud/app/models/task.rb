# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  status      :string           default("new")
#  creator     :string
#  performer   :string
#  completed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  validates :name, :status, :creator, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
