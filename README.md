# Ujian Flutter — UI + Deploy + Git

A Flutter app implementing:
- Material 3 theme using `ColorScheme.fromSeed` seeded by last digit of NIM (fixed mapping table).
- Onboarding splash with 3 pages and pager dots.
- Sign In screen matching the provided mock.
- NIM is displayed in the UI for verification.

## Setup

1) Ensure Flutter SDK (3.22+ recommended) is installed.
2) From this folder run:
```bash
flutter pub get
flutter run
```

If you created the repo without platform folders, you can add them with:
```bash
flutter create .
```

## Configure NIM
Edit `lib/src/config/app_config.dart`:
```dart
const String appNim = '1234556';
```
The theme seed color updates automatically from the last digit:
- 0 → `Colors.indigo`
- 1 → `Colors.teal`
- 2 → `Colors.deepOrange`
- 3 → `Colors.blueGrey`
- 4 → `Colors.amber`
- 5 → `Colors.pink`
- 6 → `Colors.cyan`
- 7 → `Colors.deepPurple`
- 8 → `Colors.green`
- 9 → `Colors.red`

## Screens
- Onboarding (3 slides) → Continue/Get Started → Sign In
- Sign In page with email, password visibility toggle, forgot password, Google button, and sign-up link.

## Folder Structure
- `lib/main.dart` — App entry, Material 3 theme
- `lib/src/theme/seed_theme.dart` — NIM → seed color mapping
- `lib/src/routes/app_router.dart` — Routes
- `lib/src/screens/` — Onboarding and Sign In
- `lib/src/config/app_config.dart` — NIM value

## Notes
- Assets folder is included for future use; UI uses Material icons and colors to match the mock.

## Build APK Tanpa Install Flutter (GitHub Actions)
Jika kamu pemula dan ingin langsung dapat file APK jadi:

1. Buat repository GitHub baru (public/private bebas).
2. Upload seluruh isi folder proyek ini ke repo tersebut (pastikan struktur tetap sama).
3. Setelah push ke branch `main`/`master`, buka tab "Actions" di repo GitHub-mu.
4. Workflow bernama "Build Android APK" akan berjalan otomatis. Tunggu hingga statusnya "success".
5. Masuk ke job terakhir → bagian "Artifacts" → download `app-release-apk`.
6. Di dalamnya ada `app-release.apk`. Pindahkan ke HP dan install.

Catatan:
- Jika mengganti NIM di `lib/src/config/app_config.dart`, commit & push lagi agar workflow membangun APK terbaru dengan tema warna yang sesuai.

