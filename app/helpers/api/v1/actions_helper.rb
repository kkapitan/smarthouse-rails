module Api::V1::ActionsHelper

  def add_cron_task(trigger, action)
    if trigger.trigger_type == :daily_timer
      add_daily_cron_task(trigger, action)
    end

    if trigger.trigger_type == :weakly_timer
      add_weakly_cron_task(trigger, actiob)
    end
  end

  private
  def add_daily_cron_task(trigger, action)

  end

  def add_weakly_cron_task(trigger, action)
    weeks = trigger.weeks
    days = trigger.week_days.to_s.tr('[]','')
    hour = trigger.day_hour

    conf = action.configuration
    state = Action.states[action.state].to_i
    as_id = action.action_subject_id

    task = "\"* #{hour} * * #{days} expr `date +\%W` \% weeks > /dev/null || /cronTask #{conf} #{state} #{as_id} #ID=#{action.id}\""
    system('sudo', '/addCronTask', task)
  end

end
