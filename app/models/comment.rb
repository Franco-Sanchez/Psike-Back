class Comment < ApplicationRecord
  belongs_to :patient
  belongs_to :appointment
  belongs_to :message, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'message_id',
                     dependent: :destroy, inverse_of: false
end
