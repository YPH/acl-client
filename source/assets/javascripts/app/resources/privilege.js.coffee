app.factory "Privilege", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/admin/privileges/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]