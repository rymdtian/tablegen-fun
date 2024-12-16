class FibonacciIter<int a, int b, int n> {
    int Value = !if(!eq(n, 0), b,
        FibonacciIter<b, !add(a, b), !sub(n, 1)>.Value
    );
}

class Fibonacci<int n> : FibonacciIter<0, 1, !sub(n, 1)>;
