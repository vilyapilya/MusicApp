class Band < ApplicationRecord
  validates :name, presence: true

  has_many(
    :albums,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
  )

end
