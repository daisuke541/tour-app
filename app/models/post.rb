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
    has_many :tag_relationships, dependent: :destroy
    has_many :tag, through: :tag_relationships
      
    geocoded_by :address
    after_validation :geocode, if: :address_changed? 
   
    def save_tags(savepost_tags)
      savepost_tags.each do |new_name| 
        post_tag = Tag.find_or_create_by(name: new_name)
        self.tags << post_tag
      end 
    end 

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
