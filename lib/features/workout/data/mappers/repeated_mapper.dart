import '../../domain/entities/repeated.dart';
import '../models/workout_dto.dart';

extension RepeatedDtoX on RepeatedDto {
  Repeated toDomain() {
    return Repeated(
      id: id,
      weight: weight,
    );
  }
}