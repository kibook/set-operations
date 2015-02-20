module: set-operations
author: kibook
synopsis: Fundamental set operations

// Union

define method set-union
    (A :: <set>, B :: <set>)
 => (U :: <set>)
  let U = shallow-copy(A);
  do(curry(add!, U), B);
  U
end method set-union;

define method set-union!
    (A :: <set>, B :: <set>)
 => (A :: <set>)
  do(curry(add!, A), B);
  B
end method set-union!;

define sideways method \+
    (A :: <set>, B :: <set>)
 => (U :: <set>)
  set-union(A, B)
end method \+;

// Intersection

define method set-intersection
    (A :: <set>, B :: <set>)
 => (I :: <set>)
  let I = make(<set>);
  for (e in A)
    if (member?(e, B))
      add!(I, e)
    end if
  end for;
  I
end method set-intersection;

define method set-intersection!
    (A :: <set>, B :: <set>)
 => (A :: <set>)
  for (e in A)
    if (~ member?(e, B))
      remove!(A, e)
    end if
  end for;
  A
end method set-intersection!;

define sideways method \^
    (A :: <set>, B :: <set>)
 => (I :: <set>)
  set-intersection(A, B)
end method \^;

// Difference

define method set-difference
    (A :: <set>, B :: <set>)
 => (D :: <set>)
  let D = shallow-copy(A);
  do(curry(remove!, D), B);
  D
end method set-difference;

define method set-difference!
    (A :: <set>, B :: <set>)
 => (A :: <set>)
  do(curry(remove!, A), B);
  A
end method set-difference!;

define sideways method \-
    (A :: <set>, B :: <set>)
 => (D :: <set>)
  set-difference(A, B)
end method \-;

// Cartesian product

define method set-product
    (A :: <set>, B :: <set>)
 => (P :: <set>)
  let P = make(<set>);
  for (ae in A)
    for (be in B)
      add!(P, pair(ae, be))
    end for
  end for;
  P
end method set-product;

define sideways method \*
    (A :: <set>, B :: <set>)
 => (X :: <set>)
  set-product(A, B)
end method \*;

// Symmetric difference

define method set-symmetric-difference
    (A :: <set>, B :: <set>)
 => (S :: <set>)
  (A + B) - (A ^ B)
end method set-symmetric-difference;

define sideways method \/
    (A :: <set>, B :: <set>)
 => (S :: <set>)
  set-symmetric-difference(A, B)
end method \/;

// Subset

define method set-contains
    (A :: <set>, B :: <set>)
 => (subset? :: <boolean>)
  set-union(A, B) = A
end method set-contains;

// Other helpers

define function set
    (#rest args)
 => (new-set :: <set>)
  let new-set = make(<set>);
  do(curry(add!, new-set), args);
  new-set
end function set;

define sideways method print-object
    (A :: <set>, stream :: <stream>)
 => ()
  let elements = make(<stretchy-vector>);
  do(curry(add!, elements), A);
  write(stream, "#{");
  if (A.size > 0)
    for (i from 0 to elements.size - 2)
      print(elements[i], stream);
      write(stream, ", ")
    end for;
    print(elements.last, stream)
  end if;
  write(stream, "}")
end method print-object;
