#lang info

(define name "raco-pkg-env-lib")
(define collection "raco-pkg-env")
(define version "0.1.3")
(define deps '("base" "at-exp-lib"))
(define build-deps '())
(define pkg-authors '(samdphillips@gmail.com))
(define raco-commands
  '(("pkg-env" (submod raco-pkg-env main) "sets up a package environment" 10)))
