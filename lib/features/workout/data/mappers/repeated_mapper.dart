import '../../domain/entities/repeated.dart';
import '../models/workout_dto.dart';

extension RepeatedDtoX on RepeatedDto {
  Repeated toDomain() {
    return Repeated(
      id: id,
      weight: weight,
      reps: reps,
      seconds: seconds,
    );
  }
}

extension RepeatedX on Repeated {
  RepeatedDto toDto() {
    return RepeatedDto(
      id: id,
      weight: weight,
      reps: reps,
      seconds: seconds,
    );
  }
}