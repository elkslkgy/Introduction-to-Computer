// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(restart)
@16384
D = A
@now
M = D
@24576
D = M
@black
D; JNE

(white)
@white
M = 0
D = M
@draw
0; JMP

(black)
@black
M = -1
D = M

(draw)
@color_now
M = D

(LOOP)
@color_now
D = M
@now
A = M
M = D
@now
M = M + 1
D = M
@24576
D = D - A
@LOOP
D; JLT
@restart
0; JMP
