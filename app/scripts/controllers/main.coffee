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
    return (scope, element) ->
        w            = angular.element($window)
        slide_length = element.children('section').length

        scope.getWindowDimensions = ->
            h: $window.innerHeight
            w: $window.innerWidth

        scope.$watch scope.getWindowDimensions, ((newValue, oldValue) ->
            scope.windowHeight = newValue.h
            scope.windowWidth  = newValue.w
            scope.style = ->
                height: newValue.h * slide_length + "px"
                width: newValue.w + "px"

            return
        ), true

        w.bind "resize", ->
            scope.$apply()

