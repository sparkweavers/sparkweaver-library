# Claude Code Instructions for sparkweaver-library

## Project Purpose

A reusable Flutter UI component library with a complete design system for Flashcard applications. Provides consistent, type-safe components following industry best practices.

## Core Principles (Non-Negotiable)

### SOLID Principles

**1. Single Responsibility Principle (SRP)**
- Each component has ONE clear purpose
- Design system files are separated by concern (colors, typography, spacing, tokens)
- Components handle ONLY UI rendering, no business logic

**2. Open/Closed Principle (OCP)**
- Components are open for extension through parameters
- Closed for modification through variants (FcBadgeVariants, FcChatBubbleVariants)
- New use cases added via new variants, not modifying base components

**3. Liskov Substitution Principle (LSP)**
- Variant components are fully substitutable for base components
- All FcBadgeVariants return FcBadge instances
- Type contracts are never broken

**4. Interface Segregation Principle (ISP)**
- Components expose only relevant parameters
- Optional parameters for customization
- No forced dependencies on unused properties

**5. Dependency Inversion Principle (DIP)**
- Components depend on abstractions (parameters, not concrete implementations)
- Design system tokens are abstractions over raw values
- No hardcoded values in components

### DRY Principle (Don't Repeat Yourself)

**Design System Prevents Duplication:**
- Colors: Use `SparkweaverColors.primary` not `Color(0xFF7F28A8)`
- Spacing: Use `FlashcardSpacing.edgeInsetsLg` not `EdgeInsets.all(16)`
- Typography: Use `FlashcardTypography.heading1` not custom TextStyle
- Tokens: Use `FlashcardTokens.cardRadius` not `BorderRadius.circular(12)`

**Component Variants Prevent Duplication:**
- Common configurations become variants
- Example: `FcBadgeVariants.file()` instead of repeated badge configurations

## Atomic Design Principles

### Component Hierarchy

```
lib/components/
├── atoms/              # Smallest building blocks
│   ├── fc_badge.dart   # Single-purpose badge
│   └── ...
├── molecules/          # Simple combinations of atoms
│   ├── fc_chat_bubble.dart  # Message with avatar and badges
│   └── ...
├── organisms/          # Complex UI sections (future)
│   └── ...
└── templates/          # Page layouts (future)
    └── ...
```

**Atoms:**
- Single, indivisible UI elements
- No child components
- Examples: Badge, Button, Icon, Text styles

**Molecules:**
- Combinations of atoms
- Simple, reusable groups
- Examples: Chat bubble (avatar + text + badges), Input with label

**Organisms:**
- Complex UI sections
- May contain molecules and atoms
- Examples: Chat conversation list, File upload panel

**Templates:**
- Page-level layouts
- Composition of organisms
- Examples: Chat screen layout, Settings page layout

### Current Structure (Atomic Design Applied)

**Atoms:**
- `fc_badge.dart` - Single badge element

**Molecules:**
- `fc_chat_bubble.dart` - Avatar + message text + file badges

## File Organization Rules

### Design System (`lib/design_system/`)

**Each file has ONE responsibility:**
- `colors.dart` - Color palette only
- `typography.dart` - Text styles only
- `spacing.dart` - Spacing and padding only
- `tokens.dart` - Visual properties (radius, shadows, etc.)
- `design_system.dart` - Barrel export only

**Never:**
- Mix concerns (e.g., colors in typography.dart)
- Create circular dependencies
- Export implementation details

### Components (`lib/components/`)

**Structure by atomic level:**
```
components/
├── atoms/
│   └── fc_[name].dart
├── molecules/
│   └── fc_[name].dart
├── organisms/
│   └── fc_[name].dart
└── templates/
    └── fc_[name].dart
```

**Component File Rules:**
1. One component per file
2. Include variants in same file
3. Prefix all components with `Fc` (Flashcard)
4. Use design system tokens, never hardcoded values

### Widgetbook (`flashcard_ui_widgetbook/lib/usecases/`)

**One use case file per component:**
- `badge_usecases.dart` for FcBadge
- `chat_bubble_usecases.dart` for FcChatBubble

**Each file must demonstrate:**
- Default state
- All variants
- Edge cases
- Real-world examples

## Component Creation Checklist

When creating a new component:

- [ ] Determine atomic level (atom, molecule, organism, template)
- [ ] Place in correct directory (`components/atoms/`, etc.)
- [ ] Use design system tokens exclusively
- [ ] Create base component following SRP
- [ ] Create variants for common use cases (OCP)
- [ ] Add comprehensive documentation
- [ ] Create Widgetbook use cases
- [ ] Export from `sparkweaver_ui.dart`
- [ ] Write unit tests
- [ ] Verify `flutter analyze` passes
- [ ] Verify no hardcoded values

## Naming Conventions

**Components:**
- Base: `FcComponentName` (e.g., `FcBadge`, `FcButton`)
- Variants: `FcComponentNameVariants` (e.g., `FcBadgeVariants`)

**Design System:**
- Class: `FlashcardCategory` (e.g., `FlashcardColors`)
- Properties: `camelCase` (e.g., `primaryLight`, `edgeInsetsLg`)

**Files:**
- `snake_case.dart` (e.g., `fc_chat_bubble.dart`)
- Use cases: `component_name_usecases.dart`

**Constants:**
- `camelCase` for properties
- Prefix with category (e.g., `radiusLg`, `iconSm`)

## Anti-Patterns to Avoid

❌ **DON'T:**
- Use magic numbers: `Container(padding: EdgeInsets.all(16))`
- Hardcode colors: `color: Color(0xFF7F28A8)`
- Create god components (>200 lines, multiple responsibilities)
- Put business logic in components
- Mix atomic levels in same file
- Skip documentation
- Create variants in separate files

✅ **DO:**
- Use tokens: `Container(padding: FlashcardSpacing.edgeInsetsLg)`
- Use design system: `color: SparkweaverColors.primary`
- Keep components focused and small
- Separate UI from logic
- Organize by atomic design
- Document everything
- Group variants with base component

## Design System Extension

### Adding New Colors

```dart
// In colors.dart
static const Color newColor = Color(0xFFXXXXXX);
static const Color newColorLight = Color(0xFFXXXXXX);
static const Color newColorDark = Color(0xFFXXXXXX);
```

### Adding New Spacing

```dart
// In spacing.dart
static const double newSize = base * multiplier;
static const EdgeInsets newInsets = EdgeInsets.all(newSize);
```

### Adding New Tokens

```dart
// In tokens.dart
static const double newRadius = 20.0;
static const BorderRadius newBorderRadius = BorderRadius.all(Radius.circular(newRadius));
```

## Testing Requirements

**Unit Tests:**
- Design system values
- Component variants return correct types
- No magic numbers in components

**Widget Tests:**
- Component renders correctly
- Variants produce expected UI
- Parameters work as expected

**Golden Tests (Future):**
- Visual regression testing
- Component appearance consistency

## Widgetbook Requirements

**Every component needs:**
1. Default use case
2. All variant use cases
3. Edge case examples
4. Realistic usage examples
5. Interactive knobs for parameters (if applicable)

**Run after changes:**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Questions Before Committing

1. Does this follow the correct atomic design level?
2. Am I using design system tokens exclusively?
3. Is this component focused on ONE responsibility?
4. Can this be extended without modification?
5. Are variants in the same file as the base component?
6. Is there comprehensive documentation?
7. Are there Widgetbook use cases?
8. Did I avoid magic numbers and hardcoded values?
9. Does `flutter analyze` pass?
10. Are all tests passing?

If ANY answer is "no", refactor before committing.

## Development Workflow

1. **Design:** Determine atomic level and component purpose
2. **Create:** Build component using design system
3. **Document:** Add comprehensive inline documentation
4. **Showcase:** Create Widgetbook use cases
5. **Test:** Write unit tests
6. **Verify:** Run analyze and tests
7. **Export:** Add to `sparkweaver_ui.dart`
8. **Review:** Check against this file's principles

## Key Principle

> Every line of code should have a clear purpose, follow SOLID/DRY principles, and use the design system exclusively.

## Package Structure Rules

**sparkweaver_ui (Core Library):**
- No dependencies on other packages (except Flutter)
- Pure UI components only
- Design system only
- No business logic
- No state management
- No API calls

**flashcard_ui_widgetbook (Showcase):**
- Depends on sparkweaver_ui
- Only for development and documentation
- Never imported by consuming apps

## Remember

- **Consistency** over cleverness
- **Simplicity** over complexity
- **Reusability** over one-off solutions
- **Design system** over hardcoded values
- **Documentation** over assumptions

Built for the Flashcard ecosystem with ❤️
