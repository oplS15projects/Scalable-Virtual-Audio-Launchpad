#lang racket/gui
(include "Timer.rkt")

;; Interface Constants
(define intMargin 3)
(define intButtonWidth 100)
(define intButtonHeight 100)

(define InterfaceWindow (new frame%
                             [label "SOUND BARD, and yes i mean BARD"]
                             [width 424]
                             [height 530]))

(define intPanelOne   (new horizontal-panel% [parent InterfaceWindow]))
(define intPanelTwo   (new horizontal-panel% [parent InterfaceWindow]))
(define intPanelThree (new horizontal-panel% [parent InterfaceWindow]))
(define intPanelFour  (new horizontal-panel% [parent InterfaceWindow]))
(define intPanelFive  (new horizontal-panel% [parent InterfaceWindow]))

(define switchOne (new button%
                       [parent intPanelOne]
                       [label "SWITCH (1)"]
                       [min-width intButtonWidth]
                       [min-height intButtonHeight]
                       [vert-margin intMargin][horiz-margin intMargin]))
(define switchTwo (new button%
                       [parent intPanelOne]
                       [label "SWITCH (2)"]
                       [min-width intButtonWidth]
                       [min-height intButtonHeight]
                       [vert-margin intMargin][horiz-margin intMargin]))

(define Start     (new button%
                       [parent intPanelOne]
                       [label "START"]
                       [min-width intButtonWidth]
                       [min-height intButtonHeight]
                       [vert-margin intMargin][horiz-margin intMargin]
                       [callback (λ (button event)
                                   (begin
                                     (set! start-time (current-process-milliseconds))
                                     (light-them-up 8000 list-of-lights)))]))
(define Stop      (new button%
                       [parent intPanelOne]
                       [label "STOP"]
                       [min-width intButtonWidth]
                       [min-height intButtonHeight]
                       [vert-margin intMargin][horiz-margin intMargin]
                       [callback (λ (button event)
                                   (void))])) ;; Nothing for now

(define newVal 0)
(define newq 
  (λ (x) (set! newVal x)))

(define intButtonOne (new button% [label "WORK IT"]
                      [parent intPanelTwo]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play newVal))]))
(define intButtonTwo (new button% [label "MAKE IT"]
                      [parent intPanelTwo]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play makeit))]))

(define intButtonThree (new button% [label "DO IT"]
                      [parent intPanelTwo]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play doit))]))
(define intButtonFour (new button% [label "MAKES US"]
                      [parent intPanelTwo]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play makesus))]))

(define intButtonFive (new button% [label "HARDER"]
                      [parent intPanelThree]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play harder))]))
(define intButtonSix (new button% [label "BETTER"]
                      [parent intPanelThree]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play better))]))
(define intButtonSeven (new button% [label "FASTER"]
                      [parent intPanelThree]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play faster))]))
(define intButtonEight (new button% [label "STRONGER"]
                      [parent intPanelThree]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play stronger))]))

(define intButtonNine (new button% [label "MORE THAN"]
                      [parent intPanelFour]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play morethan))]))
(define intButtonTen (new button% [label "EVER"]
                      [parent intPanelFour]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play ever))]))
(define intButtonEleven (new button% [label "HOUR"]
                      [parent intPanelFour]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play hour))]))
(define intButtonTwelve (new button% [label "AFTER"]
                      [parent intPanelFour]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play after))]))

(define intButtonThirteen (new button% [label "OUR"]
                      [parent intPanelFive]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play our))]))
(define intButtonFourteen (new button% [label "WORK IS"]
                      [parent intPanelFive]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play workis))]))
(define intButtonFifteen (new button% [label "NEVER"]
                      [parent intPanelFive]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play never))]))
(define intButtonSixteen (new button% [label "OVER"]
                      [parent intPanelFive]
                      [min-width  intButtonWidth]
                      [min-height intButtonHeight]
                      [vert-margin intMargin][horiz-margin intMargin]
                      [callback (λ (button event)
                                  (play over))]))

(send InterfaceWindow show #t)