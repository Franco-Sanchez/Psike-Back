class Comment < ApplicationRecord
  belongs_to :patient
  belongs_to :appointment
  belongs_to :message, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'message_id',
                     dependent: :destroy, inverse_of: false

  enum category: { main_comment: 0, reply: 1 }

  validates :category, presence: true
  validate :message_validation

  private

  def message_validation
    if reply?
      errors.add(:message_id, 'Should be a validate Comment id') unless Comment.exists?(message_id)
    elsif main_comment?
      errors.add(:message_id, 'Shoud be null if main_comment') unless message_id.nil?
    end
  end
end
