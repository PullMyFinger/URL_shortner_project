class ShortenedURL < ActiveRecord::Base
  validates :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to(
    :submitter,
    class_name: :User,
    foreign_key: :submitter_id,
    primary_key: :id
  )

  def self.create_for_user_and_long_url(user, long_url)
    ShortenedURL.create!(
    long_url: long_url,
    submitter_id: user.id,
    short_url: ShortenedURL.random_code
    )
  end

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedURL.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end
end
