class User < ApplicationRecord
  before_validation :generate_unique_code, on: :create
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :code, presence: true, uniqueness: true

  private

  def generate_unique_code
    loop do
      self.code = rand(100000..999999)
      Rails.logger.info "Generated code: #{self.code}"
      break unless User.exists?(code: code)
    end
  end
end
