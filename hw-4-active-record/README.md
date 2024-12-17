
# Social App
## Overview
This is a Rails-based social application that supports users, tweets, likes, and comments. The app demonstrates a basic social media-like structure using Ruby on Rails.

## Generators Used

```bash
rails generate model User name:string email:string:index password_digest:string
rails generate model UserProfile user:references bio:text location:string
rails generate model Tweet user:references content:text
rails generate model Like user:references tweet:references comment:references
rails generate model Comment user:references tweet:references content:text
```
## Versions
```bash
ruby -v (3.3.1)
rails -v (7.1.5)
```