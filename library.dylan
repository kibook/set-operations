module: dylan-user

define library set-operations
  use common-dylan;
  use io;
  use collections;
  export
    set-operations;
end library set-operations;

define module set-operations
  use common-dylan;
  use set;
  use streams;
  use print;
  export
    $empty-set,
    set-union,
    set-union!,
    set-intersection,
    set-intersection!,
    set-difference,
    set-difference!,
    set-product,
    set-symmetric-difference,
    set-contains?,
    power-set,
    set;
end module set-operations;
