module SecureTools

  def generate_token
    SecureRandom.hex
  end

end