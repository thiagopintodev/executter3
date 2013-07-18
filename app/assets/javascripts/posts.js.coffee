@PostsCtrl = ["$scope", ($scope) ->
  
  $scope.list = []

]


window.getPosts = ->
  angular.element('#posts').scope().list
  
window.setPosts = (a) ->
  angular.element('#posts').scope().list = a
  angular.element('#posts').scope().$apply()

window.appendPosts = (a) ->
  setPosts( getPosts().concat( a ) )

window.prependPosts = (a) ->
  setPosts( a.concat( getPosts() ) )

window.getLastPostId = ->
  getPosts().slice(-1)[0].id

