class PegawaiModel {
  int id;
  String nama;
  String pangkat;
  String golongan;
  String Ijazah;
  String tanggalLahir;
  String tempatLahir;
  String tmtPNS;
  String tmtGolongan;
  List<SifatPegawai> sifat;
  List<KeahlianPegawai> keahlian;
  List<DiklatPegawai> diklat;

  PegawaiModel(
      {required this.id,
      required this.nama,
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

  factory PegawaiModel.fromJSON(Map<String, dynamic> json) {
    return PegawaiModel(
        id: json['id_karyawan'],
        nama: json['nama'],
        pangkat: json['pangkat'],
        Ijazah: json['ijazah'],
        golongan: json['golongan'],
        tanggalLahir: json['tanggal_lahir'],
        tempatLahir: json['tempat_lahir'],
        tmtPNS: json['tmt_pns'],
        tmtGolongan: json['tmt_golongan'],
        sifat: List<SifatPegawai>.from(
            json['sifat'].map((x) => SifatPegawai.fromJSON(x))),
        keahlian: List<KeahlianPegawai>.from(
            json['keahlihan'].map((x) => KeahlianPegawai.fromJSON(x))),
        diklat: List<DiklatPegawai>.from(
            json['diklat'].map((x) => DiklatPegawai.fromJSON(x))));
  }
}

class SifatPegawai {
  int id_sifat;
  String sifat;

  SifatPegawai({
    required this.id_sifat,
    required this.sifat,
  });

  factory SifatPegawai.fromJSON(Map<String, dynamic> json) {
    return SifatPegawai(
        id_sifat: json['id_sifat'], sifat: json['sifat_karyawan']);
  }
}

class KeahlianPegawai {
  int id_keahlian;
  String keahlian;

  KeahlianPegawai({required this.id_keahlian, required this.keahlian});

  factory KeahlianPegawai.fromJSON(Map<String, dynamic> json) {
    return KeahlianPegawai(
        id_keahlian: json['id_keahlihan'],
        keahlian: json['keahlihan_karyawan']);
  }
}

class DiklatPegawai {
  int id_diklat;
  String diklat;

  DiklatPegawai({
    required this.id_diklat,
    required this.diklat,
  });

  factory DiklatPegawai.fromJSON(Map<String, dynamic> json) {
    return DiklatPegawai(id_diklat: json['id_diklat'], diklat: json['diklat']);
  }
}
