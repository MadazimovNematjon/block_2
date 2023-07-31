import 'package:equatable/equatable.dart';

abstract class CreateState  extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CreateInit extends CreateState{

}


class CreateLoading extends CreateState{


}

class CreateLoaded extends CreateState{

  final bool? isCreated;
  CreateLoaded({this.isCreated});
}

class CreateError extends CreateState{
  final error;
  CreateError({this.error});
}