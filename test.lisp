;; CODE

(defun my-inc (x)
  (+ 1 x))

(defun main ()
  (print (my-inc 2)))

;; TESTS

(ql:quickload :lisp-unit)

(use-package :lisp-unit)


(setf *print-summary* t)
(setf *print-failures* t)
(setf *print-errors* t)

(define-test test-my-inc
  (assert-equal 3 (my-inc 2))
  (assert-equal 3/2 (my-inc 1/2))
  (assert-equal 2.2 (my-inc 1.2))
  (assert-equal 1 (my-inc 0))
  (assert-equal 0 (my-inc -1)))

(define-test test-main
  (assert-equal 3 (main)))

(write-tap-to-file
 (run-tests :all)
 "tests.tap")

(sb-ext:save-lisp-and-die "test" :toplevel #'main :executable t)
