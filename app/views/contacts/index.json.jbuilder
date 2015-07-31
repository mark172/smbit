json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :business_name, :email, :phone, :question1, :question2
  json.url contact_url(contact, format: :json)
end
