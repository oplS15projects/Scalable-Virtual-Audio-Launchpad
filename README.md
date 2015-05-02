# Scalable-Virtual-Audio-Launchpad

##Authors
Luis Perez

YuetLong Leung

Yesehaq Fauconier

Zachary Wong

##Overview
A virtual launchpad that plays sampled or recorded audio in a matrix of buttons.
The launchpad is customizable by user.

##Concepts Demonstrated

* **Data abstraction** is used to provide access to a library of sound samples.
* ** Object-oriented design ** was applied to almost every single GUI component.
* Our timing function is implemented using  **recursive data structures.** as well as **lists**.

##External Technology and Libraries
Equipment : Rode NT1-A Condenser Microphone - higher quality recording device.
Libraries : Racket/gui , rsound

##Favorite Lines of Code
#### Zachary Wong
```scheme
(define-runtime-path sounds "./sounds/")
(define workit-path (build-path sounds "workit.wav"))
(define work (clip (rs-read workit-path) 0 23321))
```
Utilizes filestreaming and rsound.  We created a folder that contains all our audio samples and all samples can be cleanly loaded into an rsound clip using rackets pathing system.

#### YuetLong Leung
```scheme
(make-insert-ksp "q" "workit.wav")
```
One procedure to associate a keyboard input to the playback operation of a wav file.
It also used the database I designed, which is awesome.

#### Luis Perez
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
 My favorite line of code may just be the baseline for the timr object that is running in the background of the implementation.

Yesehaq Fauconier
```
 (define (playKSP k)
  (map play-ksp (filter (lambda (ksp) (string=? (key ksp) k)) kspDB)))
```
My favorite line of code is the body of playKSP procedure, which plays every sound in the database that was paired with the matching key. It would take more than just one line to do this in C++.
   
   
How to Download and Run

1. Download the latest release from link below.
 https://github.com/oplS15projects/Scalable-Virtual-Audio-Launchpad/releases
2. Run main.rkt with DrRacket.
3. Press Add Panel and add button. Generate as many panels and buttons as you wish.
4. Press add sound. configure-frame for the button will pop up.
5. For instance, put these in the text-field:
             key : q 
             filename : workit.wav
             Button Label : Work it
   Save and close.
   Now you can play workit.wav by either pressing q or click the button.
6. Generate more buttons and bind audio files with it. Turn your keyboard into an instrument!


Known issues

 Timer was done but have not been implemented in GUI.
