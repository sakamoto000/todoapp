# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
has_one_attached :eyecatch

  validates :title, presence: true
  validates :title, length: { minimum: 2 }
  validates :title, format: { with: /\A(?!\@)/ }

  validates :content, presence: true
  validates :content, length: { minimum: 10  }
  validates :content, uniqueness: true

  has_many :comments, dependent: :destroy
  belongs_to :user


  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def auther_name
    user.display_name
  end

end
