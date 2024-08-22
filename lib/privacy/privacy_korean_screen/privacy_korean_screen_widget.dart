import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'privacy_korean_screen_model.dart';
export 'privacy_korean_screen_model.dart';

class PrivacyKoreanScreenWidget extends StatefulWidget {
  const PrivacyKoreanScreenWidget({super.key});

  @override
  State<PrivacyKoreanScreenWidget> createState() =>
      _PrivacyKoreanScreenWidgetState();
}

class _PrivacyKoreanScreenWidgetState extends State<PrivacyKoreanScreenWidget> {
  late PrivacyKoreanScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyKoreanScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'lqsfbxap' /* Privacy Policy */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 800.0,
            ),
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9k7e03xc' /* < 위세너 >는 「개인정보 보호법」 제30조에 따라 정... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
