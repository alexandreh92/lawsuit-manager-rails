class LawsuitDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
        autos: { source: "Dashboard::Lawsuit.autos", cond: :like }
    }
  end

  def data
    records.map do |record|
      {
        autos: record.autos,
        actives: record.actives.collect(&:contact).collect(&:name).join("<br/>").html_safe,
        recievers: record.recievers.collect(&:contact).collect(&:name).join("<br/>").html_safe,
        forum: record.forum.name,
        lawyer: record.lawyer.name,
        fees: record.fees,
        conciliation_date: record.conciliation_date,
        instruction_date: record.instruction_date
      }
    end
  end

  def get_raw_records
    Dashboard::Lawsuit.all.includes(:forum)
  end

end
