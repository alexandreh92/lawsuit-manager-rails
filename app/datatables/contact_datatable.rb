# frozen_string_literal: true

class ContactDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: 'Dashboard::Contact.id', cond: :eq },
      name: { source: 'Dashboard::Contact.name', cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: "#{record.name} #{record.lastname}",
        cpf: record.cpf,
        city: record.city,
        state: record.state,
        phones: record.phones.collect(&:number).join('<br>').html_safe
        # example:
        # id: record.id,
        # name: record.name
      }
    end
  end

  def get_raw_records
    Dashboard::Contact.all
    # insert query here
    # User.all
  end
end
