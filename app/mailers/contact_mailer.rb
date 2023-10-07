class ContactMailer < ApplicationMailer

   #メソッドに対して引数を設定
  def send_mail(group_name, mail_title, mail_content, customer_name, group_members)
    @customer_name = customer_name
    @group_name = group_name
    @mail_title = mail_title
    @mail_content = mail_content
    mail bcc: group_members.pluck(:email), subject: @mail_title
  end
end