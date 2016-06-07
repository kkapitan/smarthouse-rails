json.id trigger.id

trigger_type = ActionTrigger.trigger_types[trigger.trigger_type]
json.type trigger_type

if trigger_type == 0
  json.partial! '/api/v1/shared/triggers/trigger_switch', trigger: trigger
end

if trigger_type == 1
  json.partial! '/api/v1/shared/triggers/trigger_daily_timer', trigger: trigger
end

if trigger_type == 2
  json.partial! '/api/v1/shared/triggers/trigger_weekly_timer', trigger: trigger
end

if trigger_type == 3
  json.partial! '/api/v1/shared/triggers/trigger_beacon', trigger: trigger
end