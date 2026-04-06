import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/Core/Model/task_model.dart';
import 'package:taskati/Core/Model/user_model.dart';


@GenerateAdapters([AdapterSpec<TaskModel>(), AdapterSpec<UserModel>()])
part 'hive_adapters.g.dart';
