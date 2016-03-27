$(document).on('ready page:load', function(){
  $(document).on('change', '#dmsf_document_standard_operation_id', function(){
    var analyticsTemplate = function(analytic_types) {
      return analytic_types.map(function(analytic_type){
        var analytic_options = analytic_type.analytics.map(function(analytic){
          return `<option value="${analytic.id}">${analytic.name}</option>`
        }).join("\n")

        return `
          <div class="form-group select optional dmsf_document_analytics">
            <label class="select optional control-label" for="dmsf_document_analytic_ids">${analytic_type.name}</label>
            <select name="dmsf_document[analytic_ids][]" class="select optional form-control">
              <option value=""></option>
              ${analytic_options}
            </select>
          </div>
        `
      }).join("\n")
    }
    var changeDocumentParams = function(operation) {
      // alert(JSON.stringify(operation))
      $('.dmsf_document_name').val(operation.document_definition.name)
      $('#dmsf_document_document_definition_id').val(operation.document_definition.id)
      $('#dmsf_document_entry_attributes_debits_account_id').val(operation.debits_account.id)
      $('#dmsf_document_entry_attributes_credits_account_id').val(operation.credits_account.id)
      $('#dmsf_document_entry_attributes_debit').val(operation.debits_account.full_name)
      $('#dmsf_document_entry_attributes_credit').val(operation.credits_account.full_name)
      $('.analytics_placeholder').html(analyticsTemplate(operation.analytic_types))
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
      changeDocumentParams({document_definition: {}, debits_account: {}, credits_account: {}, analytic_types: []})
  })
})
