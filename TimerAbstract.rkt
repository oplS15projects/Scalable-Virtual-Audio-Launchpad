;#lang racket
;Uncomment above line to test anything within this module.
(require scheme/mpair)
(include "TimerButtons.rkt")

;;;;;;;;;;;;;;;;;;;;; Respect the ABSTRACTION BARRIER ;;;;;;;;;;;;;;;;;;;;;;;;;

#|
 Framework for the Timing, and sequencing
 The backbone of the program that handles the events of the sound being called, played, 
 button shows for the visual timer, and 
|#

;; Defined a function that would do modular division for doubles.
(define modme 
  (λ (base modulus)
    (remainder base modulus)))

;; Wrap around for the modular division.
(define % 
  (λ (base modulus)
    (modme base modulus)))

;; Holds the current-process run time to be used with the program to make it start out at 
;; 0 every time, and not at a random interval
(define start-time (current-process-milliseconds))

;; Returns the seconds modularly divided by whatever the user wishes.
;; GOT THE GODDAMN COUNTER RUNNING
(define secMod
  (λ (modder) ;; If all else fails, wrap it in a lambda
    (let ([x 0]
          [current-time (- (current-process-milliseconds) start-time)]) 
      (set! x (%  current-time modder))
      x)
    )
  )
 
(define convert-timer-to-int 
  (λ (timer)
    (cond ((and (>= timer 0) (<= timer 500))
           1)
          ((and (>= timer 500) (<= timer 1000))
           2)
          ((and (>= timer 1000) (<= timer 1500))
           3)
          ((and (>= timer 1500) (<= timer 2000))
           4)
          ((and (>= timer 2000) (<= timer 2500))
           5)
          ((and (>= timer 2500) (<= timer 3000))
           6)
          ((and (>= timer 3000) (<= timer 3500))
           7)
          ((and (>= timer 3500) (<= timer 4000))
           8)
          ((and (>= timer 4000) (<= timer 4500))
           9)
          ((and (>= timer 4500) (<= timer 5000))
           10)
          ((and (>= timer 5000) (<= timer 5500))
           11)
          ((and (>= timer 5500) (<= timer 6000))
           12)
          ((and (>= timer 6000) (<= timer 6500))
           13)
          ((and (>= timer 6500) (<= timer 7000))
           14)
          ((and (>= timer 7000) (<= timer 7500))
           15)
          ((and (>= timer 7500) (<= timer 8000))
           16))
    )
  )

;; Global Variable timer, can't use let to define it, or can, but it wouldn't be beneficial
(define counter 1)
(define presetCounter 0)
;; The list of values to be passed into the needed buttons to turn them on and off.
(define list-of-lights (mlist #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f #f))
;; Global value for toggle switch that relays whether or not a sound is to be played.
;; When false the song gets played one time, then the toggle is set back to true,
;; and the sound gven sound is skipped over.
(define toggle #f)
;; Set catchvalue as well, it wil not be possible to be the first value
(define catchValue -1)
;; Turn all of the lights that are within the list off.
(define reset-lights-off
  (λ (list-of-lights)
    (cond ((not (null? list-of-lights))
           (begin
             (set-mcar! list-of-lights #f)
             (reset-lights-off (mcdr list-of-lights)))))
    )
  )

(define reset-lights-on
  (λ (list-of-lights)
    (cond ((not (null? list-of-lights))
           (begin
             (set-mcar! list-of-lights #t)
             (reset-lights-on (mcdr list-of-lights)))))
    )
  )
;; Helper for the timer conversion to be used within the concept of the list object
(define light-the-node
  (λ (list-of-lights turn-on-which?)
    (if (null? list-of-lights)  ;; Elt is too far gone, it doesn't exist.
        (error "Value to be placed in is out of bounds") ;; This will, or should never happen
        ;Else
        (if (= counter turn-on-which?)
            (set-mcar! list-of-lights #t) ;; This is where I want to change the value in the list to true   
            (begin
              (set! counter (+ 1 counter))
              (light-the-node (mcdr list-of-lights) turn-on-which?))
            ))
    )
  )

;; Abstract it out if at all possible
(define lights
  (λ (list-of-lights timer)
    (begin
      (light-the-node list-of-lights timer)
      (set! counter 1)
      (button-show? list-of-lights)
      (reset-lights-off list-of-lights)
      )))

;; Resets the value in the catch portion if necessary. 
;; This is done so that we do not play the sound repetitively.
(define toggle-proc
  (λ (timer)
    (if (not (= timer catchValue))
        (begin ;; Set the value to the new timer funtion to make sure that it does not play looped.
          (set! catchValue  timer)
          (set! toggle #f))
        (set! toggle #t))))

(define play?
  (λ (timer)
    (cond ((not toggle) ;; Display the timer value, not needed but yeah...
           (begin
             (set! presetCounter (+ 1 presetCounter))
             (playSample timer))))))

(define playAgain?
  (λ (modder)
    (if (< presetCounter 16) 
        (light-them-up modder list-of-lights) ;;Call me again, and again, and...you get it
        (begin
          (set! presetCounter 0)
          (reset-lights-on list-of-lights)
          (button-show? list-of-lights)))))


(define button-show?
  (λ (list-of-lights) ;; Passed it for the sake of... Well for the sake of λλλλλλλ teepees?
 (begin
   (send lightOne show (_first list-of-lights))
   (send lightTwo show (_second list-of-lights))
   (send lightThree show (_third list-of-lights))
   (send lightFour show (_fourth list-of-lights))
   (send lightFive show (_fifth list-of-lights))
   (send lightSix show (_sixth list-of-lights))
   (send lightSeven show (_seventh list-of-lights))
   (send lightEight show (_eight list-of-lights))
   (send lightNine show (_ninth list-of-lights))
   (send lightTen show (_tenth list-of-lights))
   (send lightEleven show (_eleventh list-of-lights))
   (send lightTwelve show (_twelfth list-of-lights))
   (send lightThirteen show (_thirteenth list-of-lights))
   (send lightFourteen show (_fourteenth list-of-lights))
   (send lightFifteen show (_fifteenth list-of-lights))
   (send lightSixteen show (_sixteenth list-of-lights)))))
  
  
;; I could have done this with a freaking accumulator... Damn -- __ --
;;;;;;;;;;;;;;;;;;;;;;;;;;;;MLIST OPERATORS::::::::::::::::::::::::::::::::::::::
(define _first
  (λ (x) (mcar x)))
(define _second
  (λ (x) (mcar (mcdr x))))
(define _third
  (λ (x) (mcar (mcdr (mcdr x)))))
(define _fourth 
  (λ (x) (mcar (mcdr (mcdr (mcdr x))))))
(define _fifth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr x)))))))
(define _sixth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr x))))))))
(define _seventh
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr x)))))))))
(define _eight
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr x))))))))))
(define _ninth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr x)))))))))))
(define _tenth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr x))))))))))))
(define _eleventh
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr x)))))))))))))
(define _twelfth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr 
                                                    (mcdr (mcdr (mcdr (mcdr x)))))))
                                       )))))))
(define _thirteenth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr 
                                                    (mcdr (mcdr (mcdr (mcdr (mcdr x)))))
                                                    ))))))))))
(define _fourteenth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr 
                                                    (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr x))
                                                                            ))))))))))))))
(define _fifteenth
  (λ (x) (mcar (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr (mcdr 
                                                    (mcdr (mcdr (mcdr 
                                                                 (mcdr (mcdr (mcdr (mcdr x)
                                                                                   ))))))
                                                    ))))))))))
(define _sixteenth
  (λ (x) (mcar (mcdr (mcdr (mcdr
                            (mcdr (mcdr (mcdr (mcdr 
                                                    (mcdr (mcdr (mcdr (mcdr
                                                                       (mcdr
                                                                        (mcdr (mcdr (mcdr x
                                                                                          )
                                                                                    )
                                                                              )
                                                                        )
                                                                       )
                                                                      )))))))))))))

                                                                                            