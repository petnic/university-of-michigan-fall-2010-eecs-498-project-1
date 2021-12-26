class Course {
  String term, session, group, number, subject, catalog, section, title, component, codes;
  //boolean M, T, W, TH, F, S, SU;
  String M, T, W, TH, F, S, SU;
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
    
    /*
    //Days
    M = false;
    T = false;
    W = false;
    TH = false;
    F = false;
    S = false;
    SU = false;
    
    if(parameters[10].length() > 0) {
      M = true;
    }
    if(parameters[11].length() > 0) {
      T = true;
    }
    if(parameters[12].length() > 0) {
      W = true;
    }
    if(parameters[13].length() > 0) {
      TH = true;
    }
    if(parameters[14].length() > 0) {
      F = true;
    }
    if(parameters[15].length() > 0) {
      S = true;
    }
    if(parameters[16].length() > 0) {
      SU = true;
    }
    */
    
    M = parameters[10];
    T = parameters[11];
    W = parameters[12];
    TH = parameters[13];
    F = parameters[14];
    S = parameters[15];
    SU = parameters[16];
    
    //Time
    //String temptime = parameters[17];
    //String arraytime[] = split(temptime, "-");
    //char ampmdata[] = {arraytime[1].charAt(arraytime[1].length() - 2), arraytime[1].charAt(arraytime[1].length() - 1)};
    //String ampm = new String(ampmdata);
    //println(ampm);
    
    time = parameters[17];
    location = parameters[18];
    instructor = parameters[19];
  }
  
  String saveCourse() {
    String seperator = ";";
    return returnCSV();
  }
  
  void printCourse() {
    String seperator = " ";
    println(returnParameters(seperator));
  }
  
  String returnParameters(String seperator) {
    String output = (term + seperator + session + seperator + group + seperator + number + seperator + subject + seperator + catalog + seperator + 
                    section + seperator + title + seperator + component + seperator + codes + seperator +
                    M + seperator + T + seperator + W + seperator + TH + seperator + F + seperator + S + seperator + SU + seperator +
                    time + seperator + location + seperator + instructor);
    return output; 
  }
  
  String returnCSV() {
    String output = ("\"" + term + "\"," + "\"" + session + "\"," + "\"" + group + "\"," + "\"" + number + "\"," + "\"" + subject + "\"," + "\"" + catalog + "\"," + "\"" + 
                    section + "\"," + "\"" + title + "\"," + "\"" + component + "\"," + "\"" + codes + "\"," + "\"" +
                    M + "\"," + "\"" + T + "\"," + "\"" + W + "\"," + "\"" + TH + "\"," + "\"" + F + "\"," + "\"" + S + "\"," + "\"" + SU + "\"," + "\"" +
                    time + "\"," + "\"" + location + "\"," + "\"" + instructor + "\",");
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
  int count = 0;
  for(int i = 0; i < courses.length; i++) {
    if(!courses[i].time.equals("ARR")) {
      count++;
    }
  }
  
  int j = 0;
  String output[] = new String[count];
  for(int i = 0; i < courses.length; i++) {
    if(!courses[i].time.equals("ARR")) {
      output[j] = new String();
      output[j] = courses[i].saveCourse();
      j++;
    }
  }
  saveStrings("resources/output.txt", output);
  
  //Draw
  size(1280, 720); 
  background(25);
  frameRate(30);
}

void draw() {

}
