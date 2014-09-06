app.factory "User", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/users/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]