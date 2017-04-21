class Album < ApplicationRecord
  validates :title, :band_id, presence: true

  has_many(
    dependent: :destroy
    :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track
  )
  belongs_to(
    :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
  )
end
