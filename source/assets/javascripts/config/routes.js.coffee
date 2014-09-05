app.config (["$stateProvider", "$urlRouterProvider", "$locationProvider", "$httpProvider", ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) ->
  $urlRouterProvider
    .otherwise("/")
 
  $stateProvider
    .state "main_layout",
      abstract: true
      views:
        "template":
          templateUrl: "views/layouts/main.html"
        "session@main_layout":
          templateUrl: "views/layouts/session.html"
          controller: "SessionsController"

    .state "home",
      parent: "main_layout"
      url: "/"
      views:
        "content":
          templateUrl: "views/pages/index.html"
          controller: "PagesController"

    .state "login",
      parent: "main_layout"
      url: "/login"
      views:
        "content":
          templateUrl: "views/sessions/login.html"
          controller: "SessionsController"

    .state "edit-page",
      parent: "main_layout"
      url: "/page/edit/:id"
      views:
        "content":
          templateUrl: "views/pages/edit.html"
          controller: "PageController"  

    .state "new-page",
      parent: "main_layout"
      url: "/page/new"
      views:
        "content":
          templateUrl: "views/pages/new.html"
          controller: "PageController"  

    .state "page",
      parent: "main_layout"
      url: "/page/:id"
      views:
        "content":
          templateUrl: "views/pages/show.html"
          controller: "PageController"  
])

