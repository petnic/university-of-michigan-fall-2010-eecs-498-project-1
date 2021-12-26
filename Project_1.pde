class Course {
  String term, session, group, number, subject, catalog, section, title, component, codes;
  boolean M, T, W, TH, F, S, SU;
  int startHour, startMinute, endHour, endMinute; 
  String location, instructor;

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
    
    //Time
    String time = parameters[17];
    String timeList[] = split(time, "-");
    
    //Offset
    int offsetTime = 0;
    if(timeList[1].charAt(timeList[1].length() - 2) == 'A') {
      offsetTime = 0;  
    }
    else {
      offsetTime = 12;  
    }
    
    String startTime = timeList[0];
    String endTime = timeList[1].substring(0, (timeList[1].length() - 2));
    
    //Start Time
    if(startTime.length() == 1) {
      startHour = startTime.charAt(0) - 48;
      startMinute = 0;
    }
    else if(startTime.length() == 2) {
      startHour = 10 + startTime.charAt(1) - 48;
      startMinute = 0;
    }
    else if(startTime.length() == 3) {
      startHour = startTime.charAt(0) - 48;
      if(startTime.charAt(1) == '0') {
        startMinute = 0;
      }
      else {
        startMinute = 30;
      }
    }
    else {
      startHour = 10 + startTime.charAt(1) - 48;
      if(startTime.charAt(2) == '0') {
        startMinute = 0;
      }
      else {
        startMinute = 30;
      }
    }
    
    //End Time
    if(endTime.length() == 1) {
      endHour = endTime.charAt(0) - 48;
      endMinute = 0;
    }
    else if(endTime.length() == 2) {
      endHour = 10 + endTime.charAt(1) - 48;
      endMinute = 0;
    }
    else if(endTime.length() == 3) {
      endHour = endTime.charAt(0) - 48;
      if(endTime.charAt(1) == '0') {
        endMinute = 0;
      }
      else {
        endMinute = 30;
      }
    }
    else {
      endHour = 10 + endTime.charAt(1) - 48;
      if(endTime.charAt(2) == '0') {
        endMinute = 0;
      }
      else {
        endMinute = 30;
      }
    }
    
    //Check Time
    if(startHour == 12) {
      startHour = 0;  
    }
    if(endHour == 12) {
      endHour = 0;
    }
    
    //Offset Time
    if(offsetTime == 0) {
      if(startHour > endHour) {
        startHour = startHour + 12;
      }
      else {
        startHour = startHour + 0;
      }
    }
    else {
      if(startHour > endHour) {
        startHour = startHour + 0;
      }
      else {
        startHour = startHour + 12;
      }
    }
    endHour = endHour + offsetTime;

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
                    section + seperator + title + seperator + component + seperator + codes + seperator +
                    location + seperator + instructor);
    return output; 
  }
}

//Public Calendar
Calendar calendar;
Course courses[];

void setup() {
  //Input
  String input[] = loadStrings("resources/input.txt");
  courses = new Course[input.length];
  for (int i = 0; i < courses.length; i++) {
    courses[i] = new Course();
    courses[i].loadCourse(input[i]);
  }
  
  //Manager
  calendar = new Calendar();
  
  for(int i = 0; i < courses.length; i++) {
    int startIndex = 0;
    int endIndex = 0;
    
    if(courses[i].startMinute == 0) {
      startIndex = (2 * courses[i].startHour);
    }
    else {
      startIndex = (2 * courses[i].startHour) + 1;
    }
    
    if(courses[i].endMinute == 0) {
      endIndex = (2 * courses[i].endHour) - 1;  
    }
    else {
      endIndex = (2 * courses[i].endHour);
    }
    
    for(int j = 0; j < 7; j++) {
      if(j == 0 && courses[i].SU == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        }
      }
      if(j == 1 && courses[i].M == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        }    
      }
      if(j == 2 && courses[i].T == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        }
      }
      if(j == 3 && courses[i].W == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        }
      }
      if(j == 4 && courses[i].TH == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        } 
      }
      if(j == 5 && courses[i].F == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        }
      }
      if(j == 6 && courses[i].S == true) {
        for(int k = startIndex; k <= endIndex; k++) {
          calendar.days[j].timeslots[k].indices.add(new Index(i));
        }
      }
    }
  }
  
  //Verification Code
  /*
  for(int i = 0; i < 48; i++) {
    int tempday = 1;
    for(int j = 0; j < calendar.days[tempday].timeslots[i].indices.size(); j++) {
      Index temp = (Index)calendar.days[tempday].timeslots[i].indices.get(j);
      if(temp.index == 0 || temp.index == 1) {
        print(i); 
        print(" ");
        println(temp.index); 
      }
    }
  }
  */
    
  //Draw
  size(1280, 720); 
  background(25);
  frameRate(30);
}

void draw() {

}
