// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shuffle_view_model_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShufListState on ShuffleListVM, Store {
  final _$statusAtom = Atom(name: 'ShuffleListVM.status');

  @override
  ListStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ListStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$userListAtom = Atom(name: 'ShuffleListVM.userList');

  @override
  List<ShuffleViewModel> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<ShuffleViewModel> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$fetchUserAsyncAction = AsyncAction('ShuffleListVM.fetchUser');

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  @override
  String toString() {
    return '''
status: ${status},
userList: ${userList}
    ''';
  }
}
