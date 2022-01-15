import '../mixins/has_identifier.dart';
import '../mixins/has_name.dart';
import '../mixins/has_parent.dart';
import '../utils/name.dart';
import '../utils/node_type.dart';
import '../visitors/visitor.dart';
import 'node.dart';

/// XML doctype node.
class XmlDoctype extends XmlNode
    with XmlHasName, XmlHasParent<XmlNode>, XmlHasIdentifier {
  /// Create a doctype declaration.
  XmlDoctype(this.name, [this.publicId, this.systemId, this.internalSubset]) {
    name.attachParent(this);
  }

  @override
  final XmlName name;

  @override
  final String? publicId;

  @override
  final String? systemId;

  /// Returns the document type definition (DTD), or `null` if absent.
  String? internalSubset;

  @override
  XmlNodeType get nodeType => XmlNodeType.DOCUMENT_TYPE;

  @override
  XmlDoctype copy() =>
      XmlDoctype(name.copy(), publicId, systemId, internalSubset);

  @override
  dynamic accept(XmlVisitor visitor) => visitor.visitDoctype(this);
}
