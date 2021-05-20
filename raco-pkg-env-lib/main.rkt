#lang racket/base

(require racket/file
         racket/format
         racket/match
         racket/path
         racket/pretty
         setup/dirs)

(define (setup-env-dir key system-config env-config proc)
  (let ([src (hash-ref system-config 'lib-dir #f)]
        [dest (hash-ref env-config 'lib-dir)])
    (make-directory* dest)
    (when src
      (define (destname n)
        (build-path dest (file-name-from-path n)))
      (define (link n)
        (make-file-or-directory-link n (destname n)))
      (define (copy n)
        (copy-file n (destname n)))
      (for ([fname (in-directory src)]) (proc fname copy link)))))

(define (install-environment! env-dir)
  (define env-config-dir (build-path env-dir "etc"))
  (define system-config-rktd
    (build-path (find-config-dir) "config.rktd"))

  (define system-config (file->value system-config-rktd))

  (define env-config
    (hash-set* system-config
               ;; changed keys
               'bin-dir
               (path->string (build-path env-dir "bin"))

               'doc-dir
               (path->string (build-path env-dir "doc"))

               'lib-dir
               (path->string (build-path env-dir "lib"))

               'share-dir
               (path->string (build-path env-dir "share"))

               ;; added keys
               'default-scope
               "installation"

               'links-file
               (path->string (build-path env-dir "links.rktd"))

               'doc-search-dirs
               (list #f (path->string (find-doc-dir)))

               'links-search-files
               (list #f (path->string (find-links-file)))

               'pkgs-dir
               (path->string (build-path env-dir "pkgs"))

               'pkgs-search-dirs
               (list #f (path->string (find-pkgs-dir)))

               ;; random from uuidgen, maybe the user doesn't want to mess with this?
               ;; 'installation-name "b1760145-c765-4f74-ac27-bd5f441c60a5"
               ))

  (make-directory* env-config-dir)
  (call-with-output-file (build-path env-config-dir "config.rktd")
    (lambda (outp)
      (pretty-write env-config outp)))

  ;; Setup lib-dir
  ;; Copy config files, symlink everything else
  (setup-env-dir 'lib-dir system-config env-config
                 (lambda (fname copy link)
                   (match (path-get-extension fname)
                     [#".rktd" (copy fname)]
                     [_        (link fname)])))


  ;; Setup bin-dir
  (setup-env-dir 'bin-dir system-config env-config
                 (lambda (fname copy link) (link fname)))

  (call-with-output-file (build-path env-dir "activate.sh")
    (lambda (outp)
      (displayln (~a "export PLTCONFIGDIR=\"" env-config-dir "\"") outp))))

(module* main #f
  (require racket/match)
  (match (current-command-line-arguments)
    [(vector env-dir-string)
     (install-environment!
      (path->complete-path
       (string->path env-dir-string)))]))

