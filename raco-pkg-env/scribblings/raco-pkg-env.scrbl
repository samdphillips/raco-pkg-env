#lang scribble/manual

@title{raco-pkg-env: virtualenv like tool for Racket}
@author[(author+email "Sam Phillips" "samdphillips@gmail.com")]

@bold{**EXPERIMENTAL**}

This tool writes a @tt{config.rktd} file that you can point
@envvar{PLTCONFIGDIR} and install packages into a place that isn't the
installation scope or the user scope.

The package environment overlays the system installation scope.  There will
probably be some hiccups if you are using this.  Open some PRs and Issues.

Create a new package environment (from the shell):
@codeblock{
 ;; make the environment
 new-package> raco pkg-env _env

 ;; make the environment removing any existing environment
 new-package> raco pkg-env --clear _env

 ;; simple bash script that sets the PLTCONFIGDIR variable
 new-package> source _env/activate.sh

 ;; install some-package into _env
 (_env) new-package> raco pkg install some-packagename
}
