(defun my-inc (x)
  (+ 1 x))

(defun main ()
  (print (my-inc 2)))

(defun is-positive (x)
  (cond ((>= x 0) t)
        (t nil)))

(defun is-negative (x)
  (not (is-positive x)))
