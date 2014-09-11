app.factory "Password", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/passwords/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]