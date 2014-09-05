app.factory "User", ["$resource", "CONFIG", ($resource, CONFIG) ->
  all:
    $resource(CONFIG.API_SERVER + "/api/v1/users")

  show:
    $resource(
      CONFIG.API_SERVER + "/api/v1/users/:id",
      {id:'@id'},
      update:
        method: "PUT"
    )

]