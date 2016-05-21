json.user do
  json.partial! '/api/v1/shared/user_basic', user: @user
end