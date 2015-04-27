#lang racket/gui
(require racket/gui/base)
(require racket/draw)
(require racket/base)
(define newFrame (new frame% [label "Example"] ))

(define newMsg (new message% [parent newFrame]
                    [label "No events so far"]))

;(send newFrame show #t)
(new button% [parent newFrame]
     [label "Click Me!"]
     ;Callback procedure for a button click: Look into this functionality
     [callback (lambda (button event)
                      (send newMsg set-label "Button Click"))])
#|
  Honestly not too sure what this is doing even with the explanations.
  It doesn't seem to affect the given frame or cause anything to happen.
  Actually forgot to print in the explicit declararion for an object of the 
  class canvas...
|#

#|
Creates a canvas on which actions can be made, accepts some events such as keyboard presses
or mouse movements.
The library is starting to become a bit more useful, and intricate.
|#
(define my-canvas%
  (class canvas%
    (define/override (on-event event)
      (send newMsg set-label "Canvas Mouse"))
    (define/override (on-char event)
      (send newMsg set-label "Canvas keyboard"))
    (super-new)))
(new my-canvas% [parent newFrame])
 
;This causes the point of making the program window stop functioning,
;don't see its point yet
(new button% [parent newFrame]
     [label "Pause"]
     [callback (lambda (button event) (sleep 5))])

(define panel (new horizontal-panel% [parent newFrame]))
(new button% [parent panel]
             [label "Left"]
             [callback (lambda (button event)
                         (send newMsg set-label "Left click"))])

(new button% [parent panel]
             [label "Right"]
             [callback (lambda (button event)
                         (send newMsg set-label "Right click"))])

;making a new frame this is getting good
(define frame (new frame%
                   [label "Example"]
                   [width 300]
                   [height 300]))
(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 3 3)
                (send dc set-text-foreground "blue")
                (send dc draw-text "Don't Panic!" 0 0))])
;(send frame show #t)

#|
The documentation is going into detail with everything that the gui class can bring forth
This seems to be a library that will be able to make things work correctly.
I will be delving into either the draw or a more direct sprite controlling library for the 
next object path.
|#


(define dialog (instantiate dialog% ("Example")))
(new text-field% [parent dialog] [label "Your Name"])
(define panel2 (new horizontal-panel% [parent dialog]
                   [alignment '(center center)]))
(new button% [parent panel2] [label "Cancel"])
(new button% [parent panel2] [label "Ok"]
     [callback (lambda (buton event)
                 (send panel2 clear))])
(when (system-position-ok-before-cancel?)
  (send panel change-children reverse))

;(send dialog show #t)
(define modme 
  (lambda (base modulus)
    (if (> base modulus)
        (begin (set! base (- base mod))
               (modme base mod))
        base)))

(define % 
  (lambda (seconds mod)
    (modme seconds mod)))
