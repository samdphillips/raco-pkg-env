#lang scribble/manual

@(require (for-label racket))

@(define-syntax-rule (changelog version release-date items ...)
   (begin
     (section version)
     "Release data:" release-date
     (itemlist items ...)))

@title{Changelog}

@changelog[
  "0.1.4"
  "2022/11/19"
  @item{Documentation tweaks}
  @item{Added license package metadata}]

@changelog[
  "0.1.3"
  "2022/08/28"
  @item{Add bin directory to path.}
  @item{Add a @litchar{--clear} command line flag to match python venv.}
  @item{Update the @litchar{PS1} environment variable in the
        activate script.}]

@changelog[
  "0.1.2"
  "2022/04/19"
  @item{Fix incorrect use of @racket[in-directory]}
  @item{Add logging}
  @item{Populate the contents of `lib-dir` and `bin-dir` from the "source"
        Racket installation.}]

@changelog[
  "0.1.1"
  "2021/04/19"
  @item{Initial release.}]

