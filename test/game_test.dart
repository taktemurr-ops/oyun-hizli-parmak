import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hizli_parmak/oyun_hizli_parmak.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hizliParmakConfig.title.length, 33);
    expect(hizliParmakConfig.tagline.length, 33);
    for (final s in hizliParmakConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hizliParmakConfig.gameId, hizliParmakId);
    expect(hizliParmakRules.gameId, hizliParmakId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hizliParmakRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hizliParmakId, optionalMechanics: hizliParmakRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hizliParmakRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
