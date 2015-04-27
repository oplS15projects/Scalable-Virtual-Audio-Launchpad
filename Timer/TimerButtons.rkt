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
(define buttonHeight 50)
(define buttonWidth 50)
(define timingWindow (new frame% [label "Timer"]
                          [width 900]
                          [height 900]
                          [x 400] [y 400]
                          [alignment '(center center)]))
(send timingWindow show #t)

(define lightOne (new button% [label "1"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightTwo (new button% [label "2"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightThree (new button% [label "3"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightFour (new button% [label "4"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightFive (new button% [label "5"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightSix (new button% [label "6"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightSeven (new button% [label "7"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightEight (new button% [label "8"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightNine (new button% [label "9"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightTen (new button% [label "10"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightEleven (new button% [label "11"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightTwelve (new button% [label "12"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightThirteen (new button% [label "13"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightFourteen (new button% [label "14"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightFifteen (new button% [label "15"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))
(define lightSixteen (new button% [label "16"]
                      [parent timingWindow]
                      [min-width  buttonWidth]
                      [min-height buttonHeight]
                      [vert-margin 3][horiz-margin 3]))