;;;; imger.asd

(asdf:defsystem #:imger
  :description "Serving placeholder PNG images"
  :author "Aleksandar Radulovic <alex@a13x.net>"
  :license "MIT"
  :depends-on (#:ningle
               #:vecto
               #:babel
               #:babel-streams
               #:clack
               #:woo)
  :serial t
  :components ((:file "package")
               (:file "imger")))

