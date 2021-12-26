class Sort{
  
  //Heapsort Functions
  int heap[];
  
  Sort(int heapSize) {
    heap = new int[heapSize];
    for(int i=0; i < heapSize; i++){
      heap[i] = (int)random(heapSize);
    } 
  }
  
  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp; 
  }
  
  void heapify() {
    for (int i = ((heap.length-2) / 2); i >= 0; i--) {
      fixDown(heap.length, i); 
    }
  }
  
  void fixDown(int heapSize, int k) {
    while (((2 * k) + 1) < heapSize) {
      int j = ((2 * k) + 1);
      if(((j + 1) < heapSize) && (heap[j] < heap[j + 1])) {
        j++;
      }
      if(heap[k] < heap[j]) {
        swap(k, j); 
        k = j;
      }
      else {
        break;
      }
    }
  }
  
  void heapsort() {
    heapify();
    for(int i = (heap.length - 1); i > 0; i--) {
      swap(i, 0);
      fixDown(i, 0);
    }
  }
  
  //Sort Functions
  //component: LAB, LEC, REC, DIS, SEM, IND
  /*
  void catalogSort() {
    
  }
  void componentSort() {
    
  }
  void groupSort() {
    
  }
  void locationSort() {
    
  }
  void subjectSort() {
    
  }
  */
}
