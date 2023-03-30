
# Contact Management Poc (REST Apis)

We have exposed certain apis to manage contacts and groups. Any user who signup with our apis will have access to our contact and group apis.




## Features

- Signup
- Login
- Upload contacts using csv
- Choose contacts to add to a specific group(address book)
- List contacts added in a specific group


## Folder Structure

Below are the directories being updated as a part of this application:
- app
    - controllers
      - api >> v1 (Contains all the apis methods)
      - concerns (Added upload contacts code here)
      - application_controller (Contains authentication code)
    - helpers
      - Contains logic to authenticate signup and login apis
    - models
      - Contains all the ORM models
      - concerns (Added logic to create/verify jwt token)
    - serializers
      - Added object response format for user and contacts
    
- config
    - initalizers (Added contacts.rb to load config file)
    - database.yml (Put database configuration)
    - config.yml (Added configurations)
      - token_secret_key: ede3ba9d0c9fa019dff01af6794f300ae33e87e..
      - token_expiry_in_days: 15
      - app_token: f252112598b3b96ca..
      - storage_host: http://localhost:3000

- db
    - contains all the migrations
- storage
    - contains all the uploaded images/fles
## Steps to Run

