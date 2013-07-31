#@app = angular.module('YourApplication', ["ngResource"])

@app = angular.module('YourApplication', [])

$(document).on('ready page:load', ->

  angular.bootstrap(document, ['YourApplication'])

  # setPosts(myposts)
  $('#users_online a').on('click', ->
    s = $('#post_text')
    t = $(this).text().trim();
    s.val(s.val()+t+' ')
    s.focus();
    return false;
  )

)



@PostsCtrl = ["$scope", ($scope) ->
  
  $scope.list = []
  $scope.listSlow = []


  $scope.posts = {}

  $scope.showing_more = true
  $scope.showing_busy = false

  $scope.new_post = {post: {text: ''}}

  $scope.before = ->

    last_id = $('#posts .post:last p.text').data('id') || '';
    url = $('#posts').data('url').replace('xxx', last_id)


    s = angular.element('#posts').scope()
    s.showing_more = false
    # s.showing_busy = true
    s.$apply()

    $.get(
      url,
      (data, textStatus, jqXHR) ->
        #$scope.before_posts.posts = $scope.before_posts.posts.concat(data)
        #if data.length > 0
        #$scope.before_posts.busy = false
        appendSlow(data)
    )

  appendSlow = (posts) ->

    # s = angular.element('#posts').scope()
    # s.showing_busy = false
    # s.$apply()

    timer = 0;
    angular.forEach(posts, (a) ->

      setTimeout ((b) ->
        appendPosts([b])
      ), timer, a
      timer += 200
    )


    setTimeout ( ->
      s = angular.element('#posts').scope()
      s.showing_more = true
      s.$apply()
    ), timer+500


  $scope.submit = ->

    $('body,html').animate({
      scrollTop: 0
    }, 800);

    $.post(
      '/posts.json',
      $scope.new_post,
      (data, textStatus, jqXHR) ->
        #if textStatus == 'success'
        prependPosts([data])
    )
    $scope.new_post.post.text = '';


]



@getPosts = ->
  angular.element('#posts').scope().list
  
@setPosts = (a) ->
  angular.element('#posts').scope().list = a
  angular.element('#posts').scope().$apply()

@appendPosts = (a) ->

  angular.forEach(a, (b) ->
    setPosts( getPosts().concat( [b] ) )
  );
  

  #setPosts( getPosts().concat( a ) )

@prependPosts = (a) ->

  setPosts( a.concat( getPosts() ) )

@getLastPostId = ->
  getPosts().slice(-1)[0].id

# setInterval (->
#   a = angular.element('#posts').scope().before_posts.posts.pop()
#   if a
#     setPosts( getPosts().concat( [a] ) )

# ), 200