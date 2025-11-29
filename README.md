# 🔍 SQL Murder Mystery: Who Killed the CEO?

A full SQL-based investigation built using joins, time analysis, alibi checking, keycard logs, call patterns and evidence matching. This project solves a fictional murder using only SQL queries.

---

## 📁 Project Overview

This mystery centers around the CEO of **TechNova Inc.**, who was found dead on **October 15, 2025**.  
Your job is to analyze multiple tables to identify:

- **Who the killer is**
- **Where the crime happened**
- **When the crime happened**
- **Which clues reveal contradictions**
- **How the evidence aligns with movements and claims**

All conclusions are reached using SQL only.

---

## 🗂️ Database Schema

### `employees`
| employee_id | name | department | role |

### `keycard_logs`
| log_id | employee_id | room | entry_time | exit_time |

### `calls`
| call_id | caller_id | receiver_id | call_time | duration_sec |

### `alibis`
| alibi_id | employee_id | claimed_location | claim_time |

### `evidence`
| evidence_id | room | description | found_time |

---

Please Checkout the Investigation Steps Here ()
