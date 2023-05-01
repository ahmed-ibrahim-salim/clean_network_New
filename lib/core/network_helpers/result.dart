import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

// creating a Result type like Swift 'Resutl<Data, Error>'
@freezed
class Result<T, E extends Exception> with _$Result<T, E> {
  const factory Result.success(T data) = _Success;
  const factory Result.failure(E error) = _Failure;
}
