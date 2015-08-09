class ContactMailer < ActionMailer::Base
    default to: 'mark172@me.com'
    
    def contact_email(first_name, last_name, email, phone)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @phone = phone
        
        mail(from: email, subject: 'Contact form message')
    end
end