def log_in_as(user)
  post login_path, params: { session: { email: user.email,
                                      password: user.password } }
end

def log_out_as(user)
  post logout_path, params: { session: { email: user.email,
                                      password: user.password } }
end