#lang racket/gui ;; So as to be able to include the needed GUI interface.
(include "TimerAbstract.rkt")
;(include "TimerButtons.rkt")


(define light-them-up
  (λ (modder list-of-lights)
    (let ((timer (secMod modder))) 
      (begin  
        (set! timer (convert-timer-to-int timer)) ;; Left here for the sake of lambdas.
        (toggle-proc timer) ;;Am I on or am I off aka Should I stay or should I...It's late
  
       ; (cond ((not toggle) ;; Display the timer value, not needed but yeah...
        ;       (begin (newline) (display timer)))) ;; Play the sounds at this location.
            
        (lights list-of-lights timer) ;; Does the operations for the lightup
        (light-them-up modder list-of-lights) ;;Call me again, and again, and...you get it
        )
      )
    )
  )
(light-them-up 4000 list-of-lights)
;(light-them-up 4)


