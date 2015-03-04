class ShortenedURL < ActiveRecord::Base
  # validates :long_url, presence: true
  # validates :short_url, uniqueness: true

  def random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedURL.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end
end
