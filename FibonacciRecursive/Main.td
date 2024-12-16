include "FibonacciRecursive/FibonacciRecursive.td"

class Tester<int N, int Expected> {
    int Actual = Fibonacci<N>.Value;
    assert !eq(Expected, Actual),
    NAME # " FAILED:\n"
    "Calculated wrong value for " # N # "th Fibonacci number. " #
    "Expected: " # Expected # ", Actual: " # Actual;
}

def Test1 : Tester<47, 2971215073>;
def Test2 : Tester<92, 7540113804746346429>;
