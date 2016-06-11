module Api::V1::ActionsHelper

  def add_cron_task(trigger, action)
    print "Robie!"
    if trigger.trigger_type == :daily_timer
      add_daily_cron_task(trigger, action)
    end

    if trigger.trigger_type == :weakly_timer
      add_weakly_cron_task(trigger, actiob)
    end
  end

  private
  def add_daily_cron_task(trigger, action)
    time = trigger.minutes + trigger.hours * 60
    days = trigger.week_days.to_s.tr('[]','')
    start = Time.at(trigger.start_hour).hour*60 + Time.at(trigger.start_hour).min
    endd = Time.at(trigger.finish_hour)*60 + Time.at(trigger.finish_hour).min

    conf = action.configuration
    state = Action.states[action.state].to_i
    as_id = action.action_subject_id

    task = "\"* * * * #{days} expr `date +(%H*60+%M) | bc` \% #{time} > /dev/null || [ `date +(%H*60+%M) | bc` -lt #{start} ] || [ `date +(%H*60+%M) | bc` -gt #{endd} ] || /cronTask #{conf} #{state} #{as_id} #ID=#{action.id}\""
    system('sudo', '/addCronTask', task)

  end

  def add_weakly_cron_task(trigger, action)
    print "Robie KURWA!!!"
    weeks = trigger.weeks
    days = trigger.week_days.to_s.tr('[]','')
    hour = Time.at(trigger.day_hour).hour
    minutes = Time.at(trigger.day_hour).min

    conf = action.configuration
    state = Action.states[action.state].to_i
    as_id = action.action_subject_id

    task = "\"#{minutes} #{hour} * * #{days} expr `date +\%W` \% #{weeks} > /dev/null || /cronTask #{conf} #{state} #{as_id} #ID=#{action.id}\""
    system('sudo', '/addCronTask', task)
  end

end
