json.user do
  json.partial! '/api/v1/shared/user_with_token', user: @user
end