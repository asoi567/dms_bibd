// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function(){
  $('#dmsf_document_standard_operation_id').on('change', function(){
    var changeDocumentParams = function(operation) {
      // alert(JSON.stringify(operation))
      $('.dmsf_document_name').val(operation.document_definition.name)
      $('#dmsf_document_document_definition_id').val(operation.document_definition.id)
      $('#dmsf_document_entry_attributes_debits_account_id').val(operation.debits_account.id)
      $('#dmsf_document_entry_attributes_credits_account_id').val(operation.credits_account.id)
      $('#dmsf_document_entry_attributes_debit').val(operation.debits_account.full_name)
      $('#dmsf_document_entry_attributes_credit').val(operation.credits_account.full_name)
    }

    if(this.value)
      $.get({
        url: '/dmsf/standard_operations/' + this.value,
        dataType: 'json',
        success: function(data) {
          changeDocumentParams(data)
        }
      })
    else
      changeDocumentParams({document_definition: {}, debits_account: {}, credits_account: {}})
  })
})
