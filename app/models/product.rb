class Product < ApplicationRecord
  has_attached_file :image, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :store
  has_and_belongs_to_many :shopping_carts
  belongs_to :user
  belongs_to :category

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true

end
