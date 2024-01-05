import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_event.freezed.dart';

@freezed
abstract class MainEvent<T> with _$MainEvent<T> {
  const factory MainEvent.showSnackBar(String message) = ShowSnackBar;
  const factory MainEvent.showDialog(String message) = ShowDialog;
}