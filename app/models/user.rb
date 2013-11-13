class User < ActiveRecord::Base
  include BCrypt

  def self.login(email, password)
    user = User.find_by_email(email)

    if user
      hash = Engine.hash_secret(password, user.salt)
      password_hash = Password.new(hash)

      user_hash = UserHash.find_by_full_hash(password_hash.checksum)

      return user_hash ? true : false
    else
      false
    end
  end

  def self.create_user(email, password)
    password_hash = Password.create(password)

    User.create! email: email, salt: password_hash.salt
    UserHash.create! full_hash: password_hash.checksum
  end

end
