//Global
Calendar calendar;
Course courses[];
int now[];

//Setup
void setup() {
  
  //Input
  String input[] = loadStrings("resources/input.txt");
  courses = new Course[input.length];
  for (int i = 0; i < courses.length; i++) {
    courses[i] = new Course();
    courses[i].loadCourse(input[i]);
  }
  
  //Calendar
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
    
  //Draw
  size(1280, 720); 
  background(25);
  frameRate(30);
}

void draw() {

}


