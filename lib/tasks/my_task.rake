require 'rake'

task :getSubjectState, [:id] => :environment do |t, args|
  id = args[:id]
  as = ActionSubject.find_by(id: id)
  puts as.state
end


task :setSubjectState, [:id, :state] => :environment do |t, args|
  id = args[:id]
  state = args[:state]
  as = ActionSubject.find_by(id: id)
  as.update_attributes state: ActionSubject.states.to_a[state.to_i].first
end
