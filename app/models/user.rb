class User < ApplicationRecord
# Device
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

# Associations
has_many :workout_plans, dependent: :destroy
has_many :workouts,      dependent: :destroy

# Normalization (Rails 7.1+ has `normalizes`; otherwise use before_validation)
before_validation -> { self.email = email.to_s.strip.downcase }


# Names (allow Unicode letters, spaces, apostrophes, hyphens)
NAME_REGEX = /\A[\p{L}\p{M}\s'’-]+\z/u

validates :first_name, presence: true,
                        length: { minimum: 2, maximum: 30 },
                        format: { with: NAME_REGEX, message: "only letters, spaces, apostrophes, and hyphens" }
validates :last_name,  presence: true,
                        length: { minimum: 2, maximum: 40 },
                        format: { with: NAME_REGEX, message: "only letters, spaces, apostrophes, and hyphens" }
end
