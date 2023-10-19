Her har jeg skrevet koden for å lage et norgesflagg. Har brukt metoden med å bygge det fra toppen og nedover, 
med rektangler i ulike farger og størrelser. Har definert figurene jeg brukte til flagget på toppen, og bygget på nedover. 
Noen av figurene er brukt flere ganger. 

use context essentials2021
red-1 = rectangle( 100, 70, "solid", "red" )
red-1

red-2 = rectangle( 200, 70, "solid", "red" )

white-1 = rectangle( 20, 70, "solid", "white" )
white-1

white-2 = rectangle( 120, 20, "solid", "white" )

white-3 = rectangle( 220, 20, "solid", "white" )


blue-1 = rectangle( 20, 70, "solid", "blue" )
blue-1

blue-2 = rectangle( 20, 20, "solid", "blue" )

blue-3 = rectangle( 360, 20, "solid", "blue" )

#kombinerer delene

a1 = beside(red-1, white-1)
a1

#legger til blå

a2 = beside( a1, blue-1 )
a2

#legger til hvit

a3 = beside(a2, white-1)
a3

#legger til siste røde

a4 = beside(a3, red-2)
a4

#legger til del

b1 = beside( white-2, blue-2)
b1

b2 = beside(b1, white-3)
b2

#kombinerer a og b

c = above(a4, b2)
c

#legger til blå loddrett linje
c1 = above(c, blue-3)
c1

#legger til blå og hvit linje

d = above(c1, b2)
d

#legger til siste del i a

norway = above(d, a4)
norway
