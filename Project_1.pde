class Course {
  String term, session, group, number, subject, catalog, section, title, component, codes;
  boolean M, T, W, TH, F, S, SU;
  int startHour, startMinutes, endHour, endMinutes; 
  String time, location, instructor;

  void loadCourse(String input) {
    String[] parameters = split(input, "\",");
    for(int i = 0; i < parameters.length; i++) {
      if(parameters[i].length() >= 1) {
        int end = parameters[i].length();
        parameters[i] = trim(parameters[i].substring(1, end));
      }
    }
     
    term = parameters[0];
    session = parameters[1];
    group = parameters[2];
    number = parameters[3];
    subject = parameters[4];
    catalog = parameters[5];
    section = parameters[6];
    title = parameters[7];
    component = parameters[8];
    codes = parameters[9];
    
    //Days
    M = 0;
    T = 0;
    W = 0;
    TH = 0;
    F = 0;
    S = 0;
    SU = 0;
    
    if(parameters[10].length() > 0) {
      M = 1;
    }
    if(parameters[11].length() > 0) {
      T = 1;
    }
    if(parameters[12].length() > 0) {
      W = 1;
    }
    if(parameters[13].length() > 0) {
      TH = 1;
    }
    if(parameters[14].length() > 0) {
      F = 1;
    }
    if(parameters[15].length() > 0) {
      S = 1;
    }
    if(parameters[16].length() > 0) {
      SU = 1;
    }
    
    //Time
    
    time = parameters[17];
    location = parameters[18];
    instructor = parameters[19];
  }
  
  String saveCourse() {
    String seperator = ";";
    return returnParameters(seperator);
  }
  
  void printCourse() {
    String seperator = " ";
    println(returnParameters(seperator));
  }
  
  String returnParameters(String seperator) {
    String output = (term + seperator + session + seperator + group + seperator + number + seperator + subject + seperator + catalog + seperator + 
                    section + seperator + title + seperator + component + seperator + codes + seperator + time + seperator + location + seperator + instructor);
    return output; 
  }
}

void setup() {
  //Input
  String input[] = loadStrings("resources/input.txt");
  Course courses[] = new Course[input.length];
  for (int i = 0; i < courses.length; i++) {
    courses[i] = new Course();
    courses[i].loadCourse(input[i]);
  }
  
  //Output
  /*
  String output[] = new String[courses.length];
  for(int i = 0; i < courses.length; i++) {
    output[i] = new String();
    output[i] = courses[i].saveCourse();
  }
  saveStrings("resources/output.txt", output);
  */
  
  //Draw
  size(1280, 720); 
  background(25);
  frameRate(30);
}

void draw() {

}
