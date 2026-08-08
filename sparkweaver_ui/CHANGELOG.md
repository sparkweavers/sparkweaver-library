## Unreleased

* `FcResultsQuestion` gains a new optional `selectedAnswerText` field, rendered as a `Your answer: ...` line in the error/destructive color for incorrect multiple-choice rows, distinct from the existing neutral-colored `userAnswer` line used by free-text rows.

## 2.0.0

* **BREAKING**: renamed the package from `flashcard_ui` to `sparkweaver_ui` (#10).
* Fixed `FcOpenAnswerCard` to use `FcInputField` for themed multiline input (#9).

## 0.4.0

* `FcChatBubble` renders multiple-choice options as tappable chips (#7).
* Added a batch of new components: flip card, MC card, open-answer card, self-rating, results screen, chat overlay.
* `FcResultsScreen` now shows the reference answer on correct rows too, so group-study users can see the right answer without flipping back.
* Refactored the shared markdown stylesheet used across components.
* Renamed the repository from `flashcard-component-library` to `sparkweaver-library`.

## 0.3.2

* Toggle password visibility (#6).

## 0.3.1

* `FcAppDrawer` now accepts two optional parameters that let the user-name region act as an entry point to a profile or edit-name flow:
  * `onUserNameTap`: when non-null, the name area becomes tappable with an ink ripple and invokes this callback.
  * `userNameTrailing`: when non-null, the widget is rendered to the right of the name with a small gap. Typical use is a subtle edit-pencil icon as an affordance hint. Independent of `onUserNameTap`, so it can also serve as a non-tappable status badge.
* Both parameters default to `null`, so existing call sites are unaffected.

## 0.0.1

* TODO: Describe initial release.
