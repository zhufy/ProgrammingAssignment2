## Announcement

This is the project-2 homework for the coursera course R Programming, the project is fully created
by Zhu Fengyuan.

The detail is in the comment of cachematrix.R, or you can read the note in this file.
Thanks to the program in https://github.com/rdpeng/ProgrammingAssignment2
Actually, for a fresh-man programmer, the best way for learning coding is imitation, not creation

##Note for cachematrix.R

This document include two functions, which will allow you to make a cache when you want to make a inverse calculating for a target matrix. In the file, here are two functions are as below:

        makeCacheMatrix(x):
         	 x should be a matrix which could be invertible,it will return a list to present a cache-able 	matrix
        cacheSolve(y):
	 y should be a cache-able matrix created by the function makeCacheMatrix(x), it will 		return the inverse of the matrix or calculate the inverse if the user didn't calculate before