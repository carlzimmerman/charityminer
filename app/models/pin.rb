class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood

  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :unapproved, -> {where(approved_at: nil)}
  scope :approved, -> {where.not(approved_at: nil)}
  scope :descending, -> {order(created_at: :desc)}

end
