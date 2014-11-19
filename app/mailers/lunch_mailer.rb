class LunchMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lunch_mailer.data_update_notification.subject
  #
  def data_update_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
