#lang scheme

(define reg-black 'b)
(define reg-red 'r)
(define king-black 'B)
(define king-red 'R)
(define red-square '_)
(define black-square '*)

(define columns (list "  " 1 2 3 4 5 6 7 8))
(define row-A(list 'A: reg-black red-square reg-black red-square reg-black red-square reg-black red-square))
(define row-B(list 'B: red-square reg-black red-square reg-black red-square reg-black red-square reg-black))
(define row-C(list 'C: reg-black red-square reg-black red-square reg-black red-square reg-black red-square))
(define row-D(list 'D: red-square black-square red-square black-square red-square black-square red-square black-square))
(define row-E(list 'E: black-square red-square black-square red-square black-square red-square black-square red-square))
(define row-F(list 'F: red-square reg-red red-square reg-red red-square reg-red red-square reg-red))
(define row-G(list 'G: reg-red red-square reg-red red-square reg-red red-square reg-red red-square))
(define row-H(list 'H: red-square reg-red red-square reg-red red-square reg-red red-square reg-red))
(define board(list columns "\n" row-A "\n" row-B "\n" row-C "\n" row-D
                           "\n" row-E "\n" row-F "\n" row-G "\n" row-H))

(define (start-position x)
  (print x))

(printf "Welcome to checkers!\n\n")
(display board)
(printf "\n\nRED it is your turn! Select the checker you want \n to move by entering its coordinates. For example, A1.\n")
