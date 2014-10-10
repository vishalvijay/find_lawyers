class FindLawyer.Views.Index extends Backbone.View

  template: JST['index']
  className: 'index'

  events:
    "click .search-btn" : "searchButtonClick"

  initialize: (arg1) ->
    @locations=arg1.locations
    @services=arg1.services

  render: ->
    $(@el).html(@template())
    @init()
    setTimeout @afterRender, 100
    this

  init: ->
    @setupLocationSelector()
    @setupServiceSelector()

  afterRender: =>
    @searchLawyer = Ladda.create @$(".search-btn")[0]
    @searchAndAppend()

  setupLocationSelector: ->
    _this = @
    o = @locations.map (l) ->
      r = {}
      r["value"] = l
      r["text"] = l
      r
    @$(".combobox-location").selectize
      options: o
      onInitialize: ->
        _this.locationSelector = this

  setupServiceSelector: ->
    _this = @
    o = @services.map (s) ->
      r = {}
      r["value"] = s
      r["text"] = s
      r
    @$(".combobox-service").selectize
      options: o
      onInitialize: ->
        _this.serviceSelector = this

  searchAndAppend: ->
    _this = @
    @searchLawyer.start()
    location = @locationSelector.getValue()
    service = @serviceSelector.getValue()
    requestParams = {location: location, service: service}
    U.api
      url: "/lawyers/search.json"
      data: requestParams
      success: (data) ->
        _this.appendLawyers data
      error: (errorData) ->
        console.log "Request error"
      complete: ->
        _this.searchLawyer.stop()

  appendLawyers: (data) ->
    @lawyers = new FindLawyer.Collections.Lawyers data
    @$(".lawyers-container").html new FindLawyer.Views.Lawyers(collection: @lawyers).render().el

  searchButtonClick: (event) ->
    @searchAndAppend()