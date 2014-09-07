app.factory "Role", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/admin/roles/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]