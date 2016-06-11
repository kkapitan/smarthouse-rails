json.id subject.id
json.name subject.name

json.state do
  json.id ActionSubject.states[subject.state]
  json.name subject.state
end

json.image_url 'http://smarthouse.25.111.133.199.xip.io/assets/Light-bulb.png'


