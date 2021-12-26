class Sort{
  
  //Heapsort Functions
  int heap[];
  
  Sort() {
  }
  
  void heapSort(int count, int id) {
    heapify(count, id);
  
    for(int end = (count - 1); end > 0; end--) {
      swap(end, 0);
      siftDown(0, (end - 1), id);
    }
  }
  
  void heapify(int count, int id) {
    for(int start = (count / 2); start >= 0; start--) {
      siftDown(start, (count - 1), id); 
    }
  }
  
  void siftDown(int start, int end, int id) { 
    int root = start;
    while((root * 2) <= end) {
      int child = (root * 2);
      
      boolean flag;
      switch(id) {
        case 0: 
           
           if(child < end) {
             flag = false;
             if(courses[heap[child]].building.compareTo(courses[heap[child + 1]].building) < 0) {
               flag = true;
             }
           
             if(flag) {
               child++;  
             }
           }
           
           flag = false;
           if(courses[heap[root]].building.compareTo(courses[heap[child]].building) < 0) {
             flag = true;
           }
           
           if(flag) {
             swap(root, child);
             root = child;
           }
           else {
             return;
           } 
           break;   
        case 1:
          if(child < end) {
            if(courses[heap[child]].catalog < courses[heap[child + 1]].catalog) {
              child++;  
            }
          }
          if(courses[heap[root]].catalog < courses[heap[child]].catalog) {
            swap(root, child);
            root = child;
          }
          else {
            return;
          }
          break;
        case 2: 
           if(child < end) {
             flag = false;
             if(courses[heap[child]].component.compareTo(courses[heap[child + 1]].component) < 0) {
               flag = true;
             }
           
             if(flag) {
               child++;  
             }
           }
           
           flag = false;
           if(courses[heap[root]].component.compareTo(courses[heap[child]].component) < 0) {
             flag = true;
           }
           
           if(flag) {
             swap(root, child);
             root = child;
           }
           else {
             return;
           } 
           break;
        case 3:
           if(child < end) {
             flag = false;
             if(courses[heap[child]].group.compareTo(courses[heap[child + 1]].group) < 0) {
               flag = true;
             }
           
             if(flag) {
               child++;  
             }
           }
           
           flag = false;
           if(courses[heap[root]].group.compareTo(courses[heap[child]].group) < 0) {
             flag = true;
           }
           
           if(flag) {
             swap(root, child);
             root = child;
           }
           else {
             return;
           } 
           break;
        case 4:
           if(child < end) {
             flag = false;
             if(courses[heap[child]].subject.compareTo(courses[heap[child + 1]].subject) < 0) {
               flag = true;
             }
           
             if(flag) {
               child++;  
             }
           }
           
           flag = false;
           if(courses[heap[root]].subject.compareTo(courses[heap[child]].subject) < 0) {
             flag = true;
           }
           
           if(flag) {
             swap(root, child);
             root = child;
           }
           else {
             return;
           } 
           break;    
        case 5:
           if(child < end) {
             flag = false;
             if(courses[heap[child]].title.compareTo(courses[heap[child + 1]].title) < 0) {
               flag = true;
             }
           
             if(flag) {
               child++;  
             }
           }
           
           flag = false;
           if(courses[heap[root]].title.compareTo(courses[heap[child]].title) < 0) {
             flag = true;
           }
           
           if(flag) {
             swap(root, child);
             root = child;
           }
           else {
             return;
           } 
           break;  
        default:
           break;
      }
    }
  }
  
  void swap(int i, int j) {
    int k = heap[i];
    heap[i] = heap[j];
    heap[j] = k;  
  }
  
  //Sort Functions
  void buildingSort() {
    println("BEFORE");
    
    heap = new int[now.length];
    for(int i = 0; i < heap.length; i++) {
      heap[i] = now[i].index;
      
      if(i < 10) {
        println(courses[now[i].index].building);  
      }
    } 
    
    println(" ");
    heapSort(heap.length, 0);
    
    println("AFTER");
    for(int i = 0; i < now.length; i++) {
      now[i].index = heap[i];  
      if(i < 10) {
        println(courses[now[i].index].building);  
      }
    }
  }
  
  void catalogSort() {
    println("BEFORE");
    
    heap = new int[now.length];
    for(int i = 0; i < heap.length; i++) {
      heap[i] = now[i].index;
      
      if(i < 10) {
        println(now[i].index);  
      }
    } 
    
    println(" ");
    heapSort(heap.length, 1);
    
    println("AFTER");
    for(int i = 0; i < now.length; i++) {
      now[i].index = heap[i];  
      if(i < 10) {
        println(now[i].index);  
      }
    }
  }
  
  void componentSort() {
    println("BEFORE");
    
    heap = new int[now.length];
    for(int i = 0; i < heap.length; i++) {
      heap[i] = now[i].index;
      
      if(i < 10) {
        println(now[i].index);  
      }
    } 
    
    println(" ");
    heapSort(heap.length, 2);
    
    println("AFTER");
    for(int i = 0; i < now.length; i++) {
      now[i].index = heap[i];  
      if(i < 10) {
        println(now[i].index);  
      }
    }
  }
  
  void groupSort() {
    println("BEFORE");
    
    heap = new int[now.length];
    for(int i = 0; i < heap.length; i++) {
      heap[i] = now[i].index;
      
      if(i < 10) {
        println(now[i].index);  
      }
    } 
    
    println(" ");
    heapSort(heap.length, 3);
    
    println("AFTER");
    for(int i = 0; i < now.length; i++) {
      now[i].index = heap[i];  
      if(i < 10) {
        println(now[i].index);  
      }
    }
  }
  
  void subjectSort() {
    println("BEFORE");
    
    heap = new int[now.length];
    for(int i = 0; i < heap.length; i++) {
      heap[i] = now[i].index;
      
      if(i < 10) {
        println(now[i].index);  
      }
    } 
    
    println(" ");
    heapSort(heap.length, 4);
    
    println("AFTER");
    for(int i = 0; i < now.length; i++) {
      now[i].index = heap[i];  
      if(i < 10) {
        println(now[i].index);  
      }
    }
  }
  
  void titleSort() {
    println("BEFORE");
    
    heap = new int[now.length];
    for(int i = 0; i < heap.length; i++) {
      heap[i] = now[i].index;
      
      if(i < 10) {
        println(courses[now[i].index].title);  
      }
    } 
    
    println(" ");
    heapSort(heap.length, 5);
    
    println("AFTER");
    for(int i = 0; i < now.length; i++) {
      now[i].index = heap[i];  
      if(i < 10) {
        println(courses[now[i].index].title);  
      }
    }
  }
}
