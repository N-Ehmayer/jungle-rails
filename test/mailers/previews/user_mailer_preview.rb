class UserMailerPreview < ActionMailer::Preview
  def receipt_email
    UserMailer.receipt_email(Order.find(10))
  end
end