import 'package:flutter_delivery/common/model/cursor_pagination_model.dart';
import 'package:flutter_delivery/common/model/model_with_id.dart';
import 'package:flutter_delivery/common/model/pagination_params.dart';
import 'package:retrofit/retrofit.dart';

abstract class BasePaginationRepository<T extends ModelWithId> {
  Future<CursorPagination<T>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
