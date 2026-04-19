import 'package:testtask/core/colors/color_palette.dart';
import 'package:testtask/features/domain/entities/mood_entity.dart';
import 'package:testtask/gen/assets.gen.dart';

class Constant {
  Constant._();
  static final Constant _instance = Constant._();
  factory Constant.instance() => _instance;

final moods = [
  Mood(label: "Calm", color: ColorPalette.lavender, face: Assets.images.calm.path),
  Mood(label: "Happy", color: ColorPalette.orange, face: Assets.images.happy.path),
  Mood(label: "Excited", color: ColorPalette.azureBlue, face: Assets.images.peaceful.path),
];

  final List<String> icons = [
    Assets.images.calm.path,
    Assets.images.content.path,
    Assets.images.peaceful.path,
    Assets.images.happy.path,
  ];
   final List<String> names = [
    'Calm',
    'Content',
    'Peaceful',
    'Happy',
  ];

}
