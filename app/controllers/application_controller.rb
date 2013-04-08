class ApplicationController < ActionController::Base
  protect_from_forgery

  def save_or_flash_error(record)
    if record.save
      flash[:success] = "Saved."
    else
      flash[:error] =  record.errors.full_messages.join(".\n") + "."
    end
  end

  def past_day_totals(number_of_days = 1)
    a =(1..number_of_days).inject([[nil],[nil]]) do |arr, idx|
      arr[0][idx-1] = yield idx
      arr[1][idx-1] = Date::DAYNAMES[(Time.now - idx.day).wday][0..2]
      arr
    end
    a = [a[0].reverse, a[1].reverse]
  end  
end
