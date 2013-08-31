ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "5ve.in",
  :user_name            => "mihirjb@gmail.com",
  :password             => "wcbmunhnmbcinotf",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
