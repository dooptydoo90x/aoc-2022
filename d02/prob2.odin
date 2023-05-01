package main

prob2 :: proc () -> uint {
	input : []u8 : #load("input1.txt")

	hand :: struct {
		loses : ^hand,
		beats : ^hand,
	}

	R, P, S : hand
	R = {loses = &P, beats = &S}
	P = {loses = &S, beats = &R}
	S = {loses = &R, beats = &P}

	sum : uint
	mine : ^hand
	theirs : ^hand

	for char in input {
		if char == '\n' {
			switch mine {
				case &R : sum+=1
				case &P : sum+=2
				case &S : sum+=3
			}
		} else if char == ' ' {
			continue
		} else {
			switch char {
				case 'A' : theirs = &R
				case 'B' : theirs = &P
				case 'C' : theirs = &S
				case 'X' : 
					mine = theirs.beats
				case 'Y' : 
					mine = theirs
					sum+=3
				case 'Z' : 
					mine = theirs.loses
					sum+=6
			}
		}
	}

	return sum
}
