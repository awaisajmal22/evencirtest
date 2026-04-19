Dependencies Used & Why
flutter_svg: For rendering SVG images and icons.
bloc: For scalable state management using the BLoC pattern.
flutter_bloc: Flutter bindings for the bloc package, making it easy to use BLoC in widgets.
get_it: Service locator for dependency injection.
intl: For internationalization and formatting dates/numbers.
sleek_circular_slider: For the custom circular slider UI.
flutter_gen: For code generation of assets (images, fonts, etc.).
cupertino_icons: Provides iOS-style icons.
build_runner & flutter_gen_runner (dev): For code generation.

Project Structure
lib/
core/: App-wide core utilities and base code.
colors/: Color palette and theme definitions.
constant/: App constants and static values.
dependency_injecction/: Service locator and dependency injection setup.
extensions/: Dart and Flutter extension methods.
navigation/: Route and navigation management.
features/: Feature-based structure for modularity.
data/: Data sources, repositories, and models.
domain/: Business logic, entities, and use cases.
presentation/: UI widgets, screens, and BLoC/view logic.
gen/: Generated files (e.g., assets, fonts) by flutter_gen.
main.dart: App entry point and root widget.
