# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### CREATING MARITAL STATUSES
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

### CREATING PROFESSIONS
profession = ['Administrador de Empresas',
              'Advogado',
              'Agronomo',
              'Arquiteto',
              'Artista Plástico']

profession.each do |professions|
  Profession.find_or_create_by(description: professions) do |_w|
    puts 'Creating profession ' + professions + '...'
  end
end
###

### CREATING LAWYERS
lawyer = %w[Carlos
            Glenda
            Marcelo
            Raquel]

lawyer.each do |lawyers|
  Lawyer.find_or_create_by(name: lawyers) do |_w|
    puts 'Creating lawyer ' + lawyers + '...'
  end
end
###
