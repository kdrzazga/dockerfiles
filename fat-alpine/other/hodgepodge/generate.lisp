(defvar *latin-words*
  '("amor" "vita" "lux" "veritas" "ventus"
    "ventus" "terra" "ignis" "aqua" "natura"
    "animus" "fides" "fortuna" "gratia" "pax"
    "bellum" "ordo" "tempus" "labor" "mors"))

(defun print-random-latin-words ()
  (format t "[LISP] ")
  (dotimes (_ 4)
    (let* ((random-seed (mod (get-internal-real-time) 20))
           (word (nth random-seed *latin-words*)))
      (format t "~a " word)))
  (format t ": ~a~%" (get-internal-real-time)))

(print-random-latin-words)
