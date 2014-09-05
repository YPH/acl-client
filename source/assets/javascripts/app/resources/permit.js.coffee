app.factory "Permit", ["$resource", "CONFIG", ($resource, CONFIG) ->
  level:
    none: 0
    read: 1
    write: 2
    destroy: 4

  page:
    $resource(CONFIG.API_SERVER + "/api/v1/pages/:id/permit")
]