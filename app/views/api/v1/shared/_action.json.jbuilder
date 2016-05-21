json.id action.id
json.action_subject do
  json.partial! '/api/v1/shared/action_subject', subject: action.action_subject
end