part of 'cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeRemoveNoteState extends HomeState {}
final class HomeAddNoteState extends HomeState {}