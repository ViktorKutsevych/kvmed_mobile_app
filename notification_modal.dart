import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'notification_modal_model.dart';
export 'notification_modal_model.dart';

class NotificationModalWidget extends StatefulWidget {
  const NotificationModalWidget({
    super.key,
    required this.medicationData,
  });

  final MedicationRecordStruct? medicationData;

  @override
  State<NotificationModalWidget> createState() =>
      _NotificationModalWidgetState();
}

class _NotificationModalWidgetState extends State<NotificationModalWidget> {
  late NotificationModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: Color(0xFF133BF2),
                  size: 24,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    'Час приймати ліки!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 18,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: 48,
                    height: 48,
                    child: custom_widgets.DynamicMedIcon(
                      width: 48,
                      height: 48,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.medicationData?.name,
                    'Назва ліків',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 17,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Text(
                '${widget!.medicationData?.dose?.toString()} ${widget!.medicationData?.typeIcon}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().isNotificationOpen = false;
                        safeSetState(() {});
                        FFAppState().addToArchiveList(MedicationRecordStruct(
                          name: widget!.medicationData?.name,
                          typeIcon: widget!.medicationData?.typeIcon,
                          dose: widget!.medicationData?.dose,
                          status: 'Прийнято',
                          timeOfDay: widget!.medicationData?.timeOfDay,
                          exactTime: getCurrentTimestamp,
                          mealTiming: widget!.medicationData?.mealTiming,
                          dateTaken: getCurrentTimestamp,
                        ));
                        safeSetState(() {});
                        FFAppState()
                            .removeFromMyMedications(widget!.medicationData!);
                        safeSetState(() {});
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xEDCEF4C5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 1, 2, 1),
                              child: Icon(
                                Icons.done_outlined,
                                color: Color(0xFF036203),
                                size: 20,
                              ),
                            ),
                            Text(
                              'Прийняти',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF036203),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().isNotificationOpen = false;
                        safeSetState(() {});
                        FFAppState().addToArchiveList(MedicationRecordStruct(
                          name: widget!.medicationData?.name,
                          typeIcon: widget!.medicationData?.typeIcon,
                          dose: widget!.medicationData?.dose,
                          status: 'Відкладено',
                          timeOfDay: widget!.medicationData?.timeOfDay,
                          mealTiming: widget!.medicationData?.mealTiming,
                          exactTime: widget!.medicationData?.exactTime,
                          dateTaken: widget!.medicationData?.dateTaken,
                        ));
                        safeSetState(() {});
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 105,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xEDF0ECB4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 1, 2, 1),
                              child: Icon(
                                Icons.access_time,
                                color: Color(0xFFCE8516),
                                size: 20,
                              ),
                            ),
                            Text(
                              'Відкласти',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFCE8516),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().isNotificationOpen = false;
                        safeSetState(() {});
                        FFAppState().addToArchiveList(MedicationRecordStruct(
                          name: widget!.medicationData?.name,
                          typeIcon: widget!.medicationData?.typeIcon,
                          dose: widget!.medicationData?.dose,
                          status: 'Пропущено',
                          timeOfDay: widget!.medicationData?.timeOfDay,
                          dateTaken: getCurrentTimestamp,
                          mealTiming: widget!.medicationData?.mealTiming,
                        ));
                        safeSetState(() {});
                        FFAppState()
                            .removeFromMyMedications(widget!.medicationData!);
                        safeSetState(() {});
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 112,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xEDF68C8C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 1, 2, 1),
                              child: Icon(
                                Icons.close_sharp,
                                color: Color(0xFFB21010),
                                size: 20,
                              ),
                            ),
                            Text(
                              'Пропустити',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFFB21010),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
