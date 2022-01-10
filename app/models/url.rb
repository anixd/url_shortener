# frozen_string_literal: true

class Url < ApplicationRecord
  BASE_URL = 'http://localhost:3000/'

  validates :original_url, presence: true
  validates :short_url, presence: true, uniqueness: true
  validate :original_url_status

  before_validation :create_short_url

  attr_accessor :custom_url

  def create_short_url
    self.short_url = custom_url.present? ? custom_url : SecureRandom.alphanumeric(8)
  end

  def formatted_date
    created_at.strftime('%d.%m.%Y')
  end

  def self.destroy_old_urls
    Url.where('created_at < ?', 5.days.ago).destroy_all
  end

  private

  def original_url_status
    status = Faraday.get(original_url).status.to_i
    @errors.add(:original_url, 'Not valid URL') unless status == 200
  end

end
