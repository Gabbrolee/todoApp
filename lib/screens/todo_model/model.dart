class Todo {
  int? id ;
  final String title ;
  DateTime creationDate;
  bool isChecked;

  // create constructor
  Todo(
      {
        this.id,
        required this.title,
        required this.creationDate,
        required this.isChecked
      });

  // saving data in database in a map format
Map<String, dynamic> toMap(){
   return {
     'id': id,
     'title' : title,
     'creationDate': creationDate.toString(), // convert to string
     'isChecked': isChecked ? 1 : 0, //
    };
   }
   @override
  String toString() {
   return 'Todo(id : $id, title : $title, isChecked : $isChecked)';
   }
 }
