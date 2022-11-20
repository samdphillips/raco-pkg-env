#lang info

(define name "raco-pkg-env-lib")
(define collection "raco-pkg-env")
(define version "0.1.4")
(define deps '("base"))
(define build-deps '("at-exp-lib"))
(define pkg-authors '(samdphillips@gmail.com))
(define license 'Apache-2.0)
(define raco-commands
  '(("pkg-env" (submod raco-pkg-env main)
               "sets up a package environment"
               10)))
