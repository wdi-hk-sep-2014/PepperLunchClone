class LunchMailer < ActionMailer::Base
  default from: "chefs@pepperlunch.com"

  def data_update_notification(user)
    @greeting = "WHY HELLO THERE"

    @lunch_count = user.lunches.count

    mail to: user.email
  end
end
