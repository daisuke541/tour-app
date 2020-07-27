class Post < ApplicationRecord
    
    belongs_to:user
    default_scope -> { order(created_at: :desc) }
    mount_uploader :picture, PictureUploader
    validates :user_id, presence: true
    validates :title, presence: true
    validates :content, presence: true, length: { maximum: 140 }
    validate :picture_size
    
    has_many :favorite_relationships, dependent: :destroy
    has_many :liked_by, through: :favorite_relationships, source: :user
    
   geocoded_by :address
   after_validation :geocode, if: :address_changed? 
    
     

    def self.search(search)
      if search
        where(['content LIKE ?', "%#{search}%"])
      else 
        all 
      end 
    end 
    
    private
    
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end    
end
