# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

requirements

* postgresql

# Installation
```bash
  $  bundle install
```

# Run Tests
```bash
  $ rake
```

# Seed
```bash
$ rake db:seed
```

There are two different kinds of user, one is admin user and shelter worker. Admin user can create shelter workers and shelter. Shelter workers can create pets for a shelter and manage pet data.

Requests

* Create a shelter
Replace the authorization token with the one from the rake db:seed command

```bash
curl -X POST "http://localhost:3000/v1.0.0/shelters" -H "Authorization: 9" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"shelter\": { \"name\": \"string\", \"description\": \"string\", \"address\": \"string\", \"city\": \"string\", \"postcode\": \"string\" }}"
```

* Delete a shelter
```bash
curl -X DELETE "http://localhost:3000/v1.0.0/shelters/18" -H "accept: application/json" -H "Authorization: 9"
```

* Create a worker
```bash
curl -X POST "http://localhost:3000/v1.0.0/shelters/7/workers" -H "accept: application/json" -H "Content-Type: application/json" -H "Authorization: 9" -d "{ \"worker\": { \"email\": \"email@example.com\", \"first_name\": \"David\", \"last_name\": \"Smith\", \"address\": \"rosa luxemburg 13\", \"city\": \"Berlin\", \"postcode\": \"12345\" }}"
```

* Delete a worker
```bash
curl -X DELETE "http://localhost:3000/v1.0.0/shelters/10/workers/9" -H "accept: application/json" -H "Authorization: 9"
```

* Get all pets from a shelter
```bash
curl -X GET "http://localhost:3000/v1.0.0/shelters/14/pets" -H "accept: application/json" -H "Authorization: 9"
```

* Create a pet
```bash
curl -X POST "http://localhost:3000/v1.0.0/shelters/14/pets" -H "accept: application/json" -H "Content-Type: application/json" -H "Authorization: 9" -d "{ \"pet\": { \"image_link\": \"http://s3.petstore_images.com/1\", \"medical_condition\": \"good health\", \"race\": \"cat\", \"name\": \"Milo\", \"status\": \"adoption_available\" }}"
```

* Get details of a pet
```bash
curl -X GET "http://localhost:3000/v1.0.0/shelters/14/pets/141" -H "accept: application/json" -H "Authorization: 9"
```

* Set available for adoption
```bash
curl -X POST "http://localhost:3000/v1.0.0/shelters/14/pets/141/set_adoptable" -H "accept: application/json" -H "Authorization: 9"
```

* Remove from listing
```bash
curl -X POST "http://localhost:3000/v1.0.0/shelters/14/pets/141/delist" -H "accept: application/json" -H "Authorization: 9"
```

* Get adoption request if available
```bash
curl -X GET "http://localhost:3000/v1.0.0/shelters/14/pets/141/adoption_request" -H "accept: application/json" -H "Authorization: 9"
```

* Delete adoption request of a pet
```bash
curl -X DELETE "http://localhost:3000/v1.0.0/shelters/14/pets/141/adoption_request" -H "accept: application/json" -H "Authorization: 9"
```
