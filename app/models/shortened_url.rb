# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to(
    :submitter,
    class_name: :User,
    foreign_key: :submitter_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: :Visit,
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  has_many :visitors, through: :visits, source: :user

  def self.create_for_user_and_long_url(user, long_url)
    ShortenedUrl.create!(
    long_url: long_url,
    submitter_id: user.id,
    short_url: ShortenedUrl.random_code
    )
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end
end
