import 'package:equatable/equatable.dart';

import 'item.book_moedl.dart';

class  extends Equatable {
	final String? kind;
	final int? totalItems;
	final List<Item>? items;

	const ({this.kind, this.totalItems, this.items});

	factory .fromJson(Map<String, dynamic> json) => (
				kind: json['kind'] as String?,
				totalItems: json['totalItems'] as int?,
				items: (json['items'] as List<dynamic>?)
						?.map((e) => Item.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'kind': kind,
				'totalItems': totalItems,
				'items': items?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [kind, totalItems, items];
}
