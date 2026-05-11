/// Representasi data tugas dalam aplikasi.
///
/// Model ini menyimpan informasi detail mengenai tugas,
/// termasuk nama tugas, mata kuliah, dan batas waktu.
class TaskModel {
  final String title;
  final String course;
  final String deadline;
  final String time;

  const TaskModel({
    required this.title,
    required this.course,
    required this.deadline,
    required this.time,
  });

  // JSON Mapping

  /// Membuat instance [TaskModel] dari data JSON.
  ///
  /// Digunakan untuk mengonversi data dari format map
  /// ke dalam objek model yang terstruktur.
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] as String? ?? 'Untitled Task',
      course: json['course'] as String? ?? 'Unknown Course',
      deadline: json['deadline'] as String? ?? '-',
      time: json['time'] as String? ?? '-',
    );
  }

  /// Mengonversi instance [TaskModel] ke format JSON.
  ///
  /// Memudahkan proses penyimpanan data atau 
  /// pengiriman data kembali ke server/storage.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'course': course,
      'deadline': deadline,
      'time': time,
    };
  }

  // Helpers

  /// Membuat salinan [TaskModel] dengan properti baru.
  ///
  /// Berguna untuk memperbarui data model tanpa
  /// mengubah state objek yang sudah ada.
  TaskModel copyWith({
    String? title,
    String? course,
    String? deadline,
    String? time,
  }) {
    return TaskModel(
      title: title ?? this.title,
      course: course ?? this.course,
      deadline: deadline ?? this.deadline,
      time: time ?? this.time,
    );
  }
}