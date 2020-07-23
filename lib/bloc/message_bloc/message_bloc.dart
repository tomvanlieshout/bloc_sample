import 'package:bloc/bloc.dart';
import 'package:bloc_sample/message.dart';
import '../bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitial());

  // the method that takes in events and outputs state in a stream
  // this method will be expanded once more features/api calls are added
  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    yield MessageLoadInProgress();
    if (event is ChangeMessage) {
      try {
        yield MessageLoadSucces(Message(event.message));
      } on Error {
        // TODO: proper error handling here.
        yield MessageError("Something went wrong.");
      }
    }
  }
}
