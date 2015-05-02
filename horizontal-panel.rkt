(include "configurable-button.rkt")

(define (make-horizontal-panel% _parent)
  (define h-panel (new horizontal-panel% [parent _parent]))
  
    (define button1 (new button% 
                       [parent h-panel]
                       [label "Add Button..."]
                       [callback (lambda (b e)
                                   (add-button "Add sound..."))]))
  
  (define (add-button _label)
    (make-configurable-button% h-panel _label))
  
  (define (horizontal-panel-dispatch m)
    (cond ((eq? m 'getPanel) h-panel)
          ((eq? m 'add-button) add-button)
          (else (error "No such procedure in horizontal-panel%"))))
  
  horizontal-panel-dispatch)

