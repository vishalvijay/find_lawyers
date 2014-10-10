class FindLawyer.Routers.Main extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    locations = $('.locations-content').data('locations')
    services = $('.services-content').data('services')
    view = new FindLawyer.Views.Index(locations: locations, services: services)
    $('.view-container').html(view.render().el)