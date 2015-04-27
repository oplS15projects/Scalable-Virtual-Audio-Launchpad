# Scalable-Virtual-Audio-Launchpad

##Authors
Luis Perez

YuetLong Leung

Yesehaq Fauconier

Zachary Wong

##Overview
A virtual launchpad that plays sampled or recorded audio in a matrix of buttons with a certain tempo.

##Concepts Demonstrated

* **Data abstraction** is used to provide access to a library of sound samples.
* Our timing function is implemented using  **recursive data structures.** as well as **lists**

##External Technology and Libraries
Rode NT1-A Condenser Microphone - higher quality recording device.

##Favorite Lines of Code
#### Zachary (a team member)
Utilizes filestreaming and rsound.  We created a folder that contains all our audio samples and all samples can be cleanly loaded into an rsound clip using rackets pathing system.
```scheme
(define-runtime-path sounds "./sounds/")
(define workit-path (build-path sounds "workit.wav"))
(define work (clip (rs-read workit-path) 0 23321))
```

#### YuetLong Leung
(make-insert-ksp "q" "workit.wav")
One procedure to associate a keyboard input to the playback operation of a wav file.
It also used the database I designed, which is awesome
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
(define-runtime-path sounds "./sounds/")
(define workit-path (build-path sounds "workit.wav"))
(define work (clip (rs-read workit-path) 0 23321))
```
#### Luis Perez
 My favorite line of code may just be the baseline for the timr object that is running in the background of the implementation.
 ```
       (λ (modder list-of-lights)
     (let ((timer (secMod modder))) 
  
    (begin  
         (set! timer (convert-timer-to-int timer)) ;; Left here for the sake of lambdas.
         (toggle-proc timer) ;;Am I on or am I off aka Should I stay or should I...It's late
   
         (cond ((not toggle) ;; Display the timer value, not needed but yeah...
                (playSample timer)))
         
         (lights list-of-lights timer) ;; Does the operations for the lightup
         (light-them-up modder list-of-lights) ;;Call me again, and again, and...you get it
         )
       )
     )
   )
   ```
   
   
How to Download and Run

 Still working out a few of the Bugs so Can't link a file to the final relase but the releases so far on the milestones are at 
 https://github.com/oplS15projects/Scalable-Virtual-Audio-Launchpad/releases
 The program will be run from the file GUI.rkt, and with a press of run will produce a GUI with which the user can press the buttons on screen to produce sounds.
 Switch to a blank soundboard at which point the user can commit their own sound files and have them be playable in the environment.
 There will also be a start button in the interface which will play a prelooped sound that will be the last bits of the Harder Better Faster song off of Daft Punks Album Discovery.
 Sadly didn't get into the multithreading library enough to actively be able to make the program be able ot be stopped from this point so setting a preset timer limit to stop after the first two times that the sounds are produced.
