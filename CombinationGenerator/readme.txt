this is how my algorithm work "combinations generator"
it's interesting!huh! if you need more info about this graph
see about "graph theory"
example:
you have values (1,2,3,4,5,6)
and you want all possible combination for every set with just four '4' values the order of values doesn't matter,
it's not necessary to be number maybe it could be a letter like "A,B,C,D,E,F" or anything like "apple,cherry,banana,grapes,Kiwi,orange" or objects

for example there are six '6' possible options for someone and he mast just select four "4" option from that list , the question what is the possible combinations ?
all possible combinations it's:
1,2,3,4
1,2,3,5
1,2,3,6
1,2,4,5
1,2,4,6
1,2,5,6
1,3,4,5
1,3,4,6
1,3,5,6
1,4,5,6
2,3,4,5
2,3,4,6
2,3,5,6
2,4,5,6
3,4,5,6
it's very fast algorithm if you looking for the right way to do it. enjoy :D
the algorithm speed so far its :3,921,225 "C(100,4)" combinations in 0.37 sec
and "C(52,6)"=20,358,520 combinations in 1.58 sec
------------------------------------------------------------------------------------
this algorithm is gonna give you the index for every combination like :"1,2,3,4" this gonna be "1,1,1,1,0,0" so if you get only the values on the index of "1" from all values "1,2,3,4,5,6" then you should get "1,2,3,4"
