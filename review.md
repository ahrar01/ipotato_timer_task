## Observations and Suggestions
* UI Looks good on resizeable windows, but does not completely reflect design on mobile sizes. Mostly, the dialog and cards look slightly bloated and are icnonsistent
* The decision to limit characters in task title is a poor one. As devs we should give users flexibility on data, and solve limited screen space cosmetically.
* I am still waiting for someone to use ColorScheme.fromSeed to generate the color scheme, other than that M3 theme declaration is on point
* There are integration tests. They could be more useful, but the fact that there are tests is good enough for this exercise.
* The case of one timer completing while another is already in completed state is handled beautifully
* Screens could be split into smaller widgets
* MVVM does not work with flutter. Including data inside screens folder does it make much sense?
* Calls stores as stores. ViewModels are a thing of the past, but it does not matter as much, we will help you leave it behind :-p
* Functionality is not stable, pause and stop button toggle is there, but not as in design, which toggles play and pause. This was weird and confusing
* Pause does not only


## Rubrics:
Faithful Repro of UI
Application of Flex
Material Widgets
Small Widget / Breaking UI
App-Level M3 Theme Declaration
Navigation Stack does not have memory Leak
Functions work as spec
Independent handling of Ambiguity
Application Layering
SOLID
Unidirectional Flow of Data
Some Modules have Unit Tests
Some Modules have Widget Tests
Well Managed Git History
Variables Have Descriptive Names
Dependency Injection for Widget and App Layers
Persistence with Hive/Drift
Mobx freezed provider getit
Driven integration test