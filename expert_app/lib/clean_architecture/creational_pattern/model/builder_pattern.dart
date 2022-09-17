enum Type { dada, paha }

enum Sambal { matah, daunJeruk, korek, bawang }

class AyamGeprek {
  Type type;
  Sambal? sambal;
  bool extraNasi;
  int jmlCabai;
  String? notes;

  AyamGeprek({
    required this.type,
    this.sambal,
    this.extraNasi = false,
    this.jmlCabai = 0,
    this.notes,
  });

  AyamGeprek copyWith({
    Sambal? sambal,
    bool extraNasi = false,
    int jmlCabai = 0,
    String? notes,
  }) {
    return AyamGeprek(
        type: type,
        sambal: sambal ?? this.sambal,
        extraNasi: extraNasi,
        jmlCabai: jmlCabai,
        notes: notes ?? this.notes);
  }
}
