
# TravelTours

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
TravelTours is an application designed for people who are always looking for new hotspots. Through the application, users can post reviews of tourist attractions, add new spots for others to discover, and bookmark places they would love to visit. They can also add their own photos of the places they have visited.

### App Evaluation
- **Category:** Lifestyle
- **Mobile:** This app will be devloped for mobile platforms but can also have web version with the same features.
- **Story:** Users posts travel hotspots, review tourist attractions, and bookmark favorites.
- **Market:** Any individuals that have access to mobile apps but primarily people who love to travel.
- **Habit:** This app can be used very often by people who love to travel and photography.
- **Scope:** This app use location service to determine nearby tour attractions.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] New users can register
- [X] User logs into app
- [X] User can view their information
- [X] User can write reviews and give ratings
- [ ] User can view their reviews history
- [ ] User can favorite or bookmark tourist attractions
- [ ] User can pull up their device camera
- [ ] User can add photos and write comments

**Optional Nice-to-have Stories**

* Location service is activicated and users can find nearby hotspots

### 2. Screen Archetypes

* Login Screen
   * User can login
* Registration Screen
   * User can create a new account
* Stream
   * User can view feed of tourist attraction photos
   * User can double tap to bookmark
* Detail
   * User can book or make reservations
   * User can see what is famous in the local
   * User can see what language is spoken at the destination
* Search
   * User can search for other users
   * User can follow/unfollow another user
   * User can search up the name of country->city->hotspot
* Creation
   * User can post new photo and tag the tourist spot
   * User can write a review of the attraction  
* Profile
   * Shows profile picture and username
   * Shows the number of visits, bookmarks, following and followers
   * User can recommend what they think is the best spot and will show up on their profile page
* Settings
   * User can change location (continent - country)
   * User can look through their account details such as profile picture and make changes
   * Privacy & Security
   * Notifications
   * Help and Support
* Maps
   * Users can find their nearest attraction when location service is turned on

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* Search bar
* Post
* Map
* Profile

**Flow Navigation** (Screen to Screen)

* Login Screen
* Registration Screen
* Stream Screen
* Creation Screen
* Profile Screen
* Camera 
* Location Screen
* Details Screen

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/VsRiB6O.png" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

### Registration Screen
| Property       | Type       | Description  |
| ------------- |:-------------:| ----- |
| userID      | string | Unique ID which can be set for that new user |
| password      | string | User sets a password for their account |
| travelLogo | file | TravelTours logo displays on registration |

### Details
| Property       | Type       | Description  |
| ------------- |:-------------:| ----- |
| book      | file | Allows user to book their travel reservations |
| famous      | string | User can see what destinations or sites are popular within that area |
| language | string | User can see the predominate langauge spoken in the area |

### Profile
| Property       | Type       | Description  |
| ------------- |:-------------:| ----- |
| userID      | string | Unique ID for the user |
| name      | string | name of the user |
| profile picture | file | Unique profile picture the user uploaded |
| location | string | where the user is located, can be manually changed |
| followers | number | amount of followers of the user |
| following | number | amount of users the user is following|
| visits | number | amount of different places the user have traveled |

### Feed
| Property       | Type       | Description  |
| ------------- |:-------------:| ----- |
| name of location | string | Shows the name of the location or hotspot the user posts |
| distance      | number | User can see how far the hotspot is from their current location in miles |
| description | string | User can view a brief description of the area |
| ratings | file | User can view the ratings rated by other users of the hotspot |

### Search
| Property       | Type       | Description  |
| ------------- |:-------------:| ----- |
| name of location | string | On the Search field, used to search user or location |
| userID      | string | If User search is valid, this is the searched user's UserID |
| name      | string | If User search is valid, this is the searched user's name | 
| profile picture | UIImage | If User search is valid, this is the searched user's location|
| location | string | If Location search is valid, this is the searched location's location |
| image | UIImage | If Location search is valid, this is the searched location's location |
| distance      | number | If Location search is valid, this is the searched location's distance from user |
| description | string | If Location search is valid, this is the searched location's distance description of the area |
| ratings | file | If Location search is valid, this is the searched location's distance ratings |

### Camera
| Property       | Type       | Description  |
| ------------- |:-------------:| ----- |
|C amera | UIImagePicker |Allows for camera or photo library access |



### Networking
- [Add list of network requests by screen ]
* Home Feed Screen
  * (Read/GET) Query all posts where user is author
  * (Create/POST) Create a new like on a post
  * (Delete) Delete existing like
  * (Create/POST) Create a new comment on a post
  * (Delete) Delete existing comment
* Create Post Screen
  * (Create/POST) Create a new post object
* Profile Screen
  * (Read/GET) Query logged in user object
  * (Update/PUT) Update user profile image
- [Create basic snippets for each Parse network request]
- [Sygic Travel API]
* Base URL - http://docs.sygictravelapi.com/1.2/
