import 'package:leach/features/profile/data/profile_remote_data_source.dart';
import 'package:leach/features/profile/domain/use_case/report_user_uc.dart';

abstract class ReportUserEventBase {}


class ReportUserEvent extends ReportUserEventBase {
final   ReportParameter reportParameter;
  ReportUserEvent(this.reportParameter);
}
