json.beacons @beacons do |beacon|
  json.partial! '/api/v1/shared/beacon', beacon: beacon
end

json.sections @action_types do |action_type|

  json.action_type do
    json.id action_type.last
    json.name action_type.first
  end

  json.actions @actions.where(action_type: action_type.last) do |action|
    json.partial! '/api/v1/shared/action', action: action
  end
end
