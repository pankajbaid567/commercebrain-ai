For a project of this scale, the API contracts should look like something an engineering team would hand to frontend developers before implementation.

**Don't think of this as a list of endpoints. Think of it as the public interface of your backend.**

---

# CommerceBrain

# API Contract Specification

**Version:** v1

**Protocol:** REST

**Format:** JSON

**Authentication:** JWT Bearer Token

**Base URL**

```
/api/v1
```

---

# API Standards

## Success Response

```json
{
  "success": true,
  "message": "Product created successfully.",
  "data": {}
}
```

---

## Error Response

```json
{
  "success": false,
  "error": {
    "code": "PRODUCT_NOT_FOUND",
    "message": "Product does not exist."
  }
}
```

---

## Pagination

```
?page=1
&limit=20
```

Response

```json
{
  "page":1,
  "limit":20,
  "total":523,
  "totalPages":27,
  "items":[]
}
```

---

# Authentication APIs

---

## Register

```
POST /auth/register
```

Request

```json
{
  "firstName":"Pankaj",
  "lastName":"Baid",
  "email":"abc@gmail.com",
  "password":"password",
  "phone":"9876543210"
}
```

Response

```json
{
  "userId":"",
  "emailVerified":false
}
```

---

## Login

```
POST /auth/login
```

Request

```json
{
  "email":"abc@gmail.com",
  "password":"password"
}
```

Response

```json
{
  "accessToken":"",
  "refreshToken":"",
  "expiresIn":3600,
  "user":{}
}
```

---

## Refresh Token

```
POST /auth/refresh
```

---

## Logout

```
POST /auth/logout
```

---

## Forgot Password

```
POST /auth/forgot-password
```

---

## Reset Password

```
POST /auth/reset-password
```

---

# User APIs

---

## Current User

```
GET /users/me
```

---

## Update Profile

```
PATCH /users/me
```

---

## Address List

```
GET /users/me/addresses
```

---

## Add Address

```
POST /users/me/addresses
```

---

## Delete Address

```
DELETE /users/me/addresses/{id}
```

---

# Product APIs

---

## Product List

```
GET /products
```

Filters

```
?page

&limit

&category

&brand

&priceMin

&priceMax

&rating

&sort
```

---

## Product Details

```
GET /products/{id}
```

---

## Related Products

```
GET /products/{id}/related
```

---

## Trending Products

```
GET /products/trending
```

---

## Featured Products

```
GET /products/featured
```

---

## Product Reviews

```
GET /products/{id}/reviews
```

---

## Create Product

Seller

```
POST /products
```

---

## Update Product

```
PATCH /products/{id}
```

---

## Delete Product

```
DELETE /products/{id}
```

---

# Category APIs

```
GET /categories

GET /categories/tree

GET /categories/{id}
```

---

# Brand APIs

```
GET /brands

GET /brands/{id}
```

---

# Inventory APIs

Seller

```
GET /inventory

PATCH /inventory/{productId}

POST /inventory/bulk-update
```

---

# Search APIs

---

## Traditional Search

```
GET /search
```

```
?q=iphone
```

---

## AI Semantic Search

```
POST /search/semantic
```

Request

```json
{
  "query":"Gaming laptop under 80k"
}
```

Response

```json
{
  "products":[],
  "reasoning":"These products match gaming and budget requirements."
}
```

---

## Search Suggestions

```
GET /search/suggestions
```

---

## Search History

```
GET /search/history
```

---

# Recommendation APIs

---

## Personalized Recommendations

```
GET /recommendations
```

---

## Frequently Bought Together

```
GET /recommendations/fbt/{productId}
```

---

## Similar Products

```
GET /recommendations/similar/{productId}
```

---

## Recently Viewed

```
GET /recommendations/recent
```

---

# AI Shopping Assistant

---

## Chat

```
POST /ai/chat
```

Request

```json
{
  "message":"Suggest a laptop under 80k."
}
```

Response

```json
{
  "answer":"...",
  "recommendedProducts":[]
}
```

---

## Conversation

```
GET /ai/conversations
```

---

## Conversation Messages

```
GET /ai/conversations/{id}
```

---

## Delete Conversation

```
DELETE /ai/conversations/{id}
```

---

# Seller Copilot

---

## Generate Title

```
POST /seller/copilot/title
```

---

## Generate Description

```
POST /seller/copilot/description
```

---

## Generate SEO Tags

```
POST /seller/copilot/seo
```

---

## Improve Listing

```
POST /seller/copilot/improve
```

---

# Cart APIs

---

## Current Cart

```
GET /cart
```

---

## Add Item

```
POST /cart/items
```

---

## Update Quantity

```
PATCH /cart/items/{id}
```

---

## Remove Item

```
DELETE /cart/items/{id}
```

---

## Clear Cart

```
DELETE /cart
```

---

# Wishlist APIs

```
GET /wishlist

POST /wishlist/{productId}

DELETE /wishlist/{productId}
```

---

# Checkout APIs

---

## Checkout

```
POST /checkout
```

---

## Payment Intent

```
POST /checkout/payment-intent
```

---

## Payment Callback

```
POST /checkout/webhook
```

---

# Order APIs

---

## My Orders

```
GET /orders
```

---

## Order Details

```
GET /orders/{id}
```

---

## Cancel Order

```
POST /orders/{id}/cancel
```

---

## Track Order

```
GET /orders/{id}/tracking
```

---

# Review APIs

---

## Create Review

```
POST /reviews
```

---

## Update Review

```
PATCH /reviews/{id}
```

---

## Delete Review

```
DELETE /reviews/{id}
```

---

## Helpful Vote

```
POST /reviews/{id}/vote
```

---

# Analytics APIs

---

## Seller Dashboard

```
GET /analytics/seller
```

---

## Revenue

```
GET /analytics/revenue
```

---

## Sales

```
GET /analytics/sales
```

---

## Product Performance

```
GET /analytics/products
```

---

## Customer Analytics

```
GET /analytics/customers
```

---

# Admin APIs

---

## Dashboard

```
GET /admin/dashboard
```

---

## User Management

```
GET /admin/users

PATCH /admin/users/{id}

DELETE /admin/users/{id}
```

---

## Seller Management

```
GET /admin/sellers

PATCH /admin/sellers/{id}/approve

PATCH /admin/sellers/{id}/reject
```

---

## Product Moderation

```
GET /admin/products

PATCH /admin/products/{id}/approve

PATCH /admin/products/{id}/reject
```

---

# Notifications

```
GET /notifications

PATCH /notifications/{id}/read
```

---

# Health APIs

```
GET /health

GET /health/db

GET /health/cache

GET /health/ai
```

---

# Internal APIs

These are **not exposed to the frontend**.

```
POST /internal/embeddings

POST /internal/recommendation/retrain

POST /internal/search/index

POST /internal/cache/invalidate

POST /internal/events/process
```

---

# API Summary

| Module            | Endpoints |
| ----------------- | --------: |
| Authentication    |         6 |
| Users             |         5 |
| Products          |         7 |
| Categories        |         3 |
| Brands            |         2 |
| Inventory         |         3 |
| Search            |         4 |
| Recommendations   |         4 |
| AI Assistant      |         4 |
| Seller Copilot    |         4 |
| Cart              |         5 |
| Wishlist          |         3 |
| Checkout          |         3 |
| Orders            |         4 |
| Reviews           |         4 |
| Analytics         |         5 |
| Admin             |         7 |
| Notifications     |         2 |
| Health            |         4 |
| Internal Services |         5 |

**Total:** **~81 REST endpoints**

---

## Recommendation for Flipkart Build

To elevate this beyond a typical student project, document these APIs in **OpenAPI 3.1 (Swagger)** and group them with tags:

* Authentication
* Users
* Catalog
* Commerce
* AI
* Seller
* Analytics
* Admin
* Infrastructure

With interactive Swagger UI, request/response schemas, authentication flows, and error models, your backend will resemble the API documentation used in production engineering teams rather than a college assignment.
