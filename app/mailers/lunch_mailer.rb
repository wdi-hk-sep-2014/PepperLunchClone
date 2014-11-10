class LunchMailer < ActionMailer::Base
  default from: "chefs@pepperlunch.com"

  def data_update_notification(user)
    @lunch_count = user.lunches.count
    @lunch_dates = user.lunches.pluck(:lunch_date)

    mail to: user.email, subject: "Lunch tracking update!"
  end
end
