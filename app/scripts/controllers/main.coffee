'use strict'

###*
 # @ngdoc function
 # @name smallSlideApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the smallSlideApp
###
angular.module('smallSlideApp', [])
  .controller 'MainCtrl', ($scope) ->
    return

  .directive "resize", ($window) ->
    return (scope) ->
        w = angular.element($window)

        scope.getWindowDimensions = ->
            h: $window.innerHeight
            w: $window.innerWidth

        scope.$watch scope.getWindowDimensions, ((newValue, oldValue) ->
            scope.windowHeight = newValue.h
            scope.windowWidth = newValue.w
            scope.style = ->
                height: newValue.h * 5 + "px" # FIXME slideの数だけかけ算するようにする
                width: newValue.w + "px"

            return
        ), true

        w.bind "resize", ->
            scope.$apply()

