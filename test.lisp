(ql:quickload :lisp-unit)
(use-package :lisp-unit)

(require :sb-cover)
(declaim (optimize sb-cover:store-coverage-data))

(load (compile-file "main.lisp"))

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

(define-test test-is-positive
  (assert-equal t (is-positive 2)))

(write-tap-to-file
 (run-tests :all)
 "tests.tap")

(sb-cover:report "coverage-report/")
(declaim (optimize (sb-cover:store-coverage-data 0)))

(quit)
