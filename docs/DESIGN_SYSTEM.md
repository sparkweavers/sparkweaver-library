# Design System & Components

Complete reference for the Flashcard UI design system and component library.

## Design System

### Colors (`FlashcardColors`)

**Primary Colors**
- `primary`, `primaryLight`, `primaryDark`, `primaryVariant`
- `secondary`, `secondaryLight`, `secondaryDark`, `secondaryVariant`

**Semantic Colors**
- `success`, `successLight`, `successDark`
- `error`, `errorLight`, `errorDark`
- `warning`, `warningLight`, `warningDark`
- `info`, `infoLight`, `infoDark`

**Neutral Grays**
- `gray50` to `gray900`

**Text Colors**
- `textPrimary`, `textSecondary`, `textDisabled`, `textHint`

**Backgrounds**
- `backgroundLight`, `backgroundDark`, `surface`, `surfaceVariant`

**Chat-Specific**
- `userMessageBg`, `aiMessageBg`, `userAvatarBg`, `aiAvatarBg`

**Opacity Helpers**
- `primary10`, `primary20`, `primary30`, `gray10`, `gray20`, `gray30`

### Typography (`FlashcardTypography`)

**Display Styles**
- `displayLarge` (48px), `displayMedium` (36px), `displaySmall` (32px)

**Headings**
- `heading1` (28px) to `heading6` (14px)

**Body Text**
- `bodyLarge` (16px), `bodyMedium` (14px), `bodySmall` (12px)

**Labels**
- `labelLarge`, `labelMedium`, `labelSmall`

**Special**
- `caption`, `button`, `code`, `link`, `overline`
- `chatUser`, `chatAi`, `badge`

### Spacing (`FlashcardSpacing`)

**Scale**
- `xs` (4px), `sm` (8px), `md` (12px), `lg` (16px), `xl` (24px), `xxl` (32px)

**EdgeInsets**
- `edgeInsetsXs` to `edgeInsetsXxl`
- `horizontalSm` to `horizontalXl`
- `verticalSm` to `verticalXl`

**SizedBox**
- `verticalSpaceXs` to `verticalSpaceXxl`
- `horizontalSpaceXs` to `horizontalSpaceXxl`

**Component-Specific**
- `pagePaddingInsets`, `cardPaddingInsets`, `buttonPaddingInsets`
- `chatBubblePadding`, `badgePadding`

### Tokens (`FlashcardTokens`)

**Border Radius**
- `radiusXs` (2px) to `radiusFull` (9999px)
- `borderRadiusSm` to `borderRadiusFull`
- Component: `buttonRadius`, `cardRadius`, `chatBubbleRadius`, etc.

**Shadows**
- `shadowSm`, `shadowMd`, `shadowLg`, `shadowXl`

**Elevation**
- `elevationNone` to `elevationXxxl` (0-24dp)

**Icons & Avatars**
- `iconXs` (12px) to `iconXxxl` (64px)
- `avatarXs` (16px) to `avatarXxxl` (96px)

**Animation**
- Durations: `durationFast` to `durationVerySlow`
- Curves: `curveLinear`, `curveEase`, `curveBounce`, etc.

## Components

### FcAvatar

Reusable avatar component for user and AI representations.

**Basic Usage:**
```dart
// User avatar
FcAvatar.user()

// AI avatar
FcAvatar.ai()

// Custom size
FcAvatar.user(size: FcAvatarSizes.lg)
```

**Variants:**
```dart
FcAvatarVariants.user()
FcAvatarVariants.userSmall()
FcAvatarVariants.userLarge()
FcAvatarVariants.ai()
FcAvatarVariants.aiSmall()
FcAvatarVariants.aiLarge()

// Custom avatar
FcAvatarVariants.custom(
  icon: Icons.star,
  backgroundColor: Colors.purple,
  iconColor: Colors.white,
  size: 40,
)
```

**Parameters:**
- `icon` (required): Icon to display
- `backgroundColor` (required): Avatar background color
- `iconColor` (required): Icon color
- `size`: Avatar size (default: 32px)

**Available Sizes:**
- `FcAvatarSizes.xs` (16px)
- `FcAvatarSizes.sm` (24px)
- `FcAvatarSizes.md` (32px) - Default
- `FcAvatarSizes.lg` (40px)
- `FcAvatarSizes.xl` (48px)
- `FcAvatarSizes.xxl` (64px)
- `FcAvatarSizes.xxxl` (96px)

### FcBadge

Reusable badge component for labeled content.

**Basic Usage:**
```dart
FcBadge(text: 'Label', icon: Icons.star)
```

**Variants:**
```dart
FcBadgeVariants.primary(text: 'Primary')
FcBadgeVariants.success(text: 'Success')
FcBadgeVariants.warning(text: 'Warning')
FcBadgeVariants.error(text: 'Error')
FcBadgeVariants.info(text: 'Info')
FcBadgeVariants.neutral(text: 'Neutral')
FcBadgeVariants.file(filename: 'document.pdf')
```

**Parameters:**
- `text` (required): Badge text
- `icon`: Optional icon
- `backgroundColor`: Custom background color
- `borderColor`: Custom border color
- `foregroundColor`: Text and icon color
- `iconSize`: Custom icon size
- `padding`: Custom padding

### FcChatBubble

Chat bubble for conversation interfaces.

**Basic Usage:**
```dart
FcChatBubble(
  message: 'Hello!',
  isUser: true,
)
```

**With File References:**
```dart
FcChatBubble(
  message: 'Information from files...',
  isUser: false,
  referencedFiles: ['file1.pdf', 'file2.txt'],
)
```

**Variants:**
```dart
FcChatBubbleVariants.user(message: 'Hello')
FcChatBubbleVariants.ai(
  message: 'Response',
  referencedFiles: ['file.pdf'],
)
FcChatBubbleVariants.typing(isUser: false)
```

**Parameters:**
- `message` (required): Message text
- `isUser` (required): User (true) or AI (false)
- `isTyping`: Shows italic style
- `referencedFiles`: List of filenames
- `avatar`: Custom avatar widget
- `messageStyle`: Custom text style
- `backgroundColor`: Custom background
- `borderColor`: Custom border

## Examples

**Full Chat Interface:**
```dart
ListView(
  children: [
    FcChatBubbleVariants.user(message: 'Question?'),
    FcChatBubbleVariants.ai(
      message: 'Answer from files:',
      referencedFiles: ['doc.pdf'],
    ),
  ],
)
```

**Badge List:**
```dart
Wrap(
  spacing: 8,
  children: [
    FcBadgeVariants.file(filename: 'notes.pdf'),
    FcBadgeVariants.file(filename: 'slides.pptx'),
    FcBadgeVariants.success(text: 'Uploaded'),
  ],
)
```

**Using Design System:**
```dart
Container(
  padding: FlashcardSpacing.edgeInsetsLg,
  decoration: BoxDecoration(
    color: FlashcardColors.surface,
    borderRadius: FlashcardTokens.cardRadius,
    boxShadow: FlashcardTokens.shadowMd,
  ),
  child: Text(
    'Card Content',
    style: FlashcardTypography.bodyMedium,
  ),
)
```
