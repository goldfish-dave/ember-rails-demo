# changes the active state for nav
App.NavState = Ember.LayoutState.extend(
  navSelector: ".navbar .nav"
  enter: (stateManager, transition) ->
    @_super stateManager, transition
    $nav = $(@get("navSelector"))
    $nav.children().removeClass "active"
    selector = @get("selector") or ("." + @get("path"))
    $nav.find(selector).addClass "active"
)

# have to place this into the DOM ourselves
App.views.main = App.Views.Main.LayoutView.create()


App.router = Ember.RouteManager.create(
  enableLogging: true

  # every view hangs off this one
  rootView: App.views.main

  # Home
  home: App.NavState.create(
    selector: '.home'
    viewClass: App.Views.Main.HomeView
  )

  # posts stack
  posts: App.NavState.create(
    selector: ".posts"
    route: "posts"
    viewClass: App.Views.Posts.LayoutView
    # posts#index
    index: Ember.LayoutState.create(
      viewClass: App.Views.Posts.IndexView
    )
    # posts#new
    newPost: Ember.LayoutState.create(
      route: "new"
      viewClass: App.Views.Posts.NewView
    )
    # posts#show
    show: Ember.LayoutState.create(
      route: ":postId"
      viewClass: App.Views.Posts.ShowView
      enter: (stateManager, transition) ->
        @_super stateManager, transition
        postId = stateManager.getPath("params.postId")
        post = App.store.find(App.Post,postId)
        @get("view").set "post", post
    )
  )
)