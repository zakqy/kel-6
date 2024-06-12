class Api{
  static const _host =  "http://192.168.1.9/api_if22a";

  static String _mahasiswa = "$_host/mahasiswa";

  // mahasiswa
  static String getMahasiswa = "$_mahasiswa/view.php";
  static String addMahasiswa = "$_mahasiswa/add.php";
  static String updateMahasiswa = "$_mahasiswa/update.php";
  static String deleteMahasiswa = "$_mahasiswa/delete.php";

  static String _dosen = "$_host/dosen";

  // dosen
  static String getDosen = "$_mahasiswa/view.php";
  static String addDosen = "$_mahasiswa/add.php";
  static String updateDosen = "$_mahasiswa/update.php";
  static String deleteDosen = "$_mahasiswa/delete.php";

  static String login = "$_host/login.php";


}