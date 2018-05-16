# Humour App

## Requirements

Create an app that given an Twitter username it will list user's tweets. When I tap one of the tweets the app will visualy indicate if it's a happy, neutral or sad tweet.

### Business rules

- **Happy Tweet**: We want a vibrant yellow color on screen with a 😃 emoji
- **Neutral Tweet**: We want a grey colour on screen with a 😐 emoji
- **Sad Tweet**: We want a blue color on screen with a 😔 emoji
- For the first release we will only support **english language**.

### Non-functional Requirements

- As this app will be a worldwide success, it must be prepared to be fault tolerant, responsive and resilient.
- Use whatever language, tools and frameworks you feel comfortable to.
- Briefly elaborate on your solution, architecture details, choice of patterns and frameworks.

--- 

## Design

For this version, the design was based on default iOS 11 style, without any additional assets. There are two screens, and we will called then Scenes:

### Search Scene

![Search Scene Image](http://...)

#### Structure

This scene is composed by a simple Navigation Bar with a Refresh Button and a collapsable search bar. Bellow this you can see the Twitter User cell, showing the user name, profile picture and profile description.

#### Behaviors

On the first user, you will be propted with a Twitter login webview. After providing your credentials, the app will show your friends.

On this screen you can perform searches and get the results as you type. The list hearder will present the last term searched.

By selecting one listed user, you will forwarded to **Tweets Scene**.

#### Improvements

- For this scene, I would remove the Twitter login prompt transfering it to a previous scene, that will be called Login Scene. 
- I would improve the **loading state** by replacing the activity indicator by [Skeleton Views](). 
- There is no empty state on this screen, and it could be shown when search takes no results. 
- The refresh button could be replaced by the table view's pull to refresh behavior.
- While the profile picture doesn't load, a placeholder image could be shown.
- A pagination mechanism could be implemented. When the user reaches the bottom of page, more Twitter users could be shown.
- The alert error could be replaced by a ViewController embeded View. It's more discrete than presenting an alert for simple messages.
- The app is universal, and the navigation style is a simple master-detail. For better iPad usability, a Split View Controller could be implemented.

### Tweets Scene

![Tweeter Scene Image](http://...)

#### Structure

This scene is composed by a simple Navigation Bar with a Refresh Button. The title is the selected user Screen Name/Mention. Bellow this you can see the Tweet cells, showing the tweet, creation date, a sentimental emoji, and a sentimental view on the left side.

#### Behaviors

When the screen opens, the user's tweets will be shown. The tweet emoji will react according to tweet's sentiment (happy: 😃, neutral: 😐, sad:😔). The sentiment view has similar behavior than emojis, when the tweet is happy, presents the green color, when neutral, grey, when sad, then red.

#### Improvements

- I would improve the **loading state** by replacing the activity indicator by [Skeleton Views](https://github.com/Juanpe/SkeletonView). 
- There is no empty state on this screen, and it could be shown when search takes no results. 
- The refresh button could be replaced by the table view's pull to refresh behavior.
- A pagination mechanism could be implemented. When the user reaches the bottom of page, more Tweets should be shown.
- The alert error could be replaced by a ViewController embeded View. It's more discrete than presenting an alert for simple messages.
- The date was not formatted. It could be converted to an user friendly format.

## Architecture

The app was developed using the [Uncle Bob Clean Architecture](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html) concept. This Swift aproach was inpired by the [Kotlin Android Clean Architecture Boilerplate](https://github.com/bufferapp/android-clean-architecture-boilerplate).

Motivated by code reuse and build improvements, the app was divided in packages (Dynamic Frameworks). Wich one with it's responsibility

WIP


