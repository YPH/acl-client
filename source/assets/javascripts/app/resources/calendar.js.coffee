app.factory "Calendar", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/calendars/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]