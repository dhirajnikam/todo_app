import 'package:floor/floor.dart';
import 'package:todoapp/utils/floor/model/floor.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM Todo')
  Future<List<Todo>> findAllTodo();

  @Query('SELECT * FROM Todo ORDER BY id DESC LIMIT 1')
  Future<Todo?> getMaxTodo();

  @Query('SELECT * FROM Todo ORDER BY id DESC')
  Stream<List<Todo>> fetchStreamData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTodo(Todo todo);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertAllTodo(List<Todo> todos);

  @Query('DELETE FROM Todo WHERE id = :id')
  Future<void> deleteTodo(int id);

  // @Delete()
  // Future<int> deleteAll(List<Todo> todos);
}
