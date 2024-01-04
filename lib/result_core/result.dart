// sealed class Result<T> {
//   factory Result.success(T data) = Success; // 성공
//
//   factory Result.error(Exception e) = Error; // 실패
//
//   factory Result.loading() = Loading; //  로딩
// }
//
//
// class Success<T> implements Result<T> {
//   // 성공시 데이터를 보여줘
//   final T data;
//
//   Success(this.data);
// }
//
// class Error<T> implements Result<T> {
//   //실패시 에러 보여줘
//   final Exception e;
//
//   Error(this.e);
// }
//
// class Loading<T> implements Result<T> {
//   Loading();
// }
//
// void main() {
//   // 잘 나오는지 확인
//   Result<int> result = getResult(true);
//
//   switch(result) {
//   //  숫자면 성공
//     case Success<int>():
//       print(result.data);
//   // 다이얼로그 표시
//     case Error<int>():
//       print(result.e.toString());
//   // 로딩
//     case Loading<int>():
//
//   }
// }
//
//
//
// Result<int> getResult(bool value) {
//   // 1 은 성공 숫자가 아니면 로딩 기호 아니면 에러를 보여줘
//   try {
//     if (value) {
//       return Result.success(1);
//     } else {
//       return Result.loading();
//     }
//   } catch (e){
//     return Result.error(Exception('오류가 났다. '));
//   }
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

// 프리지드 는 사용하면 위와 코드 가 같다.
@freezed
sealed class Result<T> with _$Result<T> {
   const factory Result.success(T data) = Success;
   const factory Result.error(Exception e) = Error;
   const factory Result.loading() = Loading;
}


void main() {
  // 잘 나오는지 확인
  Result<int> result = getResult(true);

  switch(result) {
  //  숫자면 성공
    case Success<int>():
      print(result.data);
  // 다이얼로그 표시
    case Error<int>():
      print(result.e.toString());
  // 로딩
    case Loading<int>():

  }
}



Result<int> getResult(bool value) {
  // 1 은 성공 숫자가 아니면 로딩 기호 아니면 에러를 보여줘
  try {
    if (value) {
      return Result.success(1);
    } else {
      return Result.loading();
    }
  } catch (e){
    return Result.error(Exception('오류가 났다. '));
  }
}