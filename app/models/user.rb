class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome, :endereco, :telefone, 
  		 :filename, :size, :content_type, :width, :height, :thumbnail, :avatar, :avatar_cache
  # attr_accessible :title, :body

  mount_uploader :avatar, AvatarUploader
    def type?(t)
      if type==t
        logger.debug "Possui a Role: #{self.type}" 
        return true
      end
    return false
    end

    def tipo
      return type
    end
end
