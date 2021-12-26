class Calendar {
  Day days[] = new Day[7];
  
  Calendar () {
    for(int i = 0; i < days.length; i++) {
      days[i] = new Day();  
    }
  }
}

class Day {
  Timeslot timeslots[] = new Timeslot[48];
  
  Day () {
    for(int i = 0; i < timeslots.length; i++) {
      timeslots[i] = new Timeslot(); 
    } 
  }
}

class Timeslot {
  ArrayList indices;
  
  Timeslot () {
    indices = new ArrayList();
  }
}

class Index {
  int index;
  
  Index (int i) {
    index = i; 
  } 
}

class Course {

  String term, session, group, number, subject, section, title, component, codes;
  int catalog;
  boolean M, T, W, TH, F, S, SU;
  int startHour, startMinute, endHour, endMinute; 
  String location, instructor;
  String building;
  
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
    
    //Catalog
    catalog = 0;
    catalog = catalog + ((parameters[5].charAt(0) - 48) * 100);
    catalog = catalog + ((parameters[5].charAt(1) - 48) * 10);
    catalog = catalog + ((parameters[5].charAt(2) - 48) * 1);
    
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

    //Building
    location = parameters[18];
    String locationParameters[] = split(location, " ");
    building = locationParameters[locationParameters.length - 1];
   
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
