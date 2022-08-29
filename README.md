# raco-env-lib

**EXPERIMENTAL**

This tool writes a config.rktd file that you can point PLTCONFIGDIR and install
packages into a place that isn’t the installation scope or the user scope.

The package environment overlays the system installation scope. There will
probably be some hiccups if you are using this. Open some PRs and Issues.

## Usage
Create a new package environment (from the shell):
```
;; make the environment
new-package> raco pkg-env _env

;; simple bash script that sets the PLTCONFIGDIR variable
new-package> source _env/activate.sh

;; install some-package into _env
new-package> raco pkg install some-packagename
```

## Credits
- [Sam Phillips](https://github.com/samdphillips) - initial implementation
- [Leif Andersen](https://github.com/LeifAndersen) - additional functionality,
  bringing the tools more in line with Python venv facility.

