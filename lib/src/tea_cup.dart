part of 'tea.dart';

class TeaCup<T> {
	TeaCup({this.isQualified, this.tea, this.teaBaby, this.dirtyThings});
	
	final bool isQualified;
	final T tea;
	final dynamic teaBaby;
	final dynamic dirtyThings;
}