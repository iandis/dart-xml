/// Mixin for all nodes with an identifier.
mixin XmlHasIdentifier {
  /// Return the public identifier, or `null` if none.
  String? get publicId;

  /// Return the system identifier, or `null` if none.
  String? get systemId;
}
