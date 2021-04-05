#lang racket/base

(require racket/file
         racket/format
         racket/pretty
         setup/dirs)

(define env-dir (build-path (current-directory) "_raco-env"))
(define env-config-dir (build-path env-dir "etc"))

(define system-config-rktd
  (build-path (find-config-dir) "config.rktd"))

(define system-config (file->value system-config-rktd))

(define env-config
  (hash-set* system-config
             ;; changed keys
             'doc-dir (path->string (build-path env-dir "doc"))

             ;; added keys
             'default-scope "installation"

             'links-file (path->string (build-path env-dir "links.rktd"))

             ;; random from uuidgen
             'installation-name "b1760145-c765-4f74-ac27-bd5f441c60a5"

             'doc-search-dirs
             (list #f (path->string (find-doc-dir)))

             'links-search-files
             (list #f (path->string (find-links-file)))

             'pkgs-dir (path->string (build-path env-dir "pkgs"))

             'pkgs-search-dirs
             (list #f (path->string (find-pkgs-dir)))))

(make-directory* env-config-dir)
(call-with-output-file (build-path env-config-dir "config.rktd")
  (lambda (outp)
    (pretty-write env-config outp)))

(displayln (~a "export PLTCONFIGDIR=\"" env-config-dir "\""))
