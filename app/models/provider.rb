class Provider < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true
  mount_uploader :avatar, PictureUploader
  scope :google, -> { where(provider: "google_oauth2").first }
  scope :facebook, -> { where(provider: "facebook").first }
end
