'use strict'

###*
 # @ngdoc function
 # @name smallSlideApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the smallSlideApp
###
angular.module('smallSlideApp', ['hljs'])
  .controller 'MainCtrl', ($scope) ->
    return

  .directive "slides", ($window) ->
    return (scope, element) ->
        w      = angular.element($window)
        slides = element.children('section')

        slides.each (i,s) ->
            $slide = angular.element(s)
            $slide.css('z-index', i)
            $child = $slide.children('pre').first()
            if $child
                $child.css('height', $window.innerHeight)

        scope.getWindowDimensions = ->
            top: angular.element($window).scrollTop()
            h: $window.innerHeight
            w: $window.innerWidth

        scope.$watch scope.getWindowDimensions, ((newValue, oldValue) ->

            scope.windowHeight = newValue.h
            scope.windowWidth  = newValue.w
            scope.scrollTop    = newValue.top

            idx   = parseInt(newValue.top / newValue.h)
            cnt   = idx + 1
            slide = slides.eq(idx)

            if slide && newValue.top > oldValue.top
                if !slide.hasClass('fixed') && cnt < slides.length
                    slide.addClass('fixed')
                    slide.css('margin-top', 0)
                    slide.next().css('margin-top', newValue.h * cnt) if slide.next()

            if slide && newValue.top < oldValue.top
                if slide.hasClass('fixed') && cnt > 1
                   slide.removeClass('fixed')
                   slide.css('margin-top', newValue.h * idx)
                   slide.next().css('margin-top', 0) if slide.next()

            scope.style = ->
                height: newValue.h * slides.length + "px"
                width: newValue.w + "px"

            return
        ), true

        w.bind "resize", ->
            scope.$apply()

        w.bind "scroll", ->
            scope.$apply()

