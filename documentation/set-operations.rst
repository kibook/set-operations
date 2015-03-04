##########################
The set-operations library
##########################

**************************
The set-operations module
**************************

.. current-library:: set-operations
.. current-module:: set-operations

Fundamental set operations

Empty set
=========

.. constant:: $empty-set

   A set containing no elements.

Union
=====

.. method:: set-union
   :specializer: <set>, <set>
     
   :signature: set-union *A* *B* => *U*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`
   
   :value U:    Union of sets A and B.

   Creates a new set, which is the union of sets A and B.

.. method:: set-union!
   :specializer: <set>, <set>
     
   :signature: set-union! *A* *B* => *A*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value A:    modified set A.
   
   Destructively modifies set A to be the union of sets A and B.

.. method:: \+
   :specializer: <set>, <set>   

   :signature: *A* + *B* => *U*

   A + B is the set-union of sets A and B.

Intersection
============

.. method:: set-intersection
   :specializer: <set>, <set>   

   :signature: set-intersection *A* *B* => *I*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value I: Intersection of sets A and B.

   Creates a new set, which is the intersection of sets A and B.

.. method:: set-intersection!
   :specializer: <set>, <set>   

   :signature: set-intersection! *A* *B* => *A*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value A: modified set A.

   Destructively modifies set A to be the intersection of sets A and B.

.. method:: \^
   :specializer: <set>, <set>   

   :signature: *A* ^ *B* => *I*

   A ^ B is the set-intersection of sets A and B.

Difference
==========

.. method:: set-difference
   :specializer: <set>, <set>   

   :signature: set-difference *A* *B* => *D*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value D: Difference of sets A and B.

   Creates a new set, which is the theoretic difference of sets A and B.

.. method:: set-difference!
   :specializer: <set>, <set>   

   :signature: set-difference! *A* *B* => *A*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value A: modified set A

   Destructively modifies set A to be the theoretic difference of sets A
   and B.

.. method:: \-
   :specializer: <set>, <set>   

   :signature: *A* - *B* => *D*

   A - B is the set-difference of sets A and B.

Cartesian product
=================

.. method:: set-product
   :specializer: <set>, <set>   

   :signature: set-product *A* *B* => *P*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value P: Cartesian product of sets A and B.

   Creates a new set, which is the Cartesian product of sets A and B, which
   is a set of pair(a, b) for each element a in A and b in B.

.. method:: \*
   :specializer: <set>, <set>   

   :signature: *A* * *B* => *P*

   A * P is the set-product of sets A and B.

Symmetric Difference
====================

.. method:: set-symmetric-difference
   :specializer: <set>, <set>   

   :signature: set-symmetric-difference *A* *B* => *S*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value S: The symmetric difference of sets A and B.

   Creates a new set, which is the symmetric difference of sets A and B.
   This is equivalent to (A + B) - (A ^ B).

Subsets
=======

.. method:: set-contains?
   :specializer: <set>, <set>   

   :signature: set-contains? *A* *B* => *subset?*

   :param A: An instance of :class:`<set>`
   :param B: An instance of :class:`<set>`

   :value subset?: Is B a subset of A?

   Determines whether set B is a subset of set A, or whether set A contains
   all the elements of set B.

Power set
=========

.. method:: power-set
   :specializer: <set>

   :signature: power-set *A* => *P*

   :param A: An instance of :class:`<set>`
   :value P: An instance of :class:`<set>`.

   Returns a new set, which is the power set of *A*.

Constructors
============

.. function:: set

   :signature: set ``#rest`` *arguments* => *set*

   :param #rest arguments: The elements of the set.
   
   :value set: A freshly allocated instance of <set> or $empty-set.

   Creates and returns a freshly allocated set.

   If no arguments are supplied, the $empty-set constant is
   returned instead, therefore all empty sets created with set()
   will be identical.

Other
=====

.. method:: print-object
   :specializer: <set>, <stream>

   :signature: print-object *A* *stream* => ()

   :param A: An instance of <set>
   :param stream: An instance of <stream>

   Adds a method for printing set objects in the form of #{*elements*}.

   The order in which the *elements* are printed is not guaranteed.

   Example:

.. code-block:: dylan

   format-out("%=\n", set(1, 2, 3) + set(3, 4)); // #{1, 2, 3, 4}
   format-out("%=\n", set(1, 2, 3) ^ set(3, 4)); // #{3}
   format-out("%=\n", set(1, 2, 3) - set(3, 4)); // #{1, 2}
   format-out("%=\n", set(1, 2, 3) * set(3, 4)); // #{(1 . 3), (2 . 3), (3 . 3), (1 . 4), (2 . 4), (3 . 4)}
   format-out("%=\n", set(1, 2, 3) / set(3, 4)); // #{1, 2, 4}
