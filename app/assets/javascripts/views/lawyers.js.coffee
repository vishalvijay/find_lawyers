class FindLawyer.Views.Lawyers extends Backbone.View

  template: JST['lawyers']
  className: 'lawyers'

  render: ->
    $(@el).html(@template())
    body = @$(".lawyers-body")
    @collection.forEach (lawyer) ->
      body.append new FindLawyer.Views.Lawyer(model: lawyer).render().el
    this