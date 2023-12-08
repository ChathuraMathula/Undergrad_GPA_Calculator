enum Grade {
  pending(text: "Pending", point: 0.00),
  aPlus(text: "A+", point: 4.00),
  a(text: "A", point: 4.00),
  aMinus(text: "A-", point: 3.70),
  bPlus(text: "B+", point: 3.30),
  b(text: "B", point: 3.00),
  bMinus(text: "B-", point: 2.70),
  cPlus(text: "C+", point: 2.30),
  c(text: "C", point: 2.00),
  cMinus(text: "C-", point: 1.70),
  d(text: "D", point: 1.00),
  dPlus(text: "D+", point: 1.30),
  e(text: "E", point: 0.00);

  const Grade({
    required this.text,
    required this.point,
  });

  final String text;
  final double point;
}
