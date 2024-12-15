class FibonacciIter<int a, int b, int n> {
    int Value = !if(!eq(n, 0), b,
        FibonacciIter<b, !add(a, b), !sub(n, 1)>.Value
    );
}

class Fibonacci<int n> : FibonacciIter<0, 1, !sub(n, 1)>;

class Tester<int N, int Expected> {
    int Actual = Fibonacci<N>.Value;
    assert !eq(Expected, Actual),
    "Calculated wrong value for " # N # "th Fibonacci number. " #
    "Expected: " # Expected # ", Actual: " # Actual;
}

def Test : Tester<47, 2971215073>;
