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

![Login](https://github.com/willwfsp/ifood-mobile-test/blob/master/Images/Login.png =50x)
![Friends](https://github.com/willwfsp/ifood-mobile-test/blob/master/Images/Friends.png =50x)
![Search](https://github.com/willwfsp/ifood-mobile-test/blob/master/Images/Search.png =50x)

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

![Search](https://github.com/willwfsp/ifood-mobile-test/blob/master/Images/Tweets.png)

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

### External Dependencies

The [CocoaPods](https://cocoapods.org/) was choose was dependency manager because it more faster and provide automatic project configuration. But the build time increases. The cocoapods was the best choice for this moment.

### Dependency Injection

This architecture provide scalability and was designed to suport dependency injections. All modules are agnostic and its dependencies can be injected to reproduce any environment you want. The dependency injection was resolved by usign Swinject framework

### Testing

At the begining of project, an TDD was started, but due to the short time its was cancelled. Yes, the tests is always the first to fall 😔.

### Presentation

On the presentation layer, the [Clean Swift VIP, by Raymond Law](https://clean-swift.com/) was choose. Some apdats was done. The Worker and DataSource was replaced by the Uncle Bob UseCases and so on. This VIP aproach provide a better testability and manutenibility for this app layer.

### Components

- Moya: REST easier
- TwitterKit: Provide an easy Twitter API consumption
- Swinject: Dependency Injection
- Reusable: TableViewCells and Custom Views with less code

### Improvements

- **Reactive Extensions**: As I used in only one project, I could lose a lot of development time, since I do not dominate the approach
- **LocalizableStrings**: As the first release will only suport english language, and its contains few strings, I omitted it.
- **Constants**: Some constants was created, but could be created for Identifiers, Localizables and all literals in the app.
- **Testing**: The code should have 100% test coverage
- **Persistency**: The tweets already classified by Google Natural Language should be stored. It will save internet consumption, request time for the user, and avoid some billings on the Google Cloud Services.
- **Themes**: The app should be designed suporting diferent color themes.
- **Build Configuration**: Diferent Build Configurations should be set.
- **My English**: It's been almost 3 years since I quit teaching English. I've never been fluent, but I've been better. I going to back to the classes this semester, urgently!!

## Considetations

This test was quite challenging due to my short time available, but it was pleasurable. I really enjoyed the hiring process. Please keep open mided, growing and offering this great experience of using the application and the services.

🍕 Thank you all 🍔

 



