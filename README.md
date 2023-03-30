
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
## Update configuration

- Update config/database.yml for database configuration
- Update config/config.yml for application configuration
   - token_secret_key -> This is used to generate jwt token for user authentication
   - token_expiry_in_days -> jwt token expiration
   - app_token -> token to authenticate signup and login apis
   - storage_host -> host for activate storage path
## Steps to Run

- `bundle install`
- `rake db:create`
- `rake db:migrate`
- `rails server`


## API Reference

#### User Signup

```http
  POST /api/users
```

**Headers**

| Key | Value     
| :-------- | :------- |
| `Accept` | `application/vnd.cmsapi; version=1` |
| `Authorization` | `Token token=eyJhbXXXX` |

**Body (form-data)**

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `user[first_name]`      | `string` | **Required**. First name of the user |
| `user[last_name]`      | `string` | **Required**. Last name of the user |
| `user[email]`      | `string` | **Required**. Email of the user |
| `user[password]`      | `string` | **Required**. Password to login |
| `user[phone]`      | `string` | **Required**. Phone of the user |
| `user[profile_picture]`      | `file` | Profile picture of user |

<img width="1150" alt="User Signup" src="https://user-images.githubusercontent.com/12808464/228814038-737cb708-5baa-439e-94f0-da6d9d0e51d6.png">


#### User Login

```http
  POST /api/users/sign_in
```

**Headers**

| Key | Value     
| :-------- | :------- |
| `Accept` | `application/vnd.cmsapi; version=1` |
| `Authorization` | `Token token=eyJhbXXXX` |
| `Content-Type` | `application/json` |

**Body**

```
{
    "user":{
        "email": "XXX@XXX.com",
        "password": "XXX"
    }
}
```
<img width="1158" alt="User Login" src="https://user-images.githubusercontent.com/12808464/228814098-9dad1cf0-fb57-40a7-9498-327b8b774d6e.png">



#### Upload contacts

```http
  POST /api/contact/Upload
```

**Headers**

| Key | Value     
| :-------- | :------- |
| `Accept` | `application/vnd.cmsapi; version=1` |
| `Authorization` | `Token token=eyJhbXXXX` |

**Body (form-data)**

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `file`      | `file` | **Required**. CSV file with contact details |

<img width="1163" alt="Contacts Upload" src="https://user-images.githubusercontent.com/12808464/228814151-4947fbe3-ba6f-480a-bb1b-901e72c4701c.png">



#### Create a group

```http
  POST /api/groups
```

**Headers**

| Key | Value     
| :-------- | :------- |
| `Accept` | `application/vnd.cmsapi; version=1` |
| `Authorization` | `Token token=eyJhbXXXX` |
| `Content-Type` | `application/json` |

**Body**

```
{
    "group": {
        "name": "Group Name",
        "description": "Group Description"
    }
}
```
<img width="1154" alt="Create Group" src="https://user-images.githubusercontent.com/12808464/228814223-42b63d75-58b2-4a92-8f69-1a39d7588414.png">



#### Add contacts to a group

```http
  POST /api/group/:group_id/add_contacts
```

**Headers**

| Key | Value     
| :-------- | :------- |
| `Accept` | `application/vnd.cmsapi; version=1` |
| `Authorization` | `Token token=eyJhbXXXX` |
| `Content-Type` | `application/json` |

**Body**

```
{
    "contacts_ids": ["1", "2"]
}
```

<img width="1139" alt="Add Contacts to Group" src="https://user-images.githubusercontent.com/12808464/228814335-341f7bf3-2e0b-4f6a-9e4a-41c0f8b16ea3.png">



#### List group contacts

```http
  POST /api/group/:group_id/list_contacts
```

**Headers**

| Key | Value     
| :-------- | :------- |
| `Accept` | `application/vnd.cmsapi; version=1` |
| `Authorization` | `Token token=eyJhbXXXX` |
| `Content-Type` | `application/json` |

