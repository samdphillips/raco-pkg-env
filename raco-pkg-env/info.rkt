#lang info

(define name "raco-pkg-env")
(define version "0.1.1")
(define collection "raco-pkg-env")
(define deps
  '("base"
    "raco-pkg-env-lib"))
(define implies
  '("raco-pkg-env-lib"))
(define build-deps
  '("racket-doc"
    "scribble-lib"))
(define scribblings
  '(["scribblings/raco-pkg-env.scrbl"]))
