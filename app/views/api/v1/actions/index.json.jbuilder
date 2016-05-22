json.action_types @action_types do |action_type|
  json.name action_type.first
end

json.actions @actions do |action|
  json.partial! '/api/v1/shared/action', action: action
end