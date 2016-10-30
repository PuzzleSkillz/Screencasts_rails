jQuery ($) ->
  $('.deleteAction').click ->
    current_item_tr = $(this).parents('tr')[0]
    if confirm('Точно удалить?')
      $.ajax
        url: '/items/' + $(current_item_tr).attr(data-item_id)
        type: 'POST'
        data:
          _method: 'DELETE'
          admin: 1
        success: ->
          $(current_item_tr).fadeOut 200
          return
    return
  return