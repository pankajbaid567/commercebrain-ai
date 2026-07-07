# CommerceBrain

# User Flow Document

### Version 1.0

---

# User Journey Overview

CommerceBrain supports three primary user personas:

```text
                    CommerceBrain

                         │
        ┌────────────────┼────────────────┐
        │                │                │
        │                │                │
    Customer          Seller          Admin
        │                │                │
        │                │                │
 Shopping Flow      Business Flow     Platform Flow
```

---

# Customer Journey

## Complete Customer Lifecycle

```text
Landing Page

↓

Browse Products

↓

Search Products

↓

View Product

↓

Ask AI

↓

Add to Cart

↓

Checkout

↓

Payment

↓

Order Tracking

↓

Delivery

↓

Review Product

↓

AI Follow-up Recommendations
```

---

# Customer Authentication Flow

```text
Landing

↓

Login/Register

↓

Email Verification

↓

Profile Creation

↓

Address Setup

↓

Home Dashboard
```

---

# First-Time User Flow

```text
Landing

↓

Sign Up

↓

Email Verification

↓

Complete Profile

↓

Select Interests

↓

Recommended Products Generated

↓

Welcome Dashboard
```

---

# Returning User Flow

```text
Landing

↓

JWT Validation

↓

Fetch User Session

↓

Personalized Home

↓

Recently Viewed

↓

Recommendations

↓

Continue Shopping
```

---

# Product Discovery Flow

```text
Home

↓

Browse Categories

↓

Product Grid

↓

Filters

↓

Sort

↓

Open Product

↓

Product Details
```

---

# AI Search Flow

This is one of the flagship experiences.

```text
Home

↓

AI Search Box

↓

Natural Language Query

↓

Query Understanding

↓

Semantic Search

↓

Ranking

↓

AI Explanation

↓

Product Results

↓

Open Product
```

Example

```text
"I need a lightweight laptop under ₹70,000 for programming."

↓

Intent Detection

↓

Budget Extraction

↓

Category Detection

↓

Ranking

↓

Recommendations
```

---

# Product Details Flow

```text
Product

↓

Images

↓

Specifications

↓

Reviews

↓

AI Summary

↓

Compare Products

↓

Add To Cart
```

---

# AI Shopping Assistant Flow

```text
Open AI Assistant

↓

Ask Question

↓

Context Retrieval

↓

LLM

↓

Recommendation Engine

↓

Response

↓

Suggested Products

↓

Compare

↓

Buy
```

---

# Product Comparison Flow

```text
Product A

↓

Compare

↓

Select Product B

↓

AI Comparison

↓

Pros

↓

Cons

↓

Recommendation
```

---

# Add To Cart Flow

```text
Product

↓

Select Variant

↓

Quantity

↓

Inventory Check

↓

Cart Updated

↓

Mini Cart

↓

Continue Shopping
```

---

# Checkout Flow

```text
Cart

↓

Address

↓

Shipping Method

↓

Coupon

↓

Payment

↓

Order Review

↓

Place Order

↓

Success
```

---

# Payment Flow

```text
Checkout

↓

Payment Gateway

↓

Payment Success

↓

Order Created

↓

Inventory Updated

↓

Confirmation Email

↓

Tracking Page
```

---

# Order Tracking Flow

```text
Orders

↓

Order Details

↓

Shipment Tracking

↓

Delivery Updates

↓

Delivered

↓

Leave Review
```

---

# Review Flow

```text
Delivered

↓

Rate Product

↓

Write Review

↓

Upload Images

↓

Submit

↓

AI Sentiment Analysis
```

---

# Wishlist Flow

```text
Product

↓

Save

↓

Wishlist

↓

Price Drop Notification

↓

Move To Cart
```

---

# Seller Journey

---

# Seller Onboarding

```text
Register

↓

Business Details

↓

GST

↓

Verification

↓

Admin Approval

↓

Seller Dashboard
```

---

# Seller Dashboard

```text
Dashboard

↓

Products

↓

Inventory

↓

Orders

↓

Analytics

↓

AI Copilot
```

---

# Add Product Flow

```text
Products

↓

New Product

↓

Upload Images

↓

Specifications

↓

Pricing

↓

Inventory

↓

Save Draft

↓

Publish
```

---

# AI Seller Copilot Flow

```text
Product Editor

↓

Generate Description

↓

Generate SEO

↓

Generate Tags

↓

Improve Listing

↓

Preview

↓

Publish
```

---

# Inventory Management Flow

```text
Inventory

↓

Low Stock Detection

↓

AI Prediction

↓

Recommended Restock

↓

Update Inventory
```

---

# Seller Order Management

```text
New Order

↓

Accept

↓

Pack

↓

Ship

↓

Delivered

↓

Payment Settled
```

---

# Seller Analytics Flow

```text
Dashboard

↓

Revenue

↓

Orders

↓

Conversion

↓

Best Products

↓

AI Insights
```

Example Insight

```text
AI

↓

"Gaming laptops convert 34% higher than ultrabooks."

↓

Suggested Action

↓

Increase Inventory
```

---

# Admin Journey

---

# Admin Login

```text
Login

↓

Dashboard
```

---

# Admin Dashboard

```text
Dashboard

↓

Users

↓

Sellers

↓

Products

↓

Orders

↓

Reports

↓

Settings
```

---

# Seller Approval Flow

```text
Pending Seller

↓

Review Documents

↓

Approve

↓

Seller Activated
```

---

# Product Moderation Flow

```text
Pending Product

↓

AI Moderation

↓

Admin Review

↓

Approve

↓

Visible To Customers
```

---

# Fraud Review Flow

```text
Fraud Alert

↓

Open Report

↓

Investigate

↓

Suspend User

↓

Log Action
```

---

# AI Recommendation Flow

```text
User Activity

↓

Product Views

↓

Purchase History

↓

Embedding Generation

↓

Recommendation Engine

↓

Personalized Feed
```

---

# Semantic Search Flow

```text
Query

↓

Spell Correction

↓

Intent Detection

↓

Embedding

↓

BM25 Search

↓

Vector Search

↓

Hybrid Ranking

↓

Return Products
```

---

# Review Intelligence Flow

```text
Reviews

↓

Preprocessing

↓

Sentiment Analysis

↓

Topic Extraction

↓

Pros

↓

Cons

↓

Summary
```

---

# Price Prediction Flow

```text
Historical Prices

↓

ML Model

↓

Forecast

↓

Future Price

↓

Display Prediction
```

---

# Notification Flow

```text
Event

↓

Notification Service

↓

Email

↓

Push

↓

In-App Notification
```

Events

* Order Shipped
* Order Delivered
* Payment Success
* Price Drop
* Low Inventory
* AI Recommendation
* Seller Approved

---

# Search Flow (Technical)

```text
User

↓

Frontend

↓

Search API

↓

Validation

↓

Redis Cache

↓

Cache Hit?

↓

YES → Return

↓

NO

↓

Semantic Search

↓

Hybrid Ranking

↓

Store Cache

↓

Frontend
```

---

# Checkout Sequence

```text
Cart

↓

Validate Stock

↓

Reserve Inventory

↓

Payment

↓

Payment Success

↓

Create Order

↓

Reduce Inventory

↓

Generate Invoice

↓

Send Notification
```

---

# Authentication Flow

```text
Login

↓

Credentials

↓

JWT Generated

↓

Refresh Token

↓

Redis Session

↓

Protected APIs
```

---

# Error Flow

```text
Request

↓

Validation

↓

Exception

↓

Global Handler

↓

JSON Response

↓

Frontend Toast
```

---

# Session Recovery Flow

```text
Access Token Expired

↓

Refresh Token

↓

New JWT

↓

Continue Session
```

---

# Mobile User Flow

```text
Landing

↓

Search

↓

AI Assistant

↓

Product

↓

Cart

↓

Checkout

↓

Payment

↓

Track Order
```

---

# Complete System Flow

```text
                    USER
                      │
                      ▼
               Next.js Frontend
                      │
                      ▼
                 FastAPI Gateway
                      │
      ┌───────────────┼───────────────┐
      ▼               ▼               ▼
 Commerce        AI Services     Infrastructure
 Modules
      │               │               │
      └───────────────┼───────────────┘
                      ▼
                 PostgreSQL
                      │
                  Redis Cache
                      │
                  ChromaDB
                      │
                OpenAI / Gemini
```

---

# Critical User Flows (MVP)

These are the flows you should implement first:

| Priority | Flow                             | Importance          |
| -------- | -------------------------------- | ------------------- |
| ⭐⭐⭐⭐⭐    | Customer Authentication          | Core                |
| ⭐⭐⭐⭐⭐    | Product Search                   | Core                |
| ⭐⭐⭐⭐⭐    | Product Details                  | Core                |
| ⭐⭐⭐⭐⭐    | Add to Cart → Checkout → Payment | Core                |
| ⭐⭐⭐⭐⭐    | AI Shopping Assistant            | Flagship AI Feature |
| ⭐⭐⭐⭐☆    | Seller Product Management        | High                |
| ⭐⭐⭐⭐☆    | Seller AI Copilot                | High                |
| ⭐⭐⭐⭐☆    | Recommendation Engine            | High                |
| ⭐⭐⭐☆☆    | Review Intelligence              | Medium              |
| ⭐⭐⭐☆☆    | Admin Dashboard                  | Medium              |
| ⭐⭐☆☆☆    | Price Prediction                 | Stretch             |
| ⭐⭐☆☆☆    | Inventory Prediction             | Stretch             |

## Recommendation

This user flow document is already at the level of an engineering specification. The next artifact I'd create is **Screen Flow + Wireframes**, where each node in these flows maps directly to a UI screen (e.g., `HOME-001`, `SEARCH-002`, `PRODUCT-003`). That creates a one-to-one relationship between **user flows**, **UI screens**, and **frontend implementation**, making development much more structured and professional.
