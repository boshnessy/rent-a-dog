require 'Unirest'

# CREATE USER
response = Unirest.post(
  "http://localhost:3000/users",
  parameters: {
    name: "Peter",
    email: "peter@email.com",
    password: "password",
    password_confirmation: "password"
  }
)
user = response.body
p user

# LOGIN
response = Unirest.post(
  "http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "peter@email.com",
      password: "password"
    }
  }
)
jwt = response.body["jwt"]
p jwt
Unirest.default_header("Authorization", "Bearer #{jwt}")
