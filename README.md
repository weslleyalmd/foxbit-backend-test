# Foxbit Test

### Problem
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North. In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading. 

Assume that the square directly North from (x, y) is (x, y+1).

### Input 
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0. The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau. The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

### Output
The output for each rover should be its final co-ordinates and heading.

### How to run
Execute this command from project root folder
```
ruby runner.rb path_to_instructions_file.txt
```

### How to run tests
Execute this command from project root folder
```
ruby -Itest test/run_all.rb
```

### Other functions
I made some assumptions over the scenario
1. Hover movement must be stopped if next instruction send the hover to an used tile - a warn must be returned
2. If instructions send the hover to outside of the plateau boundaries, a warn must be returned indicating that

The unit test cover these assumptions. In order to run the code and see this results, use the 'out_boundary_collision.txt' file
```
ruby runner.rb out_boundary_collision.txt
```