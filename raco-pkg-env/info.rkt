#lang info

(define name "raco-pkg-env")
(define version "0.1.4")
(define collection "raco-pkg-env")
(define deps '("base" "raco-pkg-env-lib"))
(define implies '("raco-pkg-env-lib"))
(define build-deps '("scribble-lib"))
(define scribblings '(["scribblings/raco-pkg-env.scrbl"]))
(define pkg-authors '(samdphillips@gmail.com))
(define license 'Apache-2.0)
