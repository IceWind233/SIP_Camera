class Dragger{

  double dragStart = 0;
  double dragEnd = 0;
  double dragDistance = 0;

  void handleDragStart(double start) {
    dragStart = start;
  }

  void handleDragUpdate(double end) {
    dragEnd = end;
    dragDistance = dragEnd - dragStart;
    // TODO : if drag distance higher than 50, set menuOpen to true, 
    // else set menuOpen to false, and drawer go back to left with animation
  }

  // a function named handleDragEnd with parameters are a lambda function and a double threshold
  // if dragDistance higher than threshold, call lambda function
  void handleDragEnd(Function upLambda, Function downLambda, double threshold){
    if(dragDistance > threshold){
      upLambda();
    } else if(dragDistance < -threshold){
      downLambda();
    }
  }


  double getDragDistance(){
    return dragDistance;
  }

}