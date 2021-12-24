import 'package:jubilant_couscous/web/app/data/environments/development_environment.dart';
import 'package:jubilant_couscous/web/app/data/environments/production_environment.dart';

class DefaultService {
  static var environment = DevelopmentEnvironment()??ProductionEnvironment();
  static String serviceImageUrl = environment.serviceImageUrl!;
  static String serviceUrl = environment.serviceUrl!;
  static String serviceTerms = environment.serviceTerms!;
}
