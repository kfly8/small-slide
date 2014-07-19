'use strict'

###*
 # @ngdoc function
 # @name smallSlideApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the smallSlideApp
###
angular.module('smallSlideApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
