abstract class CarState {}

class CarInitialState extends CarState {}

class GetAllAvailableCarsLoadingState extends CarState {}

class GetAllAvailableCarsSuccessState extends CarState {}

class GetAllAvailableCarsErrorState extends CarState {}

class PaginationState extends CarState {}
