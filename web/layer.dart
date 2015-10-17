library layer;

import "dart:svg";
import "dart:collection";
import "../packages/uuid/uuid.dart";

abstract class Layer {

  final SvgSvgElement container;
  final Map<String, SvgElement> elements = new HashMap<String, SvgElement>();
  final Uuid uuid = new Uuid();

  Layer(SvgSvgElement this.container){
  }

  void add(String id, SvgElement element);
  String addAndGenerateId(SvgElement element);
  bool removeById(String id);
  bool remove(SvgElement element);
}

class DefaultLayer extends Layer {

  SvgElement _root;

  DefaultLayer(SvgSvgElement container) : super(container) {
    _root = new SvgElement.tag("g");
    _root.setAttribute("class", "layer");
    container.append(_root);
  }

  @override
  void add(String id, SvgElement element) {
    element.setAttribute("id", id);
    elements[id] = element;
    _root.append(element);
  }

  @override
  String addAndGenerateId(SvgElement element) {
    String id = uuid.v4();
    add(id, element);
    return id;
  }

  @override
  bool remove(SvgElement element) {
    String id = element.getAttribute("id");
    return removeById(id);
  }

  @override
  bool removeById(String id) {
    if(elements.containsKey(id)){
      return elements.remove(id) != null;
    } else {
      return false;
    }
  }
}