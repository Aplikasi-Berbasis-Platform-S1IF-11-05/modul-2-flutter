import 'package:flutter/material.dart';
import '../models/task_model.dart';

/// Menampilkan kartu tugas yang mendekati batas waktu.
///
/// Widget ini digunakan dalam grid untuk menonjolkan
/// tugas-tugas paling mendesak dengan desain yang ringkas.
class UrgentTaskCard extends StatelessWidget {
  final TaskModel task;

  const UrgentTaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE9E9E7), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFBE4E4),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              task.deadline,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFFC03221),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF37352F),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            task.course,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF787774),
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Divider(height: 16, color: Color(0xFFE9E9E7), thickness: 1),
          Row(
            children: [
              const Icon(Icons.access_time_rounded, size: 14, color: Color(0xFF787774)),
              const SizedBox(width: 6),
              Text(
                task.time,
                style: const TextStyle(
                  fontSize: 12, 
                  color: Color(0xFF787774),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}