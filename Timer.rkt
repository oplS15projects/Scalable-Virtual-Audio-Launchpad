;#lang racket/gui ;; So as to be able to include the needed GUI interface.

(include "TimerAbstract.rkt")
(include "SoundBoard.rkt")

(define light-them-up
  (λ (modder list-of-lights)
    (let ((timer (secMod modder))) 
      (begin  
        (set! timer (convert-timer-to-int timer)) ;; Left here for the sake of lambdas.
        (toggle-proc timer) ;;Am I on or am I off aka Should I stay or should I...It's late
        (play? timer)
        (lights list-of-lights timer) ;; Does the operations for the lightup
        (playAgain? modder)       
        )
      )
    )
  )




