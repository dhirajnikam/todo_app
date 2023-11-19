import 'package:floor/floor.dart';

@Entity(tableName: 'Todo')
class Todo {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;
  final String description;
  final bool done;
  final String createdTime;

  Todo(
    this.id,
    this.title,
    this.description,
    this.done,
    this.createdTime,
  );
}
