(define (make-configurable-button% _parent _label)
  
  (define configured? #f)
  (define key nil)
  (define sound nil)
  (define sound-path nil)
  
  (define button1 (new button%
                         [label _label]
                         [parent _parent]
                         [min-width 100]
                         [min-height 100]
                         [callback (lambda (b e)
                                     (if configured?
                                         (play sound)
                                         (send frame1 show #t)))]))
  
  (define frame1 (new frame% [label "configure-frame"]))
  
  (define text-field1 (new text-field%
                           [label "Key"]
                           [parent frame1]))
  
  (define text-field2 (new text-field%
                           [label "Filename"]
                           [parent frame1]))
  
  (define text-field3 (new text-field%
                           [label "Button Label"]
                           [parent frame1]))
  
  (define button2 (new button%
                       [parent frame1]
                       [label "Save and Close"]
                       [callback (lambda (b e)
                                   (begin
                                     
                                     (set! configured? #t)
                                     (set! key (send text-field1 get-value))
                                     (set! sound-path (send text-field2 get-value))
                                     
                                     (set! sound (make-sound sound-path))
                                     (make-insert-ksp key sound-path)
                                     
                                     (send button1 set-label (send text-field3 get-value))
                                     (send frame1 show #f)))]))
  
  button1)