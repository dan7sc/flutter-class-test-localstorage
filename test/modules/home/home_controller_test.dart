import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/modules/home/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('HomeController increment', () {
    test('Should increment', () async {
      // Arrange - initialization
      late HomeController controller = HomeController(onUpdate: () {});

      SharedPreferences.setMockInitialValues({'count': ''});

      // Act - action
      controller.increment();

      // Assert - validation
      expect(controller.countModel.value, 1);
    });

    test('Should increment multiple times', () async {
      // Arrange - initialization
      late HomeController controller = HomeController(onUpdate: () {});

      SharedPreferences.setMockInitialValues({'count': ''});

      // Act - action
      controller.increment();
      controller.increment();
      controller.increment();

      // Assert - validation
      expect(controller.countModel.value, 3);
    });
  });

  test('Should stop loading after getCount', () async {
    // Arrange - initialization
    late HomeController controller = HomeController(onUpdate: () {});

    SharedPreferences.setMockInitialValues({'count': '{"value": 10}'});

    // Act - action
    await controller.getCount();

    // Assert - validation
    expect(controller.isLoading, false);
  });

  test('Should get count from local storage', () async {
    // Arrange - initialization
    late HomeController controller = HomeController(onUpdate: () {});

    SharedPreferences.setMockInitialValues({'count': '{"value": 10}'});

    // Act - action
    await controller.getCount();

    // Assert - validation
    expect(controller.countModel.value, 10);
  });
}
