Parseltongue
============
A bytecode interpreter of a language where the code is written using Peano Numbers (written for PLT Games Turing Tar-Pit challenge)

Peano Numbers
------------
The [Peano numbers](http://en.wikipedia.org/wiki/Peano_axioms) are a simple logical way of defining Natural numbers.
A number is defined to be either zero, or a successor of another Peano number, thus
it will allow us to represent all natural numbers given (countably) infinite space.

In Parseltongue zero is represented using the character literal 'Z',
and any larger number, n, is represented as the character 'S' following a (n-1) 'S' and a Z.

__Examples__:
<table>
  <tr>
    <th>Natural Number</th>      <th>Peano Representation</th>
  </tr>
  <tr>
    <td>0</td> <td>Z</td>
  </tr>
  <tr>
    <td>1</td> <td>SZ</td>
  </tr>
  <tr>
    <td>2</td> <td>SSZ</td>
  </tr>
  <tr>
    <td>5</td> <td>SSSSSZ</td>
  </tr>
</table>


Instructions
------------
To allow computation Parseltongue allows the usage of 6 simple instructions.
These instructions allow the simulation of a universal Turing Machine,
and in that regards this language can be considered [Turing-complete](http://en.wikipedia.org/wiki/Turing-complete).

__Table of Instructions__:
<table>
  <tr>
    <th>Instruction (followed by operands)</th>   <th>Parseltongue Representation</th> <th>Explanation</th>
  </tr>
  <tr>
    <td>New</td> <td>Z</td> <td>Creates a new variabel for use. The variable can be referred to by its offset (e.g. if New is called twice, the new variable will have offset 1 (or SZ in parseltongue))</td>
  </tr>
  <tr>
    <td>Increment [variable offset]</td> <td>SZ [variable offset]</td> <td>Increments the variable at the given variable offset by 1</td>
  </tr>
  <tr>
    <td>Decrement [variable offset]</td> <td>SSZ [variable offset]</td> <td>Decrements the variable at the given variable offset by 1</td>
  </tr>
  <tr>
    <td>IfNotZeroThenJump [variable offset] [jump position]</td> <td>SSSZ [variable offset] [jump position]</td> <td>If the value of the variable is not zero, then the code will resume execution from the given position</td>
  </tr>
  <tr>
    <td>Print [variable offset]</td> <td>SSSSZ [variable offset]</td> <td>Prints the equivalent ASCII character of the value stored in the variable offset to STDOUT</td>
  </tr>
  <tr>
    <td>Get [variable offset]</td> <td>SSSSSZ [variable offset]</td> <td>Reads an ASCII character from STDIN and stores the value at the given variable offset</td>
  </tr>
</table>

In Parseltongue all the instructions and values must be written in their equivalent Peano representation (see above table).

Examples
------------

Hello World:
```
ZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSSSSZZ
SZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSSSSZZ
SZZSZZSZZSZZSZZSZZSZZSSSSZZ
SSSSZZ
SZZSZZSZZSSSSZZ
SSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSSSZZ
SZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSSSSZZ
SZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSSSSZZ
SZZSZZSZZSSSSZZ
SSZZSSZZSSZZSSZZSSZZSSZZSSSSZZ
SSZZSSZZSSZZSSZZSSZZSSZZSSZZSSZZSSSSZZ
ZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSZSSSSZSZ
```

Print the next 25 characters from the given input (e.g. if given A as input it will print the alphabet):
```
ZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZSZZ
ZSSSSSZSZ
ZSZSSZSZSSZSZSSZSZSSZSZSSZSZSSZSZSSZSZSSZSZSSZSZSSZ
SSZZ
SSSSZSZ
SZSZ
SSSZZSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSZ
SSSSZSSZ
```

To run the examples please use the example.sh file (Requires an installation of GHC)
