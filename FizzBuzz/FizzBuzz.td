class FizzBuzzIter<list<string> out, int n, int In> {
    defvar divisible3 = !eq(!sub(n, !mul(3, !div(n, 3))), 0);
    defvar divisible5 = !eq(!sub(n, !mul(5, !div(n, 5))), 0);

    list<string> next = !cond(
        !and(divisible3, divisible5) : ["FizzBuzz"],
        divisible3 : ["Fizz"],
        divisible5 : ["Buzz"],
        true : [!cast<string>(n)]
    );

    list<string> Out = !if(
        !eq(n, In),
        !listconcat(out, next),
        FizzBuzzIter<!listconcat(out, next), !add(n, 1), In>.Out
    );
}

class FizzBuzz<int In> : FizzBuzzIter<[], 1, In>;
