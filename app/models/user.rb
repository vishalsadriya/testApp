class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum
  enum role: %i[guest admin]

  # Association
  has_one :secret_code, dependent: :destroy

  accepts_nested_attributes_for :secret_code


  def secret_code_attributes=(secret_code_attrs)
    self.secret_code = SecretCode.find_or_initialize_by(id: secret_code_attrs[:id])
    self.secret_code.attributes = secret_code_attrs
  end
end
