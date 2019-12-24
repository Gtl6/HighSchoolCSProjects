;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname serverquestionmark) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require picturing-programs)

;The mail package will be (name, message)
;The model will be (list (list of users) (list of 

(define (newsy u-model)
  (for (each u-model) (make-mail (second each) (string-append (first each) " has joined the chat."))))

(define (posty u-model iworld expression)
  (for (each u-model) (make-mail each (check-fiver u-model expression)

(universe `()
          (on-new newsy) ; On new, makes a new chat saying "name" joined the chat
                         ; also appends name to list of clients
          (on-msg posty) ; When sent a message, post it