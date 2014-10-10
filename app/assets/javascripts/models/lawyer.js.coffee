class FindLawyer.Models.Lawyer extends Backbone.Model

  getName: ->
    @get "name"

  getCode: ->
    @get "code"

  getYearOfExperience: ->
    @get "years_of_experience"

  getLocation: ->
    @get "location"

  getAverageRating: ->
    @get "average_rating"