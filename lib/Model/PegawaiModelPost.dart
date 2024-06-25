class PegawaiModelPost {
  String nama;
  String pangkat;
  String golongan;
  String Ijazah;
  String tanggalLahir;
  String tempatLahir;
  String tmtPNS;
  String tmtGolongan;
  List<String> sifat;
  List<String> keahlian;
  List<String> diklat;

  PegawaiModelPost(
      {required this.nama,
      required this.pangkat,
      required this.golongan,
      required this.tanggalLahir,
      required this.tempatLahir,
      required this.tmtPNS,
      required this.Ijazah,
      required this.tmtGolongan,
      required this.sifat,
      required this.keahlian,
      required this.diklat});

  factory PegawaiModelPost.fromJSON(Map<String, dynamic> json) {
    return PegawaiModelPost(
      nama: json['nama'],
      pangkat: json['pangkat'],
      Ijazah: json['ijazah'],
      golongan: json['golongan'],
      tanggalLahir: json['tanggal_lahir'],
      tempatLahir: json['tempat_lahir'],
      tmtPNS: json['tmt_pns'],
      tmtGolongan: json['tmt_golongan'],
      diklat: [],
      keahlian: [],
      sifat: [],
    );
  }
}
