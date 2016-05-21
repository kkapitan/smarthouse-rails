json.actions @actions do |action|
  json.partial! '/api/v1/shared/action', action: action
end