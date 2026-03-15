import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/model/user_modell.dart';

@GenerateAdapters([AdapterSpec<TaskModel>(),AdapterSpec<UserModel>()])
part 'hive_adapters.g.dart';