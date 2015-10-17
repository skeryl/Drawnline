
import "dart:html";
import "tools.dart";
import "context.dart";

class DrawingApplication {

  Map<String, Tool> _tools;
  DrawingContext _context;
  Tool _activeTool;
  Element _element;

  DrawingApplication(){
  }

  void start(String rootSelector){
    _element = querySelector(rootSelector);
    _context = new DrawingContext(_element);
    _tools = <String, Tool>{
      "pencil": new Pencil(_context)
    };

    // initialize active tool to the first one
    _activeTool = _tools[_tools.keys.elementAt(0)];

    _element.onMouseMove.listen((e) {
      _activeTool.handleMouseMove(e);
    });

    _element.onMouseDown.listen((e) {
      _activeTool.handleMouseDown(e);
    });

    _element.onMouseUp.listen((e) {
      _activeTool.handleMouseUp(e);
    });

  }

}

