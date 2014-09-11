app.factory "Editor", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/editors/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]