# news-now

NewsNow is an iOS app that displays news and users from JSONPlaceholder public API, using SwiftUI and Google Maps SDK.

## Project Architecture
Adopting Clean Architecture principles, the idea is to follow a separation of concerns by defining layers as:
- Presentation
- Data

The Presentation layer employs the MVVM (Model-View-ViewModel) architechtural pattern:

- Model: Represents the structures ('Post','User') fetched from a remote API
- View: SwiftUI-based views, responsible for UI rendering
- ViewModel: Manages presentation logic and data flow

The Data layer has:
- Repository: manages data access and abstracts the data source implementation details.
- Data Source: responsible for fetching data from Api and parsing the response

### Project structure

- NewsNowApp: entry point of the App
- AppDelegate: initialization configuration and setup of Google Maps SDK
- HomeTabScreen: Main screen of the app, containing 'NewsView' and 'UsersView' as its tabs
- NewsView: shows posts and allows to filter by title or content. Tapping on a cell displays the full post and some details.
- UsersView: shows all users. Tapping on a cell displays a map with the location of that user.

