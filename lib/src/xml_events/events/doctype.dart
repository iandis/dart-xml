import '../../xml/utils/node_type.dart';
import '../event.dart';
import '../utils/named.dart';
import '../visitor.dart';

/// Event of an XML doctype node.
class XmlDoctypeEvent extends XmlEvent with XmlNamed {
  XmlDoctypeEvent(this.name, this.publicId, this.systemId, this.internalSubset);

  @override
  final String name;

  final String? publicId;

  final String? systemId;

  final String? internalSubset;

  @override
  XmlNodeType get nodeType => XmlNodeType.DOCUMENT_TYPE;

  @override
  void accept(XmlEventVisitor visitor) => visitor.visitDoctypeEvent(this);

  @override
  int get hashCode =>
      Object.hash(nodeType, name, publicId, systemId, internalSubset);

  @override
  bool operator ==(Object other) =>
      other is XmlDoctypeEvent &&
      other.name == name &&
      other.publicId == publicId &&
      other.systemId == systemId &&
      other.internalSubset == internalSubset;
}
