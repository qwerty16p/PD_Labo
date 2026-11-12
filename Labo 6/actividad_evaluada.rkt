#lang racket

(define (interes deposito)
  (cond
    [(<= deposito 40000) (* deposito 0.035)]
    [(<= deposito 260000) (* deposito 0.04)]
    [else (* deposito 0.045)]))

(displayln (interes 30000))
(displayln (interes 100000))
(displayln (interes 300000))
