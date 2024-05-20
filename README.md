This Todo App is built using Flutter and implements the Bloc pattern for state management. The app allows users to create, manage, and organize tasks efficiently with features like categorizing tasks as new, finished, or archived. The user interface is designed with both light and dark themes to provide a seamless user experience regardless of the time of day or lighting conditions.

Features:
Task Management:

Create Tasks: Users can add new tasks with details such as title, date, and time.
Update Tasks: Tasks can be updated to mark them as finished or archived.
Delete Tasks: Swipe to delete tasks from the list.
Theming:

Light Theme: A clean, bright theme for use during the day.
Dark Theme: A dark theme for comfortable use at night.
Theme Toggle: Users can switch between light and dark themes using a toggle switch in the app bar.
Navigation:

Bottom Navigation Bar: Easy navigation between the Tasks, Finished, and Archived screens using a bottom navigation bar.
Responsive Design:

The app is responsive and adapts to different screen sizes and orientations, ensuring a smooth user experience on both mobile phones and tablets.
Animations:

Smooth animations for opening and closing the bottom sheet used for adding or editing tasks.
Implementation Details:
State Management:

The app uses the Bloc pattern for state management, ensuring a clear separation of concerns and making the app scalable and maintainable.
Database Integration:

The app uses the sqflite package to handle local storage, enabling offline functionality and persistence of tasks.
Conditional Builder:

The conditional_builder_null_safety package is used to handle conditional rendering, ensuring the UI reacts appropriately to different states of the app.
Custom Widgets:

The app is structured with reusable custom widgets for different components like the app bar, bottom navigation bar, floating action button, and task items, promoting code reusability and readability.
Code Structure:
Cubit:

Handles the business logic and state management, including database operations like creating, reading, updating, and deleting tasks.
Screens:

HomeLayout: The main layout of the app that includes the app bar, bottom navigation bar, and a body that switches between different task screens.
TaskScreen, FinishedScreen, ArchivedScreen: Screens that display tasks based on their status.
Widgets:

TaskBuilder: A reusable widget that builds the task list.
BuildAppBar, BuildBottomNavBar, BuildFloatingActionButton: Widgets for constructing the app's navigation and action components.
Themes:

LightTheme, DarkTheme: Functions that define the light and dark themes used in the app, including primary colors, text styles, and other UI elements.
This Todo App provides a robust foundation for task management with a clean UI and efficient state management, making it an excellent tool for users to organize their tasks and enhance productivity.
