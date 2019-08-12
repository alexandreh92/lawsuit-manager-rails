json.extract! contact, :id, :name, :lastname, :cpf, :rg, :birthdate, :profession_id, :marital_status_id, :address, :zipcode, :city, :state, :district, :number, :lawyer_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
