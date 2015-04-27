;#lang racket/gui
(require racket/gui)


;; Make a broad window
;; Get the values for the show points of the windows from the list-of-lights in the
;; Timer-Abstract file
;; Simulate a wave like motion through the buttons within the rkt file, and make things
;; Work as they need to.
;; Continue along, and make other files, Sounds.rkt which will hold the sounds that will be
;; Played, even if the only thing that will be done will be a playback of a simple song, 
;; Need to have somehting that can be quantitatively pushed forward.

;; Button start will set! the value in start-time to (current-process-milliseconds)
;; Will also start up the light-them-up with the neded value of 4000, the user has no say
;; in this, may abstracteen that out of their view

;; Button stop will produce a wait instruction, or a sleep, and will either take the place
;; of the first button, or will be side by side with it, it will effectively stop the 
;; simulation and with the start being called restart. may be able to make it sleep instead
;; and if so, and that pauses the current-proces-milliseconds counter then make a pause
;; instead, and resume from the needed point in the loop.
(define buttonHeight 100)
(define buttonWidth 100)
(define Margin 3)

(define timingWindow (new frame% [label "Timer"]
                          [width 424]
                          [height 424]
                          [x 400] [y 400]
                          [alignment '(center center)]))
(send timingWindow show #t)

(define panelOne   (new horizontal-panel% [parent timingWindow]))
(define panelTwo   (new horizontal-panel% [parent timingWindow]))
(define panelThree (new horizontal-panel% [parent timingWindow]))
(define panelFour  (new horizontal-panel% [parent timingWindow]))

(define lightOne (new button% [label "1"]
                      [parent panelOne]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightTwo (new button% [label "2"]
                      [parent panelOne]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightThree (new button% [label "3"]
                      [parent panelOne]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightFour (new button% [label "4"]
                      [parent panelOne]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightFive (new button% [label "5"]
                      [parent panelTwo]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightSix (new button% [label "6"]
                      [parent panelTwo]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightSeven (new button% [label "7"]
                      [parent panelTwo]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightEight (new button% [label "8"]
                      [parent panelTwo]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightNine (new button% [label "9"]
                      [parent panelThree]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightTen (new button% [label "10"]
                      [parent panelThree]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightEleven (new button% [label "11"]
                      [parent panelThree]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightTwelve (new button% [label "12"]
                      [parent panelThree]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightThirteen (new button% [label "13"]
                      [parent panelFour]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightFourteen (new button% [label "14"]
                      [parent panelFour]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightFifteen (new button% [label "15"]
                      [parent panelFour]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))
(define lightSixteen (new button% [label "16"]
                      [parent panelFour]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin Margin][horiz-margin Margin]))