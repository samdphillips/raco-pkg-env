#lang info

(define collection "raco-pkg-env")
(define deps
  '("base"
    "raco-pkg-env-lib"
    "rackunit-lib"))
(define build-deps
  '("racket-doc"
    "scribble-lib"))

(define name "raco-pkg-env")
(define scribblings
  '(["scribblings/raco-pkg-env.scrbl"]))
