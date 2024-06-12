class Dosen {
  String? ndin;
  String? nama;
  String? alamat;

  Dosen({
    this.ndin,
    this.nama,
    this.alamat,
  });

  factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        ndin: json['ndin'],
        nama: json['nama'],
        alamat: json['alamat'],
      );

  Map<String, dynamic> toJson() => {
        'ndin': this.ndin,
        'nama': this.nama,
        'alamat': this.alamat,
      };
}
