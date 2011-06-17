class User
  def User.current=(user)
    Thread.current[:user] = user
  end
  
  def User.current
    Thread.current[:user]
  end
  
  include MongoMapper::Document
  include ActiveModel::SecurePassword
  has_secure_password
  
  key :email, String
  key :password_digest, String
  
  timestamps!
  
end
