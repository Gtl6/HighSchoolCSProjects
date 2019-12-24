;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Client) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require picturing-programs)
(define (back-space x)
  (cond
    [(or (empty? (string->list x)) (empty? (rest (string->list x)))) ""]
    [(not (empty? (string->list x))) (list->string (reverse (rest (reverse (string->list x)))))]
    [else x]))
(define (keyer x e)
  (cond 
    [(equal? e "\b") (back-space x)]
    [(equal? e "\r") (string->list x)]
    [(and 
          (or (string? x) (empty? (string->list x)))
          (empty? (rest (string->list e))))
         (string-append x e)]
    [else x]))
(define (ticker x)
  (cond [(not (string? x)) (make-package "" (list->string x))]
        [else x]))
(define (drawer x)
  (cond [(string? x) (overlay/align "left" "center" (text x 15 "black") (rectangle 900 12 "solid" "white"))]
        [else (make-board x (recatangle 900 900 "solid" "white") 12)]))
;(define (receiver x)
 ; x)
(define (make-board x y z)
  (cond [(empty? x) empty]
        [else (make-board (rest (rest x)) 
                          (place-image (text (string-append (first x) ":" (second x)) 12 "black") 0 z y)
                          (+ z 12))]))
  
(big-bang ""
          (name "runner")
          ;(on-receive receiver)
          (on-tick ticker)
          (on-key keyer)
          (on-draw drawer))

(check-expect (back-space "run durmn") "run durm")
