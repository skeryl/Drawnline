library context;

import "dart:html";
import "dart:svg";
import "dart:collection";

import "layer.dart";

class DrawingContext {

  final Element rootElement;
  final HashMap<String, Layer> layers = new HashMap<String, Layer>();

  SvgSvgElement _rootSvgElement;
  Layer _activeLayer;

  DrawingContext(Element this.rootElement){
    _rootSvgElement = new SvgSvgElement();
    _rootSvgElement.setAttribute("id", "drawing");
    //_rootSvgElement.setAttribute("viewBox", "0 0 400 400");
    rootElement.append(_rootSvgElement);
    _activeLayer = layers["Layer 1"] = new DefaultLayer(_rootSvgElement);

  }

  void activateLayer(String layerName){
    _activeLayer = layers[layerName];
  }

  Layer layer(){
    return _activeLayer;
  }

}

class DefaultDrawingContext extends DrawingContext {
  DefaultDrawingContext(Element rootElement) : super(rootElement){
  }
}