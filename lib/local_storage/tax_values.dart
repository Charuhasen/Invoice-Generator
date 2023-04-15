import 'package:hive_flutter/hive_flutter.dart';

class TAXValues {
  //Reference box
  final localStorage = Hive.box('local_data');

  void setNHL(double nhlValue) {
    localStorage.put("NHL_Value", nhlValue);
  }

  Future<double> getNHL() async {
    double nhlValue;
    nhlValue = await localStorage.get("NHL_Value");
    return nhlValue;
  }

  void setGetFundLevy(double getFundLevy) {
    localStorage.put("Get_Fund_Levy_Value", getFundLevy);
  }

  Future<double> getGetFundLevy() async {
    double getFundLevy;
    getFundLevy = await localStorage.get("Get_Fund_Levy_Value");
    return getFundLevy;
  }

  void setCovidLevy(double covidLevy) {
    localStorage.put("Covid_Value", covidLevy);
  }

  Future<double> getCovidLevy() async {
    double covidLevy;
    covidLevy = await localStorage.get("Covid_Value");
    return covidLevy;
  }

  void setVAT(double vat) {
    localStorage.put("VAT_Value", vat);
  }

  Future<double> getVAT() async {
    double vatValue;
    vatValue = await localStorage.get("VAT_Value");
    return vatValue;
  }
}
