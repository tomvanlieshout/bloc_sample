import 'package:equatable/equatable.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class ChangeMessage extends MessageEvent {
  final String message;

  const ChangeMessage(this.message);

  @override
  List<Object> get props => [message];
}