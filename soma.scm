#lang scheme

(require test-engine/scheme-tests)

;; FOR REFERENCE REGARDING WHAT THE NAMES MEAN, SEE THE IMAGES 
;; DIRECTORY

;; cube's limit.
(define CUBE-LIMIT 3)

(define L-TRICUBE-NAME "l-tricube")



;; 3d-point
;; is a structure that represents a 3d point where
;; x, y and z are integers. 
;; name is a string or a boolean 
;;      If there is a figure occupying this point it is its name.
;;      Else it is #f.
(define-struct 3d-point (x y z name) #:transparent)

;; 3d-figure
;; represents a collection of 3d points, with a name
;; name is a string
;; points is a list of 3d-points
;; (define-struct 3d-figure (name points))

;; soma-cube 
;; is a collection of 27 3d points

;; make-l-tricube : 3d-point -> (listof 3d-points)
;; make a l-tricube given an edge position. 
(define (make-l-tricube edge-point)
  (list (make-3d-point (3d-point-x edge-point)
                       (3d-point-y edge-point)
                       (3d-point-z edge-point)
                       L-TRICUBE-NAME)
        (make-3d-point (3d-point-x edge-point)
                       (add1 (3d-point-y edge-point))
                       (3d-point-z edge-point)
                       L-TRICUBE-NAME)
        (make-3d-point (3d-point-x edge-point)
                       (add1 (3d-point-y edge-point))
                       (add1 (3d-point-z edge-point))
                       L-TRICUBE-NAME)))


(check-expect (make-l-tricube (make-3d-point 0 0 0 #f))
              (list (make-3d-point 0 0 0 L-TRICUBE-NAME)
                    (make-3d-point 0 1 0 L-TRICUBE-NAME)
                    (make-3d-point 0 1 1 L-TRICUBE-NAME)))
(test)




