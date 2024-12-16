include "FizzBuzz.td"

class Tester<int In, list<string> Expected> {
    list<string> Actual = FizzBuzz<In>.Out;

    string ExpectedString = !interleave(Expected, ",");
    string ActualString   = !interleave(Actual, ",");

    assert
        !eq(ActualString, ExpectedString),
        "FizzBuzz " # NAME #
        " FAILED:\n" #
        "Expected: " # ExpectedString #
        ", Actual: " # ActualString;
}

def Test1 : Tester<3,  ["1","2","Fizz"]>;
def Test2 : Tester<5,  ["1","2","Fizz","4","Buzz"]>;
def Test3 : Tester<15, ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]>;
