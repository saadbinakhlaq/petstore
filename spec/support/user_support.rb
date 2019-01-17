def sign_in(user)
  @request.headers['Authorization'] = user.id
end