(include "key-sound-pair-database.rkt")

(define key-event-listener-canvas%
  (class canvas%
    (define/override (on-char event)
      (define key (send event get-key-code))
      (cond ((char? key) (playKSP (string key))) ;if char, convert to string
            ((eq? key 'release) nil)
            (else nil)))
    (super-new)))

(define (make-key-event-listener-canvas% _parent)
  (define x (new key-event-listener-canvas% [parent _parent]))
    x)