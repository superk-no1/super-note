abstract class AppRoutes {
  static const home = '/';
  static const noteDetail = '/note/:id';

  static String noteDetailPath(String id) => '/note/$id';
}
