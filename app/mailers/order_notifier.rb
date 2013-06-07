class OrderNotifier < ActionMailer::Base
  def recieved(order)
    @order = order
    mail to: order.emil, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.recieved.subject
  #
end
