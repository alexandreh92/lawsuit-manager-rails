# frozen_string_literal: true

namespace :dummy do
  desc 'TODO'
  task seed: :environment do
    require 'cpf_cnpj'

    # GENERATES DUMMY RECORDS

    ### CREATING DUMMY PROFESSIONS
    profession = %w[Pintor
                    Pedreiro
                    Marceneiro
                    Engeheiro
                    Eletricista]

    profession.each do |professions|
      Profession.find_or_create_by(description: professions) do |_w|
        puts 'Creating profession ' + professions + '...'
      end
    end
    ###

    ### CREATING DUMMY MARITAL STATUSES
    marital_status = ['Solteiro(a)',
                      'Casado(a)',
                      'Divorciado(a)',
                      'Viúvo(a)',
                      'União Estável']

    marital_status.each do |marital|
      MaritalStatus.find_or_create_by(description: marital) do |_w|
        puts 'Creating marital status ' + marital + '...'
      end
    end
    ###

    ### CREATING DUMMY FORUMS
    forum = ['1ª Vara da Infância de Cascavel',
             '1ª Vara Federal de Cascavel',
             'Juizado Especial de Cascavel',
             '3 ªVara Civel de Toledo',
             'Juizado Especial Criminal Adjunto de Curitiba']

    forum.each do |forums|
      Forum.find_or_create_by(name: forums) do |_w|
        puts 'Creating forum ' + forums + '...'
      end
    end
    ###

    ### CREATING DUMMY LAWYERS
    lawyer = %w[Jose
                Maria
                Enrique
                Miguel]

    lawyer.each do |lawyers|
      Lawyer.find_or_create_by(name: lawyers) do |_w|
        puts 'Creating lawyer ' + lawyers + '...'
      end
    end
    ###

    ### CREATING DUMMY CONTACTS
    contact = []
    10.times do
      contact << [{
        name: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        cpf: CPF.generate(true),
        birthdate: '01/01/1992',
        profession: Profession.all.sample,
        marital_status: MaritalStatus.all.sample,
        address: Faker::Address.street_name,
        zipcode: Faker::Address.zip_code,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        district: Faker::Address.community,
        number: Faker::Address.building_number
      }]
    end
    contact.each do |key, _value|
      Contact.find_or_create_by(name: key[:name], lastname: key[:lastname], cpf: key[:cpf], birthdate: key[:birthdate],
                                profession: key[:profession], marital_status: key[:marital_status], address: key[:address],
                                zipcode: key[:zipcode], city: key[:city], state: key[:state], district: key[:district], number: key[:number] ) do |_w|
        puts 'Creating contact ' + key[:name] + ' ' + key[:lastname] + '...'
      end
    end
    ###
  end
end
