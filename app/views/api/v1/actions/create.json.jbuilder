json.action do
  json.partial! '/api/v1/shared/action', action: @action
end