(include "horizontal-panel.rkt")
(include "key-event-listener-canvas.rkt")

(define (make-frame% _label)
  
  (define frame1 (new frame% [label _label]))
  (define key-event-listener-canvas (make-key-event-listener-canvas% frame1))
  (define show (send frame1 show #t))
  
  (define button1 (new button% 
                       [parent frame1]
                       [label "Add Panel"]
                       [callback (lambda (b e)
                                   (add-panel))]))
  
  (define (add-panel)
    (define h (make-horizontal-panel% frame1))
    h)
  
  (define (frame-dispatch m)
    (cond ((eq? m 'add-panel) add-panel)
          ((eq? m 'getFrame) frame1)
          ((eq? m 'show) show)
          ((eq? m 'add-panel) add-panel)
          (else (error "No such procedure in frame%"))))
  
  frame-dispatch)