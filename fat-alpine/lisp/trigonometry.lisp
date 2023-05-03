(defun calculate-trig-functions (x)
  "Calculates sin, cos, and tan for the given parameter x (in radians)"
  (let ((sin-result (sin x))
        (cos-result (cos x))
        (tan-result (tan x)))
    (format t "sin(x) = ~a~%" sin-result)
    (format t "cos(x) = ~a~%" cos-result)
    (format t "tan(x) = ~a~%" tan-result)))
