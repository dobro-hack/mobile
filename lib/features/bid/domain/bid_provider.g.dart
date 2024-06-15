// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dateAvailabilityHash() => r'846acc6b62cd504442c337402cc32c82e6eeb153';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [dateAvailability].
@ProviderFor(dateAvailability)
const dateAvailabilityProvider = DateAvailabilityFamily();

/// See also [dateAvailability].
class DateAvailabilityFamily extends Family<AsyncValue<bool>> {
  /// See also [dateAvailability].
  const DateAvailabilityFamily();

  /// See also [dateAvailability].
  DateAvailabilityProvider call(
    DateTime date,
  ) {
    return DateAvailabilityProvider(
      date,
    );
  }

  @override
  DateAvailabilityProvider getProviderOverride(
    covariant DateAvailabilityProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dateAvailabilityProvider';
}

/// See also [dateAvailability].
class DateAvailabilityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [dateAvailability].
  DateAvailabilityProvider(
    DateTime date,
  ) : this._internal(
          (ref) => dateAvailability(
            ref as DateAvailabilityRef,
            date,
          ),
          from: dateAvailabilityProvider,
          name: r'dateAvailabilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dateAvailabilityHash,
          dependencies: DateAvailabilityFamily._dependencies,
          allTransitiveDependencies:
              DateAvailabilityFamily._allTransitiveDependencies,
          date: date,
        );

  DateAvailabilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DateAvailabilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DateAvailabilityProvider._internal(
        (ref) => create(ref as DateAvailabilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DateAvailabilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DateAvailabilityProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DateAvailabilityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DateAvailabilityProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DateAvailabilityRef {
  _DateAvailabilityProviderElement(super.provider);

  @override
  DateTime get date => (origin as DateAvailabilityProvider).date;
}

String _$numberOfGuestsHash() => r'0fb930187796c418683224f497569be83ebca8e8';

/// See also [NumberOfGuests].
@ProviderFor(NumberOfGuests)
final numberOfGuestsProvider =
    AutoDisposeNotifierProvider<NumberOfGuests, int>.internal(
  NumberOfGuests.new,
  name: r'numberOfGuestsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$numberOfGuestsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NumberOfGuests = AutoDisposeNotifier<int>;
String _$bookingStatusHash() => r'd7243c054e8ef20bf3d9950bffb17e40167ae221';

/// See also [BookingStatus].
@ProviderFor(BookingStatus)
final bookingStatusProvider =
    AutoDisposeNotifierProvider<BookingStatus, AsyncValue<bool>>.internal(
  BookingStatus.new,
  name: r'bookingStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookingStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookingStatus = AutoDisposeNotifier<AsyncValue<bool>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
