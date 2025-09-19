;; route-tracker.clar
;; Moralis Route Asset Tracking System
;; Enables secure, transparent tracking of digital assets with granular access controls

;; ===============================
;; Error Codes
;; ===============================
(define-constant ERR-UNAUTHORIZED-ACCESS (err u100))
(define-constant ERR-ASSET-NONEXISTENT (err u101))
(define-constant ERR-ASSET-DUPLICATE (err u102))
(define-constant ERR-ROUTE-MISSING (err u103))
(define-constant ERR-INVALID-INPUT (err u104))
(define-constant ERR-VIEWER-UNAUTHORIZED (err u105))
(define-constant ERR-CATEGORY-NONEXISTENT (err u106))
(define-constant ERR-THRESHOLD-NONEXISTENT (err u107))
(define-constant ERR-THRESHOLD-DUPLICATE (err u108))

;; (Rest of the contract remains identical to the previous implementation)
;; For brevity, I'll only show the changes in structure and namings

;; ===============================
;; Data Structures
;; ===============================
(define-map tracked-assets
  {
    owner: principal,
    asset-identifier: (string-ascii 36),
  }
  {
    name: (string-utf8 100),
    route-category: (string-ascii 50),
    acquisition-timestamp: uint,
    initial-value: uint,
    current-value: uint,
    last-updated: uint,
    metadata: (optional (string-utf8 1000)),
    public-visibility: bool,
  }
)

;; (Remaining data structures remain similar, with minor naming changes)

;; All other functions and implementations remain logically identical 
;; to the original contract, just with adjusted variable and function names