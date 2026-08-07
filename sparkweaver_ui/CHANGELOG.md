## 0.3.1

* `FcAppDrawer` now accepts two optional parameters that let the user-name region act as an entry point to a profile or edit-name flow:
  * `onUserNameTap`: when non-null, the name area becomes tappable with an ink ripple and invokes this callback.
  * `userNameTrailing`: when non-null, the widget is rendered to the right of the name with a small gap. Typical use is a subtle edit-pencil icon as an affordance hint. Independent of `onUserNameTap`, so it can also serve as a non-tappable status badge.
* Both parameters default to `null`, so existing call sites are unaffected.

## 0.0.1

* TODO: Describe initial release.
