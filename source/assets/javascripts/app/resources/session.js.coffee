app.factory "Session", ["$resource", "CONFIG", ($resource, CONFIG) ->
  signIn:
    $resource(CONFIG.API_SERVER + "/api/v1/sessions")
    
  signOut:
    $resource(CONFIG.API_SERVER + "/api/v1/sessions")
]