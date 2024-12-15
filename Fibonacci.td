class Fibonacci<int n> {
    int Value = !if(!or(!eq(n, 0), !eq(n, 1)), n, !add(Fibonacci<!add(n, -2)>.Value, Fibonacci<!add(n, -1)>.Value));
}

class Tester<int N, int Expected> {
    int Actual = Fibonacci<N>.Value;
    assert !eq(Expected, Actual),
    "Calculated wrong value for " # N # "th Fibonacci number. " #
    "Expected: " # Expected # ", Actual: " # Actual;
}

def Test : Tester<47, 2971215073>;
