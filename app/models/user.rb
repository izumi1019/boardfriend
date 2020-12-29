      class User < ApplicationRecord
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
      devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable
      mount_uploader :image, ImageUploader
      validates :name, presence: true
      has_many :messages, dependent: :destroy
      has_many :entries, dependent: :destroy
      has_many :posts, dependent: :destroy
      has_many :participants, dependent: :destroy
      has_many :participated_posts, through: :participants, source: :post
      has_many :likes, dependent: :destroy
      has_many :liked_posts, through: :likes, source: :post
      has_many :active_notifications, class_name:'Notification', foreign_key: 'visitor_id', dependent: :destroy
      has_many :passive_notifications, class_name:'Notification',foreign_key: 'visited_id', dependent: :destroy
      def already_participated?(post)
            self.participants.exists?(post_id: post.id)
      end
      def already_liked?(post)
            self.likes.exists?(post_id: post.id)
      end
      end

