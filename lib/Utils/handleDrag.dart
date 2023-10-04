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
  }

  void handleDragEnd(Function upLambda, Function downLambda, double threshold){
    if(dragDistance > threshold){
      upLambda();
    } else if(dragDistance < -threshold){
      downLambda();
    }
    dragDistance = 0;
  }


  double getDragDistance(){
    return dragDistance;
  }

}