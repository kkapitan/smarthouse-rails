json.action_subjects @subjects do |subject|
  json.partial! '/api/v1/shared/action_subject', subject: subject
end