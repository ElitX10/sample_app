class Cat < ApplicationRecord
  validates :name, presence: {}, uniqueness: {}
  validates :email, presence: {}, uniqueness: {}
  validates :password, presence: {}

  before_save :encrypt_password

  def has_password?(password_soumis)
    password == encrypt(password_soumis)
  end

  private

  def encrypt_password
    self.password = encrypt(password)
  end

  def encrypt(string)
    string
  end
end
