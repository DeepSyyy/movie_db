# Building a Clean Architecture Flutter App with OMDB API and Provider State Management

In this example, we're creating a Flutter application following the principles of clean architecture. The application will interact with the OMDB API to fetch movie search results, and we'll manage the state using the Provider package.

# Project Structure:
We've organized the project into distinct layers to adhere to clean architecture principles:

```
/lib
|-- business
|   |-- entities
|   |-- usecase
|   |-- repository
|-- data
|   |-- model
|   |-- datasource
|   |-- repository
|-- presentation
|   |-- page
|   |-- provider
|   |-- widget
```

- **business**: Contains entities, use cases, and repositories related to your business logic.
  - **entities**: Definitions of core business entities.
  - **usecase**: Implementation of use cases or business logic.
  - **repository**: Interfaces or abstract classes for data access.

- **data**: Deals with data-related concerns such as models, data sources, and repositories.
  - **model**: Data models or DTOs (Data Transfer Objects).
  - **datasource**: Classes responsible for fetching data from different sources (APIs, databases, etc.).
  - **repository**: Concrete implementations of data repositories.

- **presentation**: Focuses on the UI and user interaction.
  - **page**: Flutter pages or screens.
  - **provider**: State management providers.
  - **widget**: Reusable UI components.
