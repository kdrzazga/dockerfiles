(defun clear-screen ()
  (format t "~c[2J" #\escape))  ; ANSI escape sequence to clear the screen

(defun draw-rectangle (shift)
  (format t "~% **********")
  (format t "~% *        *")
  (format t "~% *        *")
  (format t "~% *        *")
  (format t "~% **********")
  (format t "~%")
  (sleep 0.5)
  (clear-screen)
  (dotimes (i shift)
    (format t " "))
  (format t "**********")
  (format t "~%")
  (dotimes (i shift)
    (format t " "))
  (format t "*        *")
  (format t "~%")
  (dotimes (i shift)
    (format t " "))
  (format t "*        *")
  (format t "~%")
  (dotimes (i shift)
    (format t " "))
  (format t "*        *")
  (format t "~%")
  (dotimes (i shift)
    (format t " "))
  (format t "**********")
  (format t "~%"))

(defun animate ()
  (clear-screen)
  (dotimes (i 10)
    (draw-rectangle (1+ i))))

(defun main ()
  (animate))

(main)
