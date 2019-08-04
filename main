import java.util.Map;
String str = "to loop1 :ne :sz repeat :ne [rt 360 / :ne fd :sz] end to ooler2 :ne :sz repeat :ne [rt 360 / :ne loop1 :ne :sz] end ooler2 36 20".replace("[", "[ ").replace("]", " ]").toLowerCase();
final String[]mainTokens = split(str, ' ');
HashMap<String, Procedure>procedures = new HashMap<String, Procedure>();
HashMap<String, String>mainVars = new HashMap<String, String>();

Turtle mainTurtle;
MyInt mainIndex = new MyInt(0);

void setup() {
  size(500, 500, P3D);
  mainTurtle = new Turtle();
  background(255);
}

public String[] getArgs(int argCount, String[]tokens, MyInt i, Map<String, String>vars) {
  String[]args = new String[argCount];
  for (int arg = 0; arg < argCount; arg++) {
    try {
      Float.parseFloat(tokens[i.val]);
      args[arg] = tokens[i.val];
    } 
    catch (NumberFormatException nfe) {// not a number
      if (tokens[i.val].equals("random")) {
        args[arg] = getArgs(1, tokens, i.inc(), vars)[0];
        args[arg] = "" + random(Float.parseFloat(args[arg]));
      } else if (tokens[i.val].equals("sum")) {
        String[]summers = getArgs(2, tokens, i.inc(), vars);
        args[arg] = "" + (Float.parseFloat(summers[0]) + Float.parseFloat(summers[1]));
      } else if (tokens[i.val].startsWith(":")) {
        String varName = tokens[i.val].replace(":", "");
        args[arg] = vars.get(varName);
      } else args[arg] = tokens[i.val];
    }
    i.inc();
    if (i.val<tokens.length) {
      if (tokens[i.val].equals("/")) {
        float den = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
        args[arg] = "" + (Float.parseFloat(args[arg]) / den);
      }
    }
  }
  return args;
}

public void createProcedure(String[]tokens, MyInt i, HashMap<String, String>vars) {
  String name = getArgs(1, tokens, i.inc(), vars)[0];
  ArrayList<String>proVars = new ArrayList<String>();
  while (tokens[i.val].startsWith(":")) {
    proVars.add(tokens[i.val].replace(":", ""));
    i.inc();
  }
  int nestedMethods = 1;
  String method = "";
  while (true) {
    if (tokens[i.val].equals("to"))
      nestedMethods++;
    else if (tokens[i.val].equals("end")) {
      nestedMethods--;
      if (nestedMethods == 0) { // main loop is done
        i.inc();
        break;
      }
    }
    method += tokens[i.val] + " ";
    i.inc();
  }
  String[]methodTokens = split(method, ' ');
  Procedure procedure = new Procedure(methodTokens, proVars.toArray(new String[0]));
  procedures.put(name, procedure);
}

public void runCommands(Turtle turtle, String[]tokens, MyInt i, HashMap<String, String>vars) {
  String token = tokens[i.val];
  if (token.equals("forward") || token.equals("fd")) {
    float amt = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.forward(amt);
  } else if (token.equals("back") || token.equals("bk")) {
    float amt = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.back(amt);
  } else if (token.equals("right") || token.equals("rt")) {
    float amt = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.right(amt);
  } else if (token.equals("left") || token.equals("lt")) {
    float amt = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.left(amt);
  } else if (token.equals("clearscreen") || token.equals("cs")) {
    turtle.clearscreen();
    i.inc();
  } else if (token.equals("penup") || token.equals("pu")) {
    turtle.penUp();
    i.inc();
  } else if (token.equals("pendown") || token.equals("pd")) {
    turtle.penDown();
    i.inc();
  } else if (token.equals("home")) {
    turtle.home();
    i.inc();
  } else if (token.equals("setx")) {
    float newX = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.setX(newX);
  } else if (token.equals("sety")) {
    float newY = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.setY(newY);
  } else if (token.equals("setxy")) {
    String[]args = getArgs(2, tokens, i.inc(), vars);
    float newX = Float.parseFloat(args[0]);
    float newY = Float.parseFloat(args[1]);
    turtle.setXY(newX, newY);
  } else if (token.equals("setheading") || token.equals("seth")) {
    float newH = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.setHeading(newH);
  } else if (token.equals("setcolor")) {
    int colIndex = int(Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]));
    turtle.setColor(colIndex);
  } else if (token.equals("repeat")) {
    int count = Integer.parseInt(getArgs(1, tokens, i.inc(), vars)[0]);
    int nestedLoops = 1;
    String loop = "";
    while (true) {
      i.inc();
      if (tokens[i.val].equals("["))
        nestedLoops++;
      else if (tokens[i.val].equals("]")) {
        nestedLoops--;
        if (nestedLoops == 0) { // main loop is done
          i.inc(); // skip last ']'
          break;
        }
      }
      loop += tokens[i.val] + " ";
    }
    loop = loop.replace("[", "[ ").replace("]", " ]").toLowerCase();
    String[]loopTokens = split(loop, ' ');
    for (int loopTime = 0; loopTime < count; loopTime++) {
      MyInt loopInt = new MyInt(0);
      while (loopInt.val < loopTokens.length)
        runCommands(turtle, loopTokens, loopInt, vars);
    }
  } else if (token.equals("to")) {
    createProcedure(tokens, i, vars);
  } else if (token.equals("label")) {
    String str = getArgs(1, tokens, i.inc(), vars)[0];
    turtle.label(str);
  } else if (token.equals("setlabelheight")) {
    int amt = Integer.parseInt(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.setlabelheight(amt);
  } else if (token.equals("setwidth")) {
    float amt = Float.parseFloat(getArgs(1, tokens, i.inc(), vars)[0]);
    turtle.setWidth(amt);
  } else if (token.equals("make")) {
  } else if (procedures.containsKey(token)) {
    Procedure pro = procedures.get(token);
    int argCount = pro.vars.length;
    String[]args = getArgs(argCount, tokens, i.inc(), vars);
    HashMap<String, String>proVars = new HashMap<String, String>();
    for (int a = 0; a < argCount; a++) {
      proVars.put(pro.vars[a], args[a]);
    }
    runCommands(turtle, pro.tokens, new MyInt(0), proVars);
  } else if (token.equals(" ") || token.equals("")) {
    i.inc();
  } else {
    println("Dont know this command yet: " + token);
    i.inc();
  }
}
void draw() {
  if (mainIndex.val >= mainTokens.length) {
    println("Done!");
    noLoop();
    //mainIndex.val = 0;
    //background(255);
    //mainTurtle.reset();
  }
  translate(width/2, height/2);
  rotateX(PI); // rotate y to be carteisan
  runCommands(mainTurtle, mainTokens, mainIndex, mainVars);
}
