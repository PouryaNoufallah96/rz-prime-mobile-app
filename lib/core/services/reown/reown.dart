import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gainx/core/env.dart';
import 'package:reown_appkit/reown_appkit.dart';

class ReownService {
  ReownService() {
    _onModalConnectController = StreamController.broadcast();
    _onModalDisconnectController = StreamController.broadcast();
    _onModalErrorController = StreamController.broadcast();
    _onModalNetworkChangeController = StreamController.broadcast();
    _onModalUpdateController = StreamController.broadcast();
    _onSessionEventEventController = StreamController.broadcast();
    _onSessionExpireEventController = StreamController.broadcast();
    _onSessionUpdateEventController = StreamController.broadcast();
  }

  late final StreamController<ModalConnect> _onModalConnectController;
  late final StreamController<ModalDisconnect> _onModalDisconnectController;
  late final StreamController<ModalError> _onModalErrorController;
  late final StreamController<ModalNetworkChange>
      _onModalNetworkChangeController;
  late final StreamController<ModalConnect> _onModalUpdateController;
  late final StreamController<SessionEvent> _onSessionEventEventController;
  late final StreamController<SessionExpire> _onSessionExpireEventController;
  late final StreamController<SessionUpdate> _onSessionUpdateEventController;

  late ReownAppKitModal _reownAppKitModal;
  late ReownAppKit _appKit;

  void call(BuildContext context) {
    _appKit = ReownAppKit(
      core: ReownCore(
        projectId: Env.reownProjectId,
      ),
      metadata: const PairingMetadata(
        name: 'name',
        description: 'description',
      ),
    );

    _reownAppKitModal = ReownAppKitModal(
      context: context,
      projectId: Env.reownProjectId,
    );
  }

  Future<void> init() async {
    await _reownAppKitModal.init();

    _reownAppKitModal.onModalConnect
      ..subscribeStream(_onModalConnectController.sink)
      ..broadcast();

    _reownAppKitModal.onModalDisconnect
      ..subscribeStream(_onModalDisconnectController.sink)
      ..broadcast();

    _reownAppKitModal.onModalError
      ..subscribeStream(_onModalErrorController.sink)
      ..broadcast();

    _reownAppKitModal.onModalNetworkChange
      ..subscribeStream(_onModalNetworkChangeController.sink)
      ..broadcast();

    _reownAppKitModal.onModalUpdate
      ..subscribeStream(_onModalUpdateController.sink)
      ..broadcast();

    _reownAppKitModal.onSessionEventEvent
      ..subscribeStream(_onSessionEventEventController.sink)
      ..broadcast();

    _reownAppKitModal.onSessionExpireEvent
      ..subscribeStream(_onSessionExpireEventController.sink)
      ..broadcast();

    _reownAppKitModal.onSessionUpdateEvent
      ..subscribeStream(_onSessionUpdateEventController.sink)
      ..broadcast();
  }
}
