abstract class AppStates{}
class AppInitialStates extends AppStates{}
class AppChangeButtom extends AppStates{}
class AppChangeObscure extends AppStates{}
class AppGetCategoryDataLoading extends AppStates{}
class AppGetCategoryDataSuccess extends AppStates{}
class Appcounterplus extends AppStates{}
class Appcounterminus extends AppStates{}

class AppGetCategoryDataError extends AppStates{
  final String error;
  AppGetCategoryDataError(this.error);
}