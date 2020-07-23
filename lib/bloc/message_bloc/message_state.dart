import 'package:bloc_sample/message.dart';
import 'package:equatable/equatable.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  const MessageInitial();

  @override
  List<Object> get props => [];
}

class MessageLoadInProgress extends MessageState {
  const MessageLoadInProgress();

  @override
  List<Object> get props => [];
}

class MessageLoadSucces extends MessageState {
  final Message message;
  const MessageLoadSucces(this.message);

  @override
  List<Object> get props => [message];
}

class MessageError extends MessageState {
  final String message;
  const MessageError(this.message);
  
  @override
  List<Object> get props => [message];
}