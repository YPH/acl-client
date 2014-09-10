app.factory "Admin", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/admin/user_admins/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]