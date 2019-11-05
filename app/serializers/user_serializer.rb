class UserSerializer
  def initialize(user)
    @user = user
  end

  def json
    {
      api_key: @user.api_key
    }
  end
end
