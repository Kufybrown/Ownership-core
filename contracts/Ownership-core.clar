;; -----------------------------------------------------------
;; Ownership Demo Contract
;; Demonstrates: single owner, access control, and state updates
;; Compatible with Clarinet
;; -----------------------------------------------------------

;; The deployer of the contract becomes the initial owner
(define-data-var owner principal tx-sender)

;; A simple message that only the owner can update
(define-data-var message (string-ascii 50) "Hello, Stacks!")

;; -----------------------------------------------------------
;; READ-ONLY FUNCTIONS
;; -----------------------------------------------------------

;; Returns the current owner of the contract
(define-read-only (get-owner)
  (ok (var-get owner))
)

;; Returns the stored message
(define-read-only (get-message)
  (ok (var-get message))
)

;; -----------------------------------------------------------
;; PUBLIC (WRITE) FUNCTIONS
;; -----------------------------------------------------------

;; Allows the owner to update the message
(define-public (set-message (new-message (string-ascii 50)))
  (begin
    (print { action: "set-message", sender: tx-sender, new: new-message })
    (if (is-eq tx-sender (var-get owner))
        (begin
          (var-set message new-message)
          (ok "Message updated successfully"))
        (err "You are not the owner"))
  )
)

;; Allows the owner to transfer contract ownership to a new principal
(define-public (transfer-ownership (new-owner principal))
  (begin
    (print { action: "transfer-ownership", from: tx-sender, to: new-owner })
    (if (is-eq tx-sender (var-get owner))
        (begin
          (var-set owner new-owner)
          (ok "Ownership transferred"))
        (err "Only the current owner can transfer ownership"))
  )
)

;; -----------------------------------------------------------
;; OPTIONAL: RESET FUNCTION (only for the owner)
;; -----------------------------------------------------------

;; Resets the message back to default
(define-public (reset-message)
  (begin
    (print { action: "reset-message", sender: tx-sender })
    (if (is-eq tx-sender (var-get owner))
        (begin
          (var-set message "Hello, Stacks!")
          (ok "Message reset successfully"))
        (err "You are not the owner"))
  )
)
