app.factory "Comment", ["$resource", "CONFIG", ($resource, CONFIG) ->
  $resource(
    CONFIG.API_SERVER + "/api/v1/comments/:id",
    {id: '@id'},
    update:
      method: "PUT"
  )
]