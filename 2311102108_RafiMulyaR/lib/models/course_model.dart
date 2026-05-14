import 'package:flutter/material.dart';

/// Representasi data kursus dalam aplikasi.
///
/// Model ini menyimpan informasi lengkap mengenai kursus,
/// termasuk nama, deskripsi, instruktur, progress, dan visual elements.
class CourseModel {
  final String id;
  final String title;
  final String subtitle;
  final String instructor;
  final String description;
  final Color color;
  final String icon; // emoji atau icon name
  final double progress; // 0.0 - 1.0
  final int students;
  final double rating; // 0.0 - 5.0
  final int modules;
  final String imageUrl; // placeholder image

  const CourseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.instructor,
    required this.description,
    required this.color,
    required this.icon,
    this.progress = 0.0,
    this.students = 0,
    this.rating = 0.0,
    this.modules = 0,
    this.imageUrl = '',
  });

  /// Membuat instance [CourseModel] dari data JSON.
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? 'Untitled Course',
      subtitle: json['subtitle'] as String? ?? '',
      instructor: json['instructor'] as String? ?? 'Unknown',
      description: json['description'] as String? ?? '',
      color: Color(json['color'] as int? ?? 0xFF667BC6),
      icon: json['icon'] as String? ?? '📚',
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      students: json['students'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      modules: json['modules'] as int? ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  /// Mengonversi instance [CourseModel] ke format JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'instructor': instructor,
      'description': description,
      'color': color.value,
      'icon': icon,
      'progress': progress,
      'students': students,
      'rating': rating,
      'modules': modules,
      'imageUrl': imageUrl,
    };
  }

  /// Membuat salinan [CourseModel] dengan properti baru.
  CourseModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? instructor,
    String? description,
    Color? color,
    String? icon,
    double? progress,
    int? students,
    double? rating,
    int? modules,
    String? imageUrl,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      instructor: instructor ?? this.instructor,
      description: description ?? this.description,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      progress: progress ?? this.progress,
      students: students ?? this.students,
      rating: rating ?? this.rating,
      modules: modules ?? this.modules,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
