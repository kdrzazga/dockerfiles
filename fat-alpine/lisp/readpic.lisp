(defun clear-screen ()
  (format t "~c[2J" #\escape))  ; ANSI escape sequence to clear the screen

(defun display-file-on-screen (filepath)
  (clear-screen)
  (with-open-file (file filepath :direction :input)
    (loop for line = (read-line file nil)
          while line do
          (format t "~a~%" line))))

(defun main ()
  (let ((filepath "../art/c64.ansi.txt")) ; Replace with the path to your text file
    (display-file-on-screen filepath)))

(main)
