class Note < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: {message: 'Please enter content'}, length: { maximum: 500, message: 'Max content length is %{count} characters' }
end
