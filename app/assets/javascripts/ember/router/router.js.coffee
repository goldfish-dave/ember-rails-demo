App.NavState = Ember.LayoutState.extend(
  navSelector: ".navbar .nav"
  enter: (stateManager, transition) ->
    @_super stateManager, transition
    $nav = $(@get("navSelector"))
    $nav.children().removeClass "active"
    selector = @get("selector") or ("." + @get("path"))
    $nav.find(selector).addClass "active"
)

App.SubNavState = App.NavState.extend(
  navSelector: ".subnav .nav"
)

App.views.main = App.Views.Main.LayoutView.create()

App.router = Ember.RouteManager.create(
  enableLogging: true
  rootView: App.views.main

  home: App.NavState.create(
    selector: '.home'
    viewClass: App.Views.Main.HomeView
  )
  posts: App.NavState.create(
    selector: ".posts"
    route: "posts"
    viewClass: App.Views.Posts.LayoutView
    index: Ember.LayoutState.create(
      viewClass: App.Views.Posts.IndexView
    )
    newPost: Ember.LayoutState.create(
      route: "new"
      viewClass: App.Views.Posts.NewView
    )
    show: Ember.LayoutState.create(
      route: ":postId"
      viewClass: App.Views.Posts.ShowView
      enter: (stateManager, transition) ->
        @_super stateManager, transition
        postId = stateManager.getPath("params.postId")
        post = App.store.find(App.Models.Post,postId)
        @get("view").set "post", post
    )
  )
)