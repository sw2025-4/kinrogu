class Review < ApplicationRecord
    belongs_to :user
    has_many :bookmarks, dependent: :destroy
    has_one_attached :image
    geocoded_by :location
    after_validation :geocode, if: ->(obj){ obj.location.present? && obj.location_changed? }
    def image_url
      return nil unless image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    end
end
