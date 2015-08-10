class ContactMailer < ActionMailer::Base
    default to: 'mark172@icloud.com'
    
    def contact_email(first_name, last_name, business_name, email, phone, question1, question2)
        @first_name = first_name
        @last_name = last_name
        @business_name = business_name
        @email = email
        @phone = phone
        @question1 = question1
        @question2 = question2
        
        mail(from: email, subject: 'SMB IT Contact form message')
    end
end