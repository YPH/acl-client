app.factory "ResourceRole", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/admin/resource_roles/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]