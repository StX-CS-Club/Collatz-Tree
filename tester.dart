final Set<int> proven = {1};
int n = 2;

Future<void> main() async {
  final DateTime start = DateTime.now();
  while (true) {
    final List<int> chain = [];
    int i = n;
    while (!proven.contains(i)) {
      chain.add(i);
      i = ((i & 1) == 0) ? i ~/ 2 : 3 * i + 1;
    }
    if (n % 1000 == 0) {
      print(
        "Proven Conjecture up to n = $n @ ${DateTime.now().difference(start).inMilliseconds} ms",
      );
    }
    proven.addAll(chain);
    n++;
    await Future.delayed(Duration(milliseconds: 1));
  }
}
