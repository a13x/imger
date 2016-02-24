;;;; imger.lisp

(in-package #:imger)

;;; "imger" goes here. Hacks and glory await!

(defvar *app* (make-instance '<app>))
(defvar *h* nil)

(defmacro n-param (param params)
  `(parse-integer (cdr (assoc ,param ,params))))

(defun serve-image (params)
  (let ((w (n-param :w params))
        (h (n-param :h params)))
    (progn
      (setf (response-status *response*) 200)
      (setf (getf (response-headers *response*) :content-type) "image/png")
      
        (coerce (with-output-to-sequence (s) 
                                 (with-canvas (:width w :height h)
                                              (set-rgb-fill 0.2 0.2 0.9)
                                              (clear-canvas)
                                              (save-png-stream s))
                                 :element-type '(unsigned-byte 8)
                                 )
                '(simple-array (unsigned-byte 8) (*)) 
                )
      )
    )
  )

(setf (route *app* "/i/:w/:h") #'serve-image)

(defun start ()
  (setf *h* (clack:clackup *app* :server :woo)))
