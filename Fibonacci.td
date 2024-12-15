class Fibonacci<int n> {
    int N = !if(!or(!eq(n, 0), !eq(n, 1)), n, !add(Fibonacci<!add(n, -2)>.N, Fibonacci<!add(n, -1)>.N));
}

def Main : Fibonacci<47>;