import 'dart:async';

part 'tea_bag.dart';
part 'tea_cup.dart';
part 'tea_pot.dart';

/// Tea Facade
/// 提供对外展示的 API 方法
class Tea {
	Tea._();
	
	/// 准备一个 TeaPot
	/// 需要提供 TeaBag
	static TeaPot<T> prepareTea<T>(TeaBag<T> teabag) {
		return TeaPot(teaBag: teabag);
	}
}