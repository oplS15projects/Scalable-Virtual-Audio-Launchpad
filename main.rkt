#lang racket/gui
(define nil '())

(include "frame.rkt")

(define my-frame (make-frame% "my-frame"))
#|
(define p1 (car ((my-frame 'add-panel) 1)))
(define b1 ((p1 'add-button) "p1_button"))

(define p2 (car ((my-frame 'add-panel) 1)))
(define b2 ((p2 'add-button) "p2_button"))

(define p3 (make-horizontal-panel% (my-frame 'getFrame)))
(define b3 ((p3 'add-button) "p3_button"))

(define p4 ((my-frame 'add-panel)))
(define b4 ((p4 'add-button) "p4_button"))

(define p5 ((my-frame 'add-panel)))
(define b5 ((p5 'add-button) "p5_button"))
|#