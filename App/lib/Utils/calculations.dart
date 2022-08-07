import 'dart:math';

double calculateIMC(double talla, double peso) {
  var result = peso / (pow(talla, 2));
  num mod = pow(10.0, 2);
  return ((result * mod).round().toDouble() / mod);
}

double calculatePercentilIMC(double imc) {
  if (imc == 0) {
    return 0;
  } else if (imc <= 18.9) {
    return 90;
  } else if (imc <= 24.9) {
    return 70;
  } else if (imc <= 29.9) {
    return 40;
  } else if (imc <= 34.9) {
    return 30;
  } else if (imc <= 39.9) {
    return 20;
  } else if (imc <= 40) {
    return 10;
  } else {
    return 0.5;
  }
}

String calculateIMCResultado(double imc) {
  if (imc == 0) {
    return "";
  } else if (imc <= 18.5) {
    return "BAJO";
  } else if (imc <= 24.9) {
    return "NORMAL";
  } else if (imc <= 29.9) {
    return "SOBREPESO";
  } else if (imc <= 34.9) {
    return "OBESIDAD 1";
  } else if (imc <= 39.9) {
    return "OBESIDAD 2";
  } else {
    return "OBESIDAD 3";
  }
}

double calculatePercentilGrasa(double grasa) {
  if (grasa == 0) {
    return 0;
  } else if (grasa <= 7) {
    return 90;
  } else if (grasa <= 9.3) {
    return 80;
  } else if (grasa <= 11.7) {
    return 70;
  } else if (grasa <= 14) {
    return 60;
  } else if (grasa <= 15.8) {
    return 50;
  } else if (grasa <= 17.3) {
    return 40;
  } else {
    return 30;
  }
}

String calculateGrasaResultado(double grasa) {
  if (grasa == 0) {
    return "";
  } else if (grasa <= 7) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (grasa <= 9.3) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (grasa <= 11.7) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (grasa <= 14) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (grasa <= 15.8) {
    return "PROMEDIO";
  } else if (grasa <= 17.3) {
    return "PROMEDIO";
  } else if (grasa <= 19.4) {
    return "POR DEBAJO DEL PROMEDIO";
  } else {
    return "POR DEBAJO DEL PROMEDIO";
  }
}

double calculatePercentilAbdominales(double perAbdominal) {
  if (perAbdominal == 0) {
    return 0;
  } else if (perAbdominal <= 89) {
    return 90;
  } else {
    return 10;
  }
}

String calculateAbdominalesResultado(double perAbdominal) {
  if (perAbdominal == 0) {
    return "";
  } else if (perAbdominal <= 89) {
    return "BAJO RIESGO CARDIOVASCULAR";
  } else {
    return "ALTO RIESGO CARDIOVASCULAR";
  }
}

double calculateIAC(double perAbdominal, double talla) {
  var result = perAbdominal / (pow(talla, 1.5));
  result = result - 18;
  num mod = pow(10.0, 2);
  return ((result * mod).round().toDouble() / mod);
}

String calculateClasificacionIAC(double perAbdominal) {
  if (perAbdominal == 0) {
    return "";
  } else if (perAbdominal <= 26) {
    return "BAJO RIESGO CARDIOVASCULAR";
  } else {
    return "ALTO RIESGO CARDIOVASCULAR";
  }
}

double calculatePercentilVo2Max(double vo2Max) {
  if (vo2Max == 0) {
    return 0;
  } else if (vo2Max >= 54.1) {
    return 90;
  } else if (vo2Max >= 48.2) {
    return 80;
  } else if (vo2Max >= 46.8) {
    return 70;
  } else if (vo2Max >= 44.2) {
    return 60;
  } else if (vo2Max >= 42.5) {
    return 50;
  } else if (vo2Max >= 41) {
    return 40;
  } else if (vo2Max >= 40.9) {
    return 20;
  } else {
    return 10;
  }
}

String calculateVo2MaxResultado(double vo2Max) {
  if (vo2Max == 0) {
    return "";
  } else if (vo2Max >= 54.1) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (vo2Max >= 48.2) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (vo2Max >= 46.8) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (vo2Max >= 44.2) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (vo2Max >= 42.5) {
    return "PROMEDIO";
  } else if (vo2Max >= 41) {
    return "PROMEDIO";
  } else if (vo2Max >= 40.9) {
    return "POR DEBAJO DEL PROMEDIO";
  } else {
    return "POR DEBAJO DEL PROMEDIO";
  }
}

double calculatePercentilAbdo(double fAbdo) {
  if (fAbdo == 0) {
    return 0;
  } else if (fAbdo >= 25) {
    return 90;
  } else if (fAbdo >= 24) {
    return 80;
  } else if (fAbdo >= 22) {
    return 70;
  } else if (fAbdo >= 21) {
    return 60;
  } else if (fAbdo >= 20) {
    return 50;
  } else if (fAbdo >= 16) {
    return 40;
  } else if (fAbdo >= 15) {
    return 30;
  } else {
    return 10;
  }
}

String calculateAbdoResultado(double fAbdo) {
  if (fAbdo == 0) {
    return "";
  } else if (fAbdo >= 25) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (fAbdo >= 24) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (fAbdo >= 22) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (fAbdo >= 21) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (fAbdo >= 20) {
    return "PROMEDIO";
  } else if (fAbdo >= 16) {
    return "PROMEDIO";
  } else if (fAbdo >= 15) {
    return "POR DEBAJO DEL PROMEDIO";
  } else {
    return "10";
  }
}

double calculatePercentilFBrazos(double fBrazos) {
  if (fBrazos == 0) {
    return 0;
  } else if (fBrazos >= 38) {
    return 90;
  } else if (fBrazos >= 37) {
    return 80;
  } else if (fBrazos >= 36) {
    return 70;
  } else if (fBrazos >= 35) {
    return 60;
  } else if (fBrazos >= 34) {
    return 50;
  } else if (fBrazos >= 28) {
    return 40;
  } else if (fBrazos >= 22) {
    return 20;
  } else {
    return 10;
  }
}

String calculateFBrazosResultado(double fBrazos) {
  if (fBrazos == 0) {
    return "";
  } else if (fBrazos >= 38) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (fBrazos >= 37) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (fBrazos >= 36) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (fBrazos >= 35) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (fBrazos >= 34) {
    return "PROMEDIO";
  } else if (fBrazos >= 28) {
    return "PROMEDIO";
  } else if (fBrazos >= 22) {
    return "POR DEBAJO DEL PROMEDIO";
  } else {
    return "POR DEBAJO DEL PROMEDIO";
  }
}

double calculatePercentilSitAndReach(double sitAndReach) {
  if (sitAndReach == 0) {
    return 0;
  } else if (sitAndReach >= 40) {
    return 90;
  } else if (sitAndReach >= 39) {
    return 80;
  } else if (sitAndReach >= 38) {
    return 70;
  } else if (sitAndReach >= 35) {
    return 60;
  } else if (sitAndReach >= 34) {
    return 50;
  } else if (sitAndReach >= 31) {
    return 40;
  } else if (sitAndReach >= 30) {
    return 32;
  } else {
    return 31;
  }
}

String calculateSitAndReachResultado(double sitAndReach) {
  if (sitAndReach == 0) {
    return "";
  } else if (sitAndReach >= 40) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (sitAndReach >= 39) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (sitAndReach >= 38) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (sitAndReach >= 35) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (sitAndReach >= 34) {
    return "PROMEDIO";
  } else if (sitAndReach >= 31) {
    return "PROMEDIO";
  } else if (sitAndReach >= 30) {
    return "POR DEBAJO DEL PROMEDIO";
  } else {
    return "POR DEBAJO DEL PROMEDIO";
  }
}

double calculateTotal(double suma) {
  var result = suma / 7;
  num mod = pow(10.0, 2);
  return ((result * mod).round().toDouble() / mod);
}

String calculateTotalResultado(double total) {
  if (total == 0) {
    return "";
  } else if (total >= 90) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (total >= 80) {
    return "MUY POR ARRIBA DEL PROMEDIO";
  } else if (total >= 70) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (total >= 60) {
    return "POR ARRIBA DEL PROMEDIO";
  } else if (total >= 50) {
    return "PROMEDIO";
  } else if (total >= 40) {
    return "PROMEDIO";
  } else if (total >= 30) {
    return "POR DEBAJO DEL PROMEDIO";
  } else {
    return "POR DEBAJO DEL PROMEDIO";
  }
}
