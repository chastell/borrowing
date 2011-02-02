Borrowing
=========

Borrowing¹ is a library which exposes the functionality of [Wizzard](https://github.com/chastell/s3-e1/tree/master/server), a spell-checking and -correcting server. Borrowing was written for the [s3-e1 exercise](https://github.com/rmu/s3-e1) of [Ruby Mendicant University](http://university.rubymendicant.com).

¹ [obviously](http://en.wikipedia.org/wiki/Granny_Weatherwax#Powers)

usage
-----

    require 'borrowing'
    uri = 'localhost:9292'
    Borrowing.new(uri).dicts                     #=> ['en', 'en_CA', 'en_GB', 'en_US']
    checker = Borrowing.new(uri, 'en_GB')
    checker.check 'colour'                       #=> true
    checker.check 'color'                        #=> false
    checker.errors 'a dubiosly colored fox'      #=> ['dubiosly', 'colored']
    checker.autocorrect 'a dubiosly colored fox' #=> 'a dubiously coloured fox'
    checker.suggest 'rewolutionary'              #=> ['revolutionary', 'evolutionary', 'reflationary', "revolutionary's"]

---

© MMX-MMXI Piotr Szotkowski <chastell@chastell.net>, licensed under AGPL 3 (see LICENCE)
