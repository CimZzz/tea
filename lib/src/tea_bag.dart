part of 'tea.dart';

/// TeaBag 茶包
/// 众所周知，泡茶需要水和茶叶，而这里茶包就是用来提供 "茶叶" 和 "制作方法" 的。
abstract class TeaBag<T> {
	
	/// 热水。
	/// 在这个方法里，你需要将水烧开，从而制作一杯香浓或淡雅的茶
	Future<T> boilWater();
	
	/// 制茶。
	/// 当水烧开了以后，你就可以使用热水来制作茶，使用 `TeaCup` 来装做好的茶吧！
	TeaCup<T> makeTea(T data) {
		return TeaCup(isQualified: true, tea: data);
	}
	
	/// 脏茶。
	/// 如果制作过程中出了什么问题，导致无法制作出一杯完美的茶，那就将它用茶杯装起来，然后交给相关人员处理！
	TeaCup<T> dirtyTea(dynamic e, StackTrace stackTrace) {
		return TeaCup(isQualified: false, dirtyThings: e);
	}
	
	/// 尝试终止做茶
	void tryStop() {
	
	}
}