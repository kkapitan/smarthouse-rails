json.id action.id
json.action_type action.action_type
json.action_subject do
  json.partial! '/api/v1/shared/action_subject', subject: action.action_subject
end