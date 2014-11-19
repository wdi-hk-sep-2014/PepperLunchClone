class LunchMailer < ActionMailer::Base
  default from: "chefs@pepperlunch.com"

  def data_update_notification
    @greeting = "WHY HELLO THERE VALUED CUSTOMER!"

    mail to: "mark.wilson@generalassemb.ly"
  end
end
