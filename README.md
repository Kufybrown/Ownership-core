# Ownership-core

Simple Stacks / Clarity demo contract that demonstrates single-owner access control, state updates, and ownership transfer.

## Contract purpose
- Sets deployer as initial owner.
- Stores a short message (string-ascii 50) with a read-only getter.
- Only the owner can update the message, transfer ownership, or reset the message.

## Files
- contracts/Ownership-core.clar — the Clarity contract.

## Key behavior
- Initial owner: the account that deploys the contract.
- Message: limited to 50 ASCII characters, default "Hello, Stacks!".
- All public write functions return (ok "...") on success or (err "...") on failure.

## Public (write) functions
- set-message (new-message (string-ascii 50))
  - Owner-only. Updates the stored message.
  - Returns (ok "Message updated successfully") or (err "You are not the owner").

- transfer-ownership (new-owner principal)
  - Owner-only. Transfers ownership to new-owner.
  - Returns (ok "Ownership transferred") or (err "Only the current owner can transfer ownership").

- reset-message
  - Owner-only. Resets message to default ("Hello, Stacks!").
  - Returns (ok "Message reset successfully") or (err "You are not the owner").

## Read-only functions
- get-owner -> returns (ok principal)
- get-message -> returns (ok (string-ascii 50))

## Quick test / usage
1. Open a terminal in the project root (Windows PowerShell / CMD).
2. Run the Clarinet test suite:
   - clarinet test
3. Manual checks (recommended via Clarinet tests or a script):
   - Verify deployer is owner: call get-owner.
   - Verify default message: call get-message -> "Hello, Stacks!".
   - As owner: call set-message and confirm success and updated message.
   - As non-owner: call set-message / transfer-ownership / reset-message and expect error responses.

## Example Clarinet test snippet (illustrative)
Use your preferred Clarinet test framework; a typical test will:
- Deploy contract (handled by Clarinet).
- Call read-only functions to assert owner and message.
- Submit transactions as different accounts to assert owner-only checks.

## Notes
- Message field uses string-ascii 50 — longer strings will be rejected by Clarity typing.
- Contract prints debug messages for public actions to aid local testing.

License: use as needed for learning and testing.

```// filepath: c:\Users\user\Documents\stacks\Ownership-core\README.md
# Ownership-core

Simple Stacks / Clarity demo contract that demonstrates single-owner access control, state updates, and ownership transfer.

## Contract purpose
- Sets deployer as initial owner.
- Stores a short message (string-ascii 50) with a read-only getter.
- Only the owner can update the message, transfer ownership, or reset the message.

## Files
- contracts/Ownership-core.clar — the Clarity contract.

## Key behavior
- Initial owner: the account that deploys the contract.
- Message: limited to 50 ASCII characters, default "Hello, Stacks!".
- All public write functions return (ok "...") on success or (err "...") on failure.

## Public (write) functions
- set-message (new-message (string-ascii 50))
  - Owner-only. Updates the stored message.
  - Returns (ok "Message updated successfully") or (err "You are not the owner").

- transfer-ownership (new-owner principal)
  - Owner-only. Transfers ownership to new-owner.
  - Returns (ok "Ownership transferred") or (err "Only the current owner can transfer ownership").

- reset-message
  - Owner-only. Resets message to default ("Hello, Stacks!").
  - Returns (ok "Message reset successfully") or (err "You are not the owner").

## Read-only functions
- get-owner -> returns (ok principal)
- get-message -> returns (ok (string-ascii 50))

## Quick test / usage
1. Open a terminal in the project root (Windows PowerShell / CMD).
2. Run the Clarinet test suite:
   - clarinet test
3. Manual checks (recommended via Clarinet tests or a script):
   - Verify deployer is owner: call get-owner.
   - Verify default message: call get-message -> "Hello, Stacks!".
   - As owner: call set-message and confirm success and updated message.
   - As non-owner: call set-message / transfer-ownership / reset-message and expect error responses.

## Example Clarinet test snippet (illustrative)
Use your preferred Clarinet test framework; a typical test will:
- Deploy contract (handled by Clarinet).
- Call read-only functions to assert owner and message.
- Submit transactions as different accounts to assert owner-only checks.

## Notes
- Message field uses string-ascii 50 — longer strings will be rejected by Clarity typing.
- Contract prints debug messages for public actions to aid local testing.

License: use as needed for learning and testing.
