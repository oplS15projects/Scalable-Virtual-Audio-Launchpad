;#lang racket
(require rsound)
(require racket/runtime-path)

;;defining a blank system

;;pathing file systems
(define-runtime-path sounds "./Sounds")
(define workit-path (build-path sounds "workit.wav"))
(define makeit-path (build-path sounds "makeit.wav"))
(define doit-path (build-path sounds "doit.wav"))
(define makesus-path (build-path sounds "makesus.wav"))
(define harder-path (build-path sounds "harder.wav"))
(define better-path (build-path sounds "better.wav"))
(define faster-path (build-path sounds "faster.wav"))
(define stronger-path (build-path sounds "stronger.wav"))

(define morethan-path (build-path sounds "morethan.wav"))
(define ever-path (build-path sounds "ever.wav"))
(define hour-path (build-path sounds "hour.wav"))
(define after-path (build-path sounds "after.wav"))
(define our-path (build-path sounds "hour.wav")) ;; Same sounds sampled I guess
(define workis-path (build-path sounds "workis.wav"))
(define never-path (build-path sounds "never.wav"))
(define over-path (build-path sounds "over.wav"))

;;rsound sample objects
(define workit (clip (rs-read workit-path) 0 23321))
(define makeit (clip (rs-read makeit-path) 0 23321))
(define doit (clip (rs-read doit-path) 0 23321))
(define makesus (clip (rs-read makesus-path) 0 23321))
(define harder (clip (rs-read harder-path) 0 23321))
(define better (clip (rs-read better-path) 0 23321))
(define faster (clip (rs-read faster-path) 0 23321))
(define stronger (clip (rs-read stronger-path) 0 23321))

(define morethan (clip (rs-read morethan-path) 0 23321))
(define ever (clip (rs-read ever-path) 0 23321))
(define hour (clip (rs-read hour-path) 0 23321))
(define after (clip (rs-read after-path) 0 23321))
(define our (clip (rs-read our-path) 0 23321))
(define workis (clip (rs-read workis-path) 0 23321))
(define never (clip (rs-read never-path) 0 23321))
(define over (clip (rs-read over-path) 0 23321))

(define playSample
  (λ (timer)
    (cond ((= 1 timer)
           (play workit))
          ((= 2 timer)
           (play makeit))
          ((= 3 timer)
           (play doit))
          ((= 4 timer)
           (play makesus))
          ((= 5 timer)
           (play harder))
          ((= 6 timer)
           (play better))
          ((= 7 timer)
           (play faster))
          ((= 8 timer)
           (play stronger))
          ((= 9 timer)
           (play morethan))
          ((= 10 timer)
           (play ever))
          ((= 11 timer)
           (play hour))
          ((= 12 timer)
           (play after))
          ((= 13 timer)
           (play our))
          ((= 14 timer)
           (play workis))
          ((= 15 timer)
           (play never))
          ((= 16 timer)
           (play over)))))


;;;keypress events
;(define (soundboard i k)
;  (cond
;    [(key=? k "q") (play workit)]
;    [(key=? k "w") (play makeit)]
;    [(key=? k "e") (play doit)]
;    [(key=? k "r") (play makesus)]
;    [(key=? k "a") (play harder)]
;    [(key=? k "s") (play better)]
;    [(key=? k "d") (play faster)]
;    [(key=? k "f") (play stronger)]
;    
;    [else k]
;    ))
;

;;;create environment
;(big-bang " "
;     [to-draw keydisplay]
;     [on-key soundboard]
;     )
;     