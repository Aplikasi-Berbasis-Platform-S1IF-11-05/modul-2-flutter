import 'package:flutter/material.dart';
import '../models/task_model.dart';

/// Menampilkan item tugas dalam bentuk daftar linear.
///
/// Digunakan untuk menyajikan daftar tugas umum
/// dengan informasi judul, mata kuliah, dan tenggat waktu.
class TaskListTile extends StatelessWidget {
  final TaskModel task;

  const TaskListTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE9E9E7), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Icon(Icons.article_outlined, color: Color(0xFF787774), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF37352F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.course,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF787774),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1EF),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  task.deadline,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: Color(0xFF37352F),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.schedule, size: 12, color: Color(0xFF787774)),
                  const SizedBox(width: 4),
                  Text(
                    task.time,
                    style: const TextStyle(
                      fontSize: 11, 
                      color: Color(0xFF787774),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}