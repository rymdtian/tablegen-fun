class Fibonacci<int n> {
    int Value = !if(!or(!eq(n, 0), !eq(n, 1)), n, !add(Fibonacci<!add(n, -2)>.Value, Fibonacci<!add(n, -1)>.Value));
}
