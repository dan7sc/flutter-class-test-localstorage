import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/modules/home/home_controller.dart';

void main() {
  test('HomeController should increment', () async {
    // Arrange - initialization
    late HomeController controller = HomeController(onUpdate: () {});

    // Act - action
    controller.increment();

    // Assert - validation
    expect(controller.countModel.value, 2);
  });
}
