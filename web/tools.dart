import 'dart:html';
import 'context.dart';
import 'dart:svg';

abstract class Tool {
  final DrawingContext _context;

  Tool(DrawingContext this._context){
  }

  String getName();
  String getIconClass();

  void handleMouseMove(MouseEvent e);
  void handleMouseDown(MouseEvent e);
  void handleMouseUp(MouseEvent e);

}

class Pencil extends Tool {

  SvgElement current = null;

  Pencil(DrawingContext context) : super(context);

  @override
  String getIconClass() => "glyphicon glyphicon-pencil";

  @override
  String getName() => "pencil";

  String _positionFromEvent(MouseEvent e) => e.client.x.toString() + "," + e.client.y.toString();

  @override
  void handleMouseDown(MouseEvent e) {
    if(current == null){
      current = new SvgElement.tag("path");
      current.setAttribute("d", "M " + _positionFromEvent(e));
      _context.layer().addAndGenerateId(current);
    }
  }

  @override
  void handleMouseMove(MouseEvent e) {
    if(current != null){
      String d = current.getAttribute("d");
      d += " " + _positionFromEvent(e);
      current.setAttribute("d", d);
    }
  }

  @override
  void handleMouseUp(MouseEvent e) {
    if(current != null){
      current = null;
    }
  }

}