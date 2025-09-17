List<List<Step>> result = [
  [Step("1")],
];

void main() async {
  for (int i = 0; i < 18; i++) {
    List<int> ignore = [];
    for (int e = 0; e < result.length; e++) {
      if (!ignore.contains(e)) {
        final Step step = result[e][i * 2];

        final int value = step.intValue();
        result[e].add(Step("-"));
        result[e].add(Step((value * 2).toString()));

        if ((value - 1) % 3 == 0 && value != 1 && value != 4) {
          result.insert(e + 1, []);

          for (int n = 0; n < i * 2 + 1; n++) {
            result[e + 1].add(Step(" "));
          }

          result[e + 1].add(Step("L"));
          result[e + 1].add(Step(((value - 1) / 3).toString()));

          ignore.add(e + 1);
        }
      }
    }
  }

  List<int> maxLengths = [];
  for (int i = 0; i < result[0].length; i++) {
    maxLengths.add(1);
    for (int e = 0; e < result.length; e++) {
      if (result[e][i].value.length > maxLengths[i]) {
        maxLengths[i] = result[e][i].value.length;
      }

      if (e != 0) {
        if (result[e][i].value == "L") {
          int n = 1;
          while (result[e - n][i].value != "-") {
            result[e - n][i].value = "|";
            n++;
          }
        }
      }
    }
  }

  for (int i = 0; i < result.length; i++) {
    String text = "";
    for (int e = 0; e < result[0].length; e++) {
      final Step step = result[i][e];

      text = "$text ${" " * (maxLengths[e] - step.value.length)}${step.value}";
    }
    print(text);
  }
}

class Step {
  Step(this.value);

  String value;

  int intValue() {
    return int.tryParse(value) ?? 0;
  }
}
