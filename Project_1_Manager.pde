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
