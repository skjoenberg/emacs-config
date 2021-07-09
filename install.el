(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider
                      evil
                      auto-indent-mode
                      flycheck-clj-kondo
                      company
                      expand-region
                      fsharp-mode
                      flycheck
                      haskell-mode
                      key-chord
                      magit
                      multiple-cursors
                      smex
                      smartparens
                      solarized-theme
                      yasnippet
                      powerline
                      web-mode
                      workgroups2
                      ))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
