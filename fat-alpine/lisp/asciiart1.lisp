(defun print-cat ()
  (format t "~%   /\\_/\\")
  (format t "~%  ( o.o )")
  (format t "~%  > ^ <"))

(defun print-house ()
  (format t "~%    /\\")
  (format t "~%   /  \\")
  (format t "~%  /____\\")
  (format t "~%  |    |")
  (format t "~%  |____|"))

(defun main ()
  (print-house)
  (print-cat))

(main)
