json.id action.id

json.action_type do
  json.id Action.action_types[action.action_type]
  json.name action.action_type
end

if action.state.present?
  json.state do
    json.id Action.states[action.state]
    json.name action.state
  end
end

json.action_subject do
  json.partial! '/api/v1/shared/action_subject', subject: action.action_subject
end

if  action.action_trigger.present?
  json.trigger do
    json.partial! '/api/v1/shared/triggers/trigger', trigger: action.action_trigger
  end
end
