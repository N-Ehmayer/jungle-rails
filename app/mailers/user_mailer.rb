class UserMailer < ApplicationMailer

  def receipt_email(order)
    @order = order
    @user = order.email
    mail(to: @user, subject: 'Your Order Receipt')
  end

end
