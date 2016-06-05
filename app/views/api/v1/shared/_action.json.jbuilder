json.id action.id

json.action_type do
  json.id action.action_type.last
  json.name action.action_type.first
end

json.action_subject do
  json.partial! '/api/v1/shared/action_subject', subject: action.action_subject
end