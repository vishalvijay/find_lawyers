#C for constance
window.C =
  VERSION_CODE: 1

#U for utils
window.U =
  isTab: ->
    $(window).width() < 992
  isMob: ->
    $(window).width() < 768
  isDesk: ->
    $(window).width() >= 992
  isDeskMin: ->
    $(window).width() < 1130
  getValue: (view) ->
    view.val().trim()
  api: (options = {}) ->
    default_opt =
      type: "GET"
      contentType: "application/json"
      accept: "application/json"
      dataType: "json"
    $.ajax $.extend({}, default_opt, options)