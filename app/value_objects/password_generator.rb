require 'securerandom'
class PasswordGenerator

  def self.generate!
    SecureRandom.hex
  end

end
