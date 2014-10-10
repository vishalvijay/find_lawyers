class FindLawyer.Views.Lawyer extends Backbone.View

  template: JST['lawyer']
  className: 'lawyer'

  render: ->
    $(@el).html(@template(lawyer: @model))
    @addRating()
    this

  addRating: ->
    rating = @$(".rating")
    ratingVal = @model.getAverageRating()
    i = 1
    while i++ < ratingVal
      rating.append('<div class="rate"></div>')
    rating.append('<div class="half-rate"></div>') if i-2 < ratingVal