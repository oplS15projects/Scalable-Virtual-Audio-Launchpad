(require rsound)
(require racket/runtime-path)

(define kspDB nil)

(define (make-ksp key sound)
  (list key sound))

(define (key ksp)
  (car ksp))

(define (play-ksp ksp)
  (play (cadr ksp)))

(define (insert-ksp ksp)
  (set! kspDB (append kspDB (list ksp))))

(define (playKSP k)
  (map play-ksp (filter (lambda (ksp) (string=? (key ksp) k)) kspDB)))

(define-runtime-path sounds "./sounds/")

(define (make-sound filename)
  (clip (rs-read (build-path sounds filename)) 0 23321))

(define (make-insert-ksp key filename)
  (insert-ksp (make-ksp key (make-sound filename))))

;;; abstraction barrier goes here bruh

;;; example code
#|
(make-insert-ksp "q" "workit.wav")
(make-insert-ksp "w" "harder.wav")
(make-insert-ksp "e" "makeit.wav")
(make-insert-ksp "r" "better.wav")
(make-insert-ksp "a" "doit.wav")
(make-insert-ksp "s" "faster.wav")
(make-insert-ksp "d" "makesus.wav")
(make-insert-ksp "f" "stronger.wav")
|#