# Scalable-Virtual-Audio-Launchpad


##Authors
Luis Perez

YuetLong Leung

Yesehaq Fauconier

Zachary Wong

##Overview
A virtual launchpad that plays sampled or recorded audio in a matrix of buttons with a certain tempo.

##Screenshot


Here's a demonstration of how to display an image that's uploaded to this repo:


##Concepts Demonstrated

* **Data abstraction** is used to provide access to a library of sound samples.
* Our timing function is implemented using  **recursive data structures.** as well as **lists**

##External Technology and Libraries
Rode NT1-A Condenser Microphone - higher quality recording device.

##Favorite Lines of Code
####Zachary (a team member)
Utilizes filestreaming and rsound.  We created a folder that contains all our audio samples and all samples can be cleanly loaded into an rsound clip using rackets pathing system.
```scheme
(define-runtime-path sounds "./sounds/")
(define workit-path (build-path sounds "workit.wav"))
(define work (clip (rs-read workit-path) 0 23321))

#### YuetLong Leung
(make-insert-ksp "q" "workit.wav")
One procedure to associate a keyboard input to the playback operation of a wav file.
It also used the database I designed, which is awesome.
```

##Additional Remarks


#How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc. 
