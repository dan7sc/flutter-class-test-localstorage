import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/modules/home/home_controller.dart';

void main() {
  group('HomeController increment', () {
    test('Should increment', () async {
      // Arrange - initialization
      late HomeController controller = HomeController(onUpdate: () {});

      // Act - action
      controller.increment();

      // Assert - validation
      expect(controller.countModel.value, 1);
    });

    test('Should increment multiple times', () async {
      // Arrange - initialization
      late HomeController controller = HomeController(onUpdate: () {});

      // Act - action
      controller.increment();
      controller.increment();
      controller.increment();

      // Assert - validation
      expect(controller.countModel.value, 3);
    });
  });

  test('Should stop loading after getCount ', () async {
    // Arrange - initialization
    late HomeController controller = HomeController(onUpdate: () {});

    // Act - action
    await controller.getCount();

    // Assert - validation
    expect(controller.isLoading, true);
  });
}
