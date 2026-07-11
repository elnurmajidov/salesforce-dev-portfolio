// Example-1: inputs are 7, 84, 29. Sum is 120. Thus, the return should be: true
// Example-2: inputs are 10, -315, 4398. Sum is 4093. Thus, the return should be: true
// Example-3: inputs are 61, 41, 73. Sum is 175. Thus, the return should be: false
// Create an Anonymous apex file to execute the methods. Use the returning values in system.debug statements and produce logs.

GeometricCalculation gc = new GeometricCalculation();
System.debug(gc.calcPerimeter(14, 20));
System.debug(gc.calcVolume(4.4, 6.02, 1.25));
System.debug(gc.containsZero(7, 84, 29));
System.debug(gc.containsZero(10, -315, 4398));
System.debug(gc.containsZero(61, 41, 73));

