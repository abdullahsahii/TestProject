class UserMailer < Devise::Mailer
  def confirmation_instructions(record, token, opts = {})
    @resource = record
    @token = token
    mail(to: @resource.email, subject: 'Confirm your account')
  end
end