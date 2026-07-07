This is where most student projects become weak.

They make 8-10 tables.

A real commerce platform has **40-60 entities**.

For Flipkart Build, I'd design a schema that's realistic but still implementable by one developer.

---

# CommerceBrain Database Schema v1.0

## Database

**PostgreSQL 17**

Design Principles

* UUID Primary Keys
* Soft Deletes
* Audit Fields
* Optimistic Scalability
* Third Normal Form
* Index-First Design

---

# Database Overview

```text
Authentication
│
├── users
├── refresh_tokens
├── sessions
├── roles
├── permissions
└── user_addresses

Commerce
│
├── products
├── product_images
├── product_categories
├── categories
├── brands
├── inventory
├── carts
├── cart_items
├── wishlists
├── wishlist_items
├── orders
├── order_items
├── payments
├── shipments
└── coupons

Reviews
│
├── reviews
├── review_images
├── review_votes

Seller
│
├── sellers
├── seller_products
├── seller_analytics

AI
│
├── search_history
├── ai_conversations
├── ai_messages
├── recommendation_logs
├── embedding_metadata

Analytics
│
├── page_views
├── product_views
├── search_logs
├── events

Infrastructure
│
├── notifications
├── api_keys
├── audit_logs
└── background_jobs
```

Total Tables

**35**

---

# Common Columns

Every table contains

```sql
id UUID PRIMARY KEY

created_at TIMESTAMP

updated_at TIMESTAMP

deleted_at TIMESTAMP NULL

created_by UUID NULL

updated_by UUID NULL
```

---

# Authentication Module

---

## users

```text
id

first_name

last_name

email

phone

password_hash

avatar_url

is_verified

is_active

role_id

last_login

created_at

updated_at
```

---

## roles

```text
id

name

description
```

Examples

```
Customer

Seller

Admin
```

---

## permissions

```
id

name

resource

action
```

---

## role_permissions

```
role_id

permission_id
```

---

## refresh_tokens

```
id

user_id

token

expires_at

revoked
```

---

## sessions

```
id

user_id

device

browser

ip

country

last_activity
```

---

## user_addresses

```
id

user_id

type

country

state

city

zipcode

landmark

is_default
```

---

# Product Module

---

## brands

```
id

name

logo

website
```

---

## categories

```
id

parent_category

name

slug

image
```

Hierarchical

Electronics

↓

Mobiles

↓

Android

---

## products

```text
id

seller_id

brand_id

category_id

sku

title

slug

description

price

discount_price

currency

rating

review_count

thumbnail

status

is_featured

created_at
```

---

## product_images

```
id

product_id

image_url

display_order
```

---

## inventory

```
id

product_id

quantity

reserved

warehouse

low_stock_threshold
```

---

# Cart Module

---

## carts

```
id

user_id

total

created_at
```

---

## cart_items

```
id

cart_id

product_id

quantity

price
```

---

# Wishlist

---

## wishlists

```
id

user_id
```

---

## wishlist_items

```
wishlist_id

product_id
```

---

# Order Module

---

## orders

```text
id

user_id

status

payment_status

shipping_address_id

billing_address_id

subtotal

discount

tax

shipping

grand_total
```

---

## order_items

```text
id

order_id

product_id

seller_id

price

quantity

total
```

---

## payments

```text
id

order_id

provider

transaction_id

status

amount

currency

paid_at
```

---

## shipments

```
id

order_id

tracking_number

carrier

status

estimated_delivery

delivered_at
```

---

# Review Module

---

## reviews

```text
id

product_id

user_id

rating

title

review

verified_purchase
```

---

## review_images

```
id

review_id

image_url
```

---

## review_votes

```
id

review_id

user_id

is_helpful
```

---

# Seller Module

---

## sellers

```
id

user_id

store_name

gst_number

verification_status

rating
```

---

## seller_products

```
seller_id

product_id
```

---

## seller_analytics

```
seller_id

daily_sales

monthly_sales

revenue

conversion_rate
```

---

# AI Module

---

## ai_conversations

```
id

user_id

title

started_at
```

---

## ai_messages

```text
id

conversation_id

role

message

tokens

response_time
```

---

## search_history

```text
id

user_id

query

filters

clicked_product

searched_at
```

---

## recommendation_logs

```
id

user_id

algorithm

recommended_products

clicked
```

---

## embedding_metadata

```
product_id

embedding_version

last_embedded

model_name
```

Actual vectors live in **ChromaDB**; PostgreSQL stores only metadata and synchronization state.

---

# Analytics Module

---

## page_views

```
id

user_id

page

duration

timestamp
```

---

## product_views

```
id

user_id

product_id

duration
```

---

## search_logs

```
id

query

latency

result_count
```

---

## events

```
id

event_name

payload

timestamp
```

Examples

```
ORDER_CREATED

PRODUCT_VIEWED

CHECKOUT_STARTED

AI_SEARCH

PAYMENT_SUCCESS

PRODUCT_CLICKED
```

---

# Infrastructure Module

---

## notifications

```
id

user_id

title

body

read
```

---

## audit_logs

```text
id

user_id

action

resource

old_value

new_value

ip
```

---

## api_keys

```
id

service

key_name

encrypted_value
```

---

## background_jobs

```
id

job_type

status

started_at

completed_at
```

---

# ER Diagram (High-Level)

```text
Users
 │
 ├──────────────┐
 │              │
Orders       Cart
 │              │
 │              └──── Cart Items ───── Products
 │                                      │
 │                                      ├──── Product Images
 │                                      ├──── Inventory
 │                                      ├──── Reviews
 │                                      └──── Brand
 │
Payments
 │
Shipments

Users
 │
Wishlists
 │
Wishlist Items
 │
Products

Users
 │
AI Conversations
 │
AI Messages

Users
 │
Search History
 │
Recommendation Logs

Products
 │
Embedding Metadata
 │
ChromaDB
```

---

# Indexing Strategy

Create indexes on all high-frequency lookup fields:

* `users(email)` (UNIQUE)
* `products(slug)` (UNIQUE)
* `products(category_id)`
* `products(brand_id)`
* `products(price)`
* `products(status)`
* `orders(user_id, created_at)`
* `reviews(product_id)`
* `inventory(product_id)`
* `search_history(user_id, searched_at)`
* `ai_messages(conversation_id)`
* `events(event_name, timestamp)`

---

# Why this schema is strong

This schema is intentionally designed to demonstrate:

* **Production-grade relational modeling** with normalized entities.
* **Separation of transactional data (PostgreSQL)** from **vector data (ChromaDB)**.
* **Role-based access control** suitable for Customer, Seller, and Admin workflows.
* **AI observability** through conversation, search, and recommendation logging.
* **Scalability** by keeping analytics, audit logs, and infrastructure concerns separate from core commerce entities.

It's significantly more representative of a real-world commerce backend than the simplified 8–10 table schemas commonly found in student e-commerce projects, while still being practical for a single developer to implement incrementally.
