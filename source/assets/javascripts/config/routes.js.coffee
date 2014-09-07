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

    .state "signup",
      parent: "main_layout"
      url: "/signup"
      views:
        "content":
          templateUrl: "views/sessions/signup.html"
          controller: "UserController"

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

    .state "calendar",
      parent: "main_layout"
      url: "/calendar"
      views:
        "content":
          templateUrl: "views/calendars/index.html"
          controller: "CalendarsController"

    .state "admin",
      parent: "main_layout"
      url: "/admin"
      views:
        "content":
          templateUrl: "views/admin/index.html"
          #controller: "CalendarsController"

    .state "users",
      parent: "main_layout"
      url: "/users"
      views:
        "content":
          templateUrl: "views/users/index.html"
          controller: "UsersController"  
])

