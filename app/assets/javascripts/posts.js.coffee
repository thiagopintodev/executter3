#@app = angular.module('YourApplication', ["ngResource"])

@app = angular.module('YourApplication', [])

$(document).on('ready page:load', ->

  angular.bootstrap(document, ['YourApplication'])

  setPosts(myposts)

)



@PostsCtrl = ["$scope", ($scope) ->
  
  $scope.list = []

  $scope.new_post = {post: {text: ''}}

  $scope.before = ->

    last_id = $('#posts .post:last p.text').data('id');
    url = $('#posts').data('url').replace('xxx', last_id)
    $.get(
      url,
      (data, textStatus, jqXHR) ->
        appendPosts(data);
        if data.length > 0
          $('#more').show();
    )



  $scope.submit = ->
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
  setPosts( getPosts().concat( a ) )

@prependPosts = (a) ->
  setPosts( a.concat( getPosts() ) )

@getLastPostId = ->
  getPosts().slice(-1)[0].id

