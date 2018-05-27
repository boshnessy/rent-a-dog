class UserTokenController < Knock::AuthTokenController
  include Knock::Authenticable
end
