import 'package:flutter_test/flutter_test.dart';
import 'package:fundamental_app/moduls/testing/provider/done_module_provider.dart';

void main() {
  group('Provider Test', () {
    test('should contain new item when module complete', () {
      // arrange
      var doneModuleProvider = DoneModuleProvider();
      var testModuleName = 'Test Module';
      doneModuleProvider.complete(testModuleName);
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(result, true);
    });

    test('should remove item', () {
      // arrange
      var doneModuleProvider = DoneModuleProvider();
      var testModuleName = 'Test Module Remove';
      doneModuleProvider.remove(testModuleName);
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);
      expect(result, false);
    });
  });
}
