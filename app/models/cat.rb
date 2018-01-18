class Cat < ApplicationRecord
  attr_accessor :password

  validates :name, presence: {}, uniqueness: {}
  validates :email, presence: {}, uniqueness: {}
  validates :password, presence: {}

  before_save :encrypt_password

  def has_password?(password_soumis)
    password == encrypt(password_soumis)
  end

  def self.authenticate(email, submitted_password)
    cat = find_by_email(email)
    return nil  if cat.nil?
    return cat if cat.has_password?(submitted_password)
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
