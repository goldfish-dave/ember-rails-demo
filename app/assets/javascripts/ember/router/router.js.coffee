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

App.main = App.MainLayoutView.create()

App.routeManager = Ember.RouteManager.create(
  enableLogging: true
  rootView: App.main

  home: App.NavState.create(
    selector: '.home'
    viewClass: App.MainHomeView
  )
  posts: App.NavState.create(
    selector: ".posts"
    route: "posts"
    viewClass: App.PostLayoutView
    index: Ember.LayoutState.create(
      viewClass: App.PostIndexView
    )
    newPost: Ember.LayoutState.create(
      route: "new"
      viewClass: App.NewPostView
    )
    show: Ember.LayoutState.create(
      route: ":postId"
      viewClass: App.PostShowView
      enter: (stateManager, transition) ->
        @_super stateManager, transition
        postId = stateManager.getPath("params.postId")
        post = App.store.find(App.Post,postId)
        @get("view").set "content", post
    )
  )
)