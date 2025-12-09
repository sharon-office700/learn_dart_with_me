void main() {
  if (5 > 3) {
    print("if statement executed bcoz the condition is ${(5 > 3)}"); // use {} for in-line expression 
  }

  
  if (1 + 1 == 11) {
    print("if statement executed ...");
  } else {
    print("else statement executed ...");
  }

  if (5 < 4) {
    print("this is the if statment ");
  } else if (5 < 4) {
    print("this is the 2nd stage");
  } else {
    print("this is the final else statment of if-else-if ladder");
    print("use curly braces for putting expressions in e.g \${2+2} == ${2+2}"); // used escape character to escape the $ for expresiions and variables
  }



}