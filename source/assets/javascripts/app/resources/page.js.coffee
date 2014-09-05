app.factory "Page", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/pages/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]