part of 'tea.dart';

class TeaPot<T> {
	TeaPot({TeaBag<T> teaBag}): _teaBag = teaBag;
	final TeaBag<T> _teaBag;
	
	Completer<TeaCup<T>> _completer;
	StreamSubscription<T> _subscription;
	
	Future<TeaCup<T>> drink({bool remake = false, bool dropBefore}) {
		if(remake) {
			_subscription?.cancel();
			_subscription = null;
			if(_completer != null) {
				if (_completer.isCompleted) {
					_completer = null;
				}
				else if(dropBefore) {
					_completer.complete(_teaBag.dirtyTea(null, null));
					_completer = null;
				}
			}
		}
		
		if(remake || _completer == null) {
			// 未曾开始时会
			_completer ??= Completer();
			_subscription = _teaBag.boilWater().asStream().listen(
					(data) {
					_completer.complete(_teaBag.makeTea(data));
				},
				onError: (e, stackTrace) {
					_completer.complete(_teaBag.dirtyTea(e, stackTrace));
				}
			);
		}
		
		return _completer.future;
	}
}
