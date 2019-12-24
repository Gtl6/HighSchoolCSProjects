;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname display-message) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require picturing-programs)
(require 2htdp/universe)

(define-struct message (name string))

(define (display message)
  (beside
   (text (string-append (message-name message) ": ") 14 "black")
   (text (message-string message) 14 "black")))


(above/align "right" 
             (display (make-message "Name1" "string1"))
             (display (make-message "Name2" "string2"))
             (display (make-message "Name" "string3")))

