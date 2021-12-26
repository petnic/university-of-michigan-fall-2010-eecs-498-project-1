String[] file;
ArrayList guide;
int count = 0;

class course {
  String term;
  String session;
  String group;
  String classNumber;
  String subject;
  String catalogNumber;
  String section;
  String title;
  String codes;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String sunday;
  String time;
  String location;
  String instructor;  
  
  course() {
    term = "";
    session = "";
    group = "";
    classNumber = "";
    subject = "";
    catalogNumber = "";
    section = "";
    title = "";
    codes = "";
    monday = "";
    tuesday = "";
    wednesday = "";
    thursday = "";
    friday = "";
    saturday = "";
    sunday = "";
    time = "";
    location = "";
    instructor = "";
  }
}

void setup() {
  importFile();
  
  for(int i = 1; i < file.length; i++) {
    String[] coursevar = split(trim(file[i]), "\",");
    
    course coursetemp = new course();
    for(int j = 0; j < coursevar.length; j++) {
      
      if(coursevar[j].length() >= 2) {
        String parameter = coursevar[j].substring(1, coursevar[j].length());
        parameter = trim(parameter);
     
        switch(j) {
          case 0:
            coursetemp.term = parameter;
            break;
          case 1:
            coursetemp.session = parameter;
            break;
          case 2:
            coursetemp.group = parameter;
            break;
          case 3:
            coursetemp.classNumber = parameter;
            break;
          case 4:
            coursetemp.subject = parameter;
            break;
          case 5:
            coursetemp.catalogNumber = parameter;
            break;
          case 6:
            coursetemp.section = parameter;
            break;
          case 7:
            coursetemp.title = parameter;
            break;
          case 8:
            coursetemp.codes = parameter;
            break;
          case 9:
            coursetemp.monday = parameter;
            break;
          case 10:
            coursetemp.tuesday = parameter;
            break;
          case 11:
            coursetemp.wednesday = parameter;
            break;
          case 12:
            coursetemp.thursday = parameter;
            break;
          case 13:
            coursetemp.friday = parameter;
            break;
          case 14:
            coursetemp.saturday = parameter;
            break;
          case 15:
            coursetemp.sunday = parameter;
            break;
          case 16:
            coursetemp.time = parameter;
            break;
          case 17:
            coursetemp.location = parameter;
            break;
          case 18:
            coursetemp.instructor = parameter;
            break;
          default:
            break; 
        }
      }
    }

    guide.add(coursetemp);
    count++;
  }
  
  for(int i = 0; i < guide.size(); i++) {
    course temp = (course)guide.get(i);
    println(temp.title);
  }
}

void draw() {
  
}

void importFile() {
  file = loadStrings("/resources/all.txt");
}

void exportFile() {
 println(file); 
}

