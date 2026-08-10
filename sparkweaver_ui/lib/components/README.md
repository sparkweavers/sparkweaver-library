# Components Directory - Atomic Design Structure

This directory organizes components using **Atomic Design** principles for scalability and maintainability.

## Atomic Design Hierarchy

### Atoms (`atoms/`)
**Smallest, indivisible UI elements**

Single-purpose components that cannot be broken down further.

**Current components:**
- `fc_avatar.dart` - Avatar for user and AI representations
- `fc_badge.dart` - Badge for labels and tags

**Characteristics:**
- No child components from this library
- Single, focused responsibility
- Highly reusable
- No business logic

**Examples of future atoms:**
- Buttons
- Icons
- Text components
- Input fields
- Loading spinners

### Molecules (`molecules/`)
**Simple combinations of atoms**

Groups of atoms that work together as a unit.

**Current components:**
- `fc_chat_bubble.dart` - Message bubble with avatar and file badges

**Characteristics:**
- Composed of 2-3 atoms
- Single, clear purpose
- Reusable across contexts
- No complex logic

**Examples of future molecules:**
- Search bar (input + icon)
- Card header (avatar + title + subtitle)
- Form field (label + input + error message)
- Menu item (icon + text)

### Organisms (`organisms/`)
**Complex UI sections**

Substantial sections of the interface composed of molecules and atoms.

**Future components:**
- Chat conversation list
- File upload panel
- Navigation bar
- User profile section
- Settings panel

**Characteristics:**
- Composed of molecules and/or atoms
- Represents distinct UI sections
- May contain some state management
- More specific to use case

### Templates (`templates/`)
**Page-level layouts**

Page structures that arrange organisms into layouts.

**Future components:**
- Chat screen layout
- Settings page layout
- Dashboard layout
- Authentication page layout

**Characteristics:**
- Composition of organisms
- Defines page structure
- Focus on layout, not data
- Reusable page patterns

## Component Naming

All components are prefixed with `Fc`:
- `FcBadge` - Atom
- `FcChatBubble` - Molecule
- `FcConversationList` - Organism (future)
- `FcChatLayout` - Template (future)

## Creating New Components

1. **Determine atomic level:**
   - Can it be broken down? → Not an atom
   - Composed of 2-3 atoms? → Molecule
   - Complex UI section? → Organism
   - Page layout? → Template

2. **Create in correct directory:**
   ```
   lib/components/atoms/fc_your_component.dart
   lib/components/molecules/fc_your_component.dart
   lib/components/organisms/fc_your_component.dart
   lib/components/templates/fc_your_component.dart
   ```

3. **Export from `components.dart`:**
   ```dart
   export 'atoms/fc_your_component.dart';
   ```

4. **Use design system exclusively:**
   - Import: `../../design_system/...dart`
   - Use tokens, not magic numbers

5. **Follow SOLID principles:**
   - Single responsibility
   - Open for extension (variants)
   - Type-safe parameters

## Import Structure

```dart
// For atoms
import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/tokens.dart';
import '../../design_system/typography.dart';

// For molecules (can import atoms)
import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../atoms/fc_badge.dart';

// For organisms (can import atoms and molecules)
import '../atoms/fc_badge.dart';
import '../molecules/fc_chat_bubble.dart';
```

## Benefits of Atomic Design

✅ **Scalability:** Easy to add new components at any level
✅ **Reusability:** Components compose naturally
✅ **Maintainability:** Clear hierarchy and dependencies
✅ **Testability:** Test atoms, then molecules, then organisms
✅ **Documentation:** Natural organization for Widgetbook
✅ **Collaboration:** Clear where new components belong

## References

- [Atomic Design by Brad Frost](https://atomicdesign.bradfrost.com/)
- [CLAUDE.md](../../../CLAUDE.md) - Development guidelines
