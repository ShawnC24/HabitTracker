


# HabitFlow Tutorial: A Firebase-Integrated Habit Tracker App in Flutter

## 1. Overview
HabitFlow is a Flutter app designed to help users build better habits through tracking, social accountability, and reminders. It allows users to:
- Create and manage habits.
- Set habit goals, frequencies, and reminders.
- Share habits with friends.
- View friends and accept friend requests.
- Track habit progress over time.

### Key Screens:
- Welcome Screen: Introduction with navigation to login or registration.
- Registration and Login Screens: Firebase Authentication integration.
- Habit Home: Displays habits with progress tracking.
- Add Habit: Form to create custom habits.
- Friend List: View and manage friends.
- Profile: View and update account information.

## 2. Getting Started
### Prerequisites:
- Install Flutter SDK.
- Set up Android Studio or Visual Studio Code.
- Create a Firebase Project.
- Install Firebase CLI:
  ```sh
  npm install -g firebase-tools
  ```

### Dependencies:
Add these dependencies to `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.12.0
  firebase_auth: ^4.7.2
  cloud_firestore: ^4.5.1
  provider: ^6.1.4
  go_router: ^9.1.1
  flutter_local_notifications: ^9.7.0
```

### Firebase Configuration:
- Add `google-services.json` to the `android/app` directory.
- Add `Info.plist` to the `ios/Runner` directory.
- Enable Authentication (Email/Password) and Firestore Database in Firebase Console.

## 3. Firestore Setup
### Step 1: Create Collections

#### Users:
**Collection Name**: `users`

**Fields**:
- `email` (String)
- `display_name` (String)
- `photo_url` (String)
- `uid` (String)
- `friends` (Array)
- `friendRequest` (Array)

#### Habits:
**Collection Name**: `habits`

**Fields**:
- `name` (String)
- `description` (String)
- `frequency` (String)
- `reminderTime` (Timestamp)
- `goal` (String)
- `uid` (String)

#### Friends:
**Collection Name**: `friends`

**Fields**:
- `user1_id` (String)
- `user2_id` (String)
- `timestamp` (Timestamp)

#### Shared Habits:
**Collection Name**: `sharedHabit`

**Fields**:
- `habit_id` (String)
- `receiverId` (String)
- `sendId` (String)

## 4. Step-by-Step Coding Instructions
### 4.1 Welcome Screen
#### UI:
- Gradient background.
- Navigation to login or registration screens.

#### Code (`welcome_widget.dart`):
```
FFButtonWidget(
  onPressed: () async {
    context.pushNamed('reg');
  },
  text: 'Get Started',
  options: FFButtonOptions(
    width: double.infinity,
    height: 60.0,
    color: Colors.white,
  ),
),
```

### 4.2 Registration Screen
#### Firebase Integration:
- Save user information in `users` collection.

#### Code (`reg_widget.dart`):
```
final user = await authManager.createAccountWithEmail(
  context,
  emailController.text,
  passwordController.text,
);
if (user != null) {
  await UsersRecord.collection.doc(user.uid).set({
    'email': emailController.text,
    'display_name': displayNameController.text,
    'uid': user.uid,
  });
  context.goNamedAuth('HabitHome', context.mounted);
}
```

### 4.3 Login Screen
#### Firebase Authentication:
- Log users in and fetch their profile.

#### Code (`login_widget.dart`):
```
final user = await authManager.signInWithEmail(
  context,
  emailController.text,
  passwordController.text,
);
if (user != null) {
  context.goNamedAuth('HabitHome', context.mounted);
}
```

### 4.4 Habit Home
#### Habit Display:
- Query habits from Firestore using the `uid` field.

#### Code (`habit_home_widget.dart`):
```
StreamBuilder<List<HabitsRecord>>(
  stream: queryHabitsRecord(
    queryBuilder: (habits) => habits.where('uid', isEqualTo: currentUser.uid),
  ),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    final habits = snapshot.data!;
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return ListTile(
          title: Text(habit.name),
          subtitle: Text(habit.description),
        );
      },
    );
  },
),
```

### 4.5 Add Habit
#### Firestore Write:
- Save habit details in the `habits` collection.

#### Code (`addahabit_widget.dart`):
```
await HabitsRecord.collection.add({
  'name': nameController.text,
  'description': descriptionController.text,
  'frequency': selectedFrequency,
  'reminderTime': reminderTime,
  'uid': currentUser.uid,
  'goal': goalController.text,
});
```

### 4.6 Friend List
#### Display Friends:
- Query friends from the `users` and `friends` collections.

#### Code (`friend_list_widget.dart`):
```
StreamBuilder<List<UsersRecord>>(
  stream: queryUsersRecord(
    queryBuilder: (users) => users.where(
      FieldPath.documentId,
      whereIn: currentUser.friends,
    ),
  ),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    final friends = snapshot.data!;
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final friend = friends[index];
        return ListTile(
          title: Text(friend.displayName),
          subtitle: Text(friend.email),
        );
      },
    );
  },
),
```

### 4.7 Profile
#### Display User Details:
- Fetch user data from the `users` collection.

#### Code (`profile_widget.dart`):
```dart
AuthUserStreamWidget(
  builder: (context) => Column(
    children: [
      Text(currentUser.displayName),
      Text(currentUser.email),
    ],
  ),
),
```
### 4.8 Edit Profile

#### **Purpose**
The Edit Profile screen enables users to update their profile information in Firestore, including:
- Display name.
- Email address.
- Profile picture.

---

#### **UI Highlights**
- A circular profile picture that users can tap to upload a new image.
- Two text fields for display name and email address.
- A "Save Changes" button that confirms the updates.

---

#### **Firestore Integration**
- **Collection**: `users`
- **Fields Updated**:
  - `email`
  - `display_name`
  - `photo_url` (if profile picture is updated).

---

#### **Step-by-Step Code Breakdown**

**1. Updating Firestore Data**
The `Save Changes` button triggers an update to the current user’s document in the `users` collection.

- **Key Code** (`edit_profile_widget.dart`):
  ```dart
  await currentUserReference!.update(createUsersRecordData(
    email: _model.textController2.text,
    displayName: _model.textController1.text,
  ));
  ```

- **Explanation**:
  - `currentUserReference` is the reference to the current user document.
  - `createUsersRecordData` maps the updated data to Firestore.

---

**2. Handling Profile Picture Upload**
Users can tap the circular image to upload a new profile picture. The file is validated and saved locally before being stored in Firestore.

- **Key Code**:
  ```dart
  final selectedMedia = await selectMedia(
    mediaSource: MediaSource.photoGallery,
    multiImage: false,
  );
  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
    var selectedUploadedFiles = selectedMedia.map((m) => FFUploadedFile(
      name: m.storagePath.split('/').last,
      bytes: m.bytes,
    )).toList();
    if (selectedUploadedFiles.isNotEmpty) {
      setState(() {
        _model.uploadedLocalFile = selectedUploadedFiles.first;
      });
    }
  }
  ```

- **Explanation**:
  - `selectMedia` opens the photo gallery for the user to select an image.
  - The image is validated for format and stored temporarily.

---

**3. UI for Text Fields and Buttons**
The UI includes:
- A circular profile image with a border.
- Text fields for editing the display name and email.
- A button to save changes.

- **Key Code**:
  ```dart
  TextFormField(
    controller: _model.textController1,
    decoration: InputDecoration(labelText: 'Display Name'),
  ),
  TextFormField(
    controller: _model.textController2,
    decoration: InputDecoration(labelText: 'Email'),
  ),
  FFButtonWidget(
    onPressed: () async {
      // Save updated profile information
    },
    text: 'Save Changes',
  ),
  ```

- **Explanation**:
  - The text fields use controllers (`textController1` and `textController2`) for data binding.
  - The button updates Firestore with the new data.

---

### How It Integrates
The **Edit Profile** page is accessible from the Profile page. The saved changes update the user’s document in Firestore and redirect back to the Profile page.



## 5. Further Discussion
### Alternative Features:
- Push notifications for reminders using `flutter_local_notifications`.
- Advanced analytics for habit tracking.

### Next Steps:
- Adding group challenges or leaderboards.

## 6. See Also
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Firestore Database](https://firebase.google.com/docs/firestore)
- [Flutter Documentation](https://flutter.dev/docs)
```



