class BmiCalculator {
  double getBmiFor(int weight, int height) {
    return (weight / height / height) * 10000;
  }
}
