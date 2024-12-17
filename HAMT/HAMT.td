/* -------------------------------------------------------------------------- */
/*                                   HAMT.td                                  */
/*                       Integer Hash Array Mapped Trie                       */
/* -------------------------------------------------------------------------- */

/* -------------------------- branching factor: 32 -------------------------- */
/* ---------------------------- bits per level: 5 --------------------------- */
/* -------------------------------- depth: 13 ------------------------------- */

/* -------------------------------------------------------------------------- */
/*                            Bit Utility Functions                           */
/* -------------------------------------------------------------------------- */

class set<int n, int index> {
    int Value = !or(n, !shl(1, index));
}

class clear<int n, int index> {
    int N = n;
    int Value = !and(n, !xor(!shl(1, index), -1));
}

class popcount<int n, int count = 0> {
    int Value = !if(
        !eq(n, 0),
        count,
        popcount<
            !and(n, !sub(n, 1)),
            !add(count, 1)
        >.Value
    );
}

/* -------------------------------------------------------------------------- */
/*                            HAMT Global Variables                           */
/* -------------------------------------------------------------------------- */
defvar BIT_WIDTH = 5;
defvar BIT_MASK = !sub(!shl(1, BIT_WIDTH), 1);

/* -------------------------------------------------------------------------- */
/*                           HAMT Utility Functions                           */
/* -------------------------------------------------------------------------- */

class childPosition<bits<32> bitmap, int index> {
    int Value = popcount<!and(bitmap, !sub(!shl(1, index), 1))>.Value;    
}

class hashCode<int n> {
    int Value = n;
}

/* -------------------------------------------------------------------------- */
/*                              Node Definitions                              */
/* -------------------------------------------------------------------------- */

class Leaf<int key, int value> {
    int Key = key;
    int Value = value;
}

class Node<bits<32> bitmap = 0, list<Node> children = [], list<Leaf> leafChildren = []> {
    bits<32> Bitmap = bitmap;
    list<Node> Children = children;
    list<Leaf> LeafChildren = leafChildren;
    bit IsLeaf = !not(!empty(LeafChildren));

    assert !or(!not(IsLeaf), !empty(Children)), "Leaf nodes cannot have children";
}
