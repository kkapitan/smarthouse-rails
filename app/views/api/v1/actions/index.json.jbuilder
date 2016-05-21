json.actions @actions do |action|
  json.id action.id
  json.action_subject do
    json.id action.action_subject.id
    json.name action.action_subject.name
  end
end