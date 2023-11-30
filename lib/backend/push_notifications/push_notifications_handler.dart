import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/Medical_ScheduleApp_0.0.png',
              width: MediaQuery.sizeOf(context).width * 1.0,
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'loginPage': ParameterData.none(),
  'registerAccount': ParameterData.none(),
  'completeProfile': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'onboarding': ParameterData.none(),
  'createBudgetBegin': ParameterData.none(),
  'MY_Card': ParameterData.none(),
  'MY_Budgets': ParameterData.none(),
  'paymentDetails': (data) async => ParameterData(
        allParams: {
          'transactionDetails':
              getParameter<DocumentReference>(data, 'transactionDetails'),
          'userSpent': getParameter<DocumentReference>(data, 'userSpent'),
        },
      ),
  'MY_profilePage': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<DocumentReference>(data, 'userProfile'),
        },
      ),
  'budgetDetails': (data) async => ParameterData(
        allParams: {
          'budgetDetails':
              getParameter<DocumentReference>(data, 'budgetDetails'),
        },
      ),
  'transferComplete': ParameterData.none(),
  'transferFunds': ParameterData.none(),
  'requestFunds': ParameterData.none(),
  'createBudget': ParameterData.none(),
  'transaction_ADD': ParameterData.none(),
  'transaction_EDIT': (data) async => ParameterData(
        allParams: {
          'transactionDetails':
              getParameter<DocumentReference>(data, 'transactionDetails'),
        },
      ),
  'editProfile': (data) async => ParameterData(
        allParams: {
          'userProfile': getParameter<DocumentReference>(data, 'userProfile'),
        },
      ),
  'changePassword': ParameterData.none(),
  'notificationsSettings': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'tutorial_PROFILE': ParameterData.none(),
  'homePage': ParameterData.none(),
  'homePage_alt': ParameterData.none(),
  'homePage_alt_1': ParameterData.none(),
  'budget_DELETE': (data) async => ParameterData(
        allParams: {
          'budgetList': getParameter<DocumentReference>(data, 'budgetList'),
        },
      ),
  'profilepage': ParameterData.none(),
  'stats': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
