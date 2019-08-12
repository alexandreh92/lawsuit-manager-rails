//= require datatables/jquery.dataTables

// optional change '//' --> '//=' to enable

// require datatables/extensions/AutoFill/dataTables.autoFill
// require datatables/extensions/Buttons/dataTables.buttons
// require datatables/extensions/Buttons/buttons.html5
// require datatables/extensions/Buttons/buttons.print
// require datatables/extensions/Buttons/buttons.colVis
// require datatables/extensions/Buttons/buttons.flash
// require datatables/extensions/ColReorder/dataTables.colReorder
// require datatables/extensions/FixedColumns/dataTables.fixedColumns
// require datatables/extensions/FixedHeader/dataTables.fixedHeader
// require datatables/extensions/KeyTable/dataTables.keyTable
// require datatables/extensions/Responsive/dataTables.responsive
// require datatables/extensions/RowGroup/dataTables.rowGroup
// require datatables/extensions/RowReorder/dataTables.rowReorder
// require datatables/extensions/Scroller/dataTables.scroller
// require datatables/extensions/Select/dataTables.select

//= require datatables/dataTables.semanticui
// require datatables/extensions/AutoFill/autoFill.semanticui
// require datatables/extensions/Buttons/buttons.semanticui
// require datatables/extensions/Responsive/responsive.semanticui


//Global setting and initializer

$.extend( $.fn.dataTable.defaults, {
  responsive: true,
  pagingType: 'full',
  //dom:
  //  "<'row'<'col-sm-4 text-left'f><'right-action col-sm-8 text-right'<'buttons'B> <'select-info'> >>" +
  //  "<'row'<'dttb col-12 px-0'tr>>" +
  //  "<'row'<'col-sm-12 table-footer'lip>>"
});


$(document).on('preInit.dt', function(e, settings) {
  var api, table_id, url;
  api = new $.fn.dataTable.Api(settings);
  table_id = "#" + api.table().node().id;
  url = $(table_id).data('source');
  if (url) {
    return api.ajax.url(url);
  }
});


// init on turbolinks load
$(document).on('turbolinks:load', function() {
  if (!$.fn.DataTable.isDataTable("table[id^=dttb-]")) {
    $("table[id^=dttb-]").DataTable();
  }
});

// turbolinks cache fix
$(document).on('turbolinks:before-cache', function() {
  var dataTable = $($.fn.dataTable.tables(true)).DataTable();
  if (dataTable !== null) {
    dataTable.clear();
    dataTable.destroy();
    return dataTable = null;
  }
});

jQuery(document).ready(function() {
  $('#contacts-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#contacts-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columnDefs": [
      { "width": "60", "targets": 0 },
      { "width": "150", "targets": 2 },
      { "width": "220", "targets": 3 },
      { "width": "60", "targets": 4 },
      { "width": "140", "targets": 5 },
    ],
    "columns": [
      {"data": "id"},
      {"data": "name"},
      {"data": "cpf"},
      {"data": "city"},
      {"data": "state"},
      {"data": "phones"}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});

jQuery(document).ready(function() {
  $('#lawsuits-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#lawsuits-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "autos"},
      {"data": "forum"},
      {"data": "lawyer"},
      {"data": "fees"},
      {"data": "conciliation_date"},
      {"data": "instruction_date"}
    ]
    // pagingType is optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});