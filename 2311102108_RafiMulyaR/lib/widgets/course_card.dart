import 'package:flutter/material.dart';
import '../models/course_model.dart';
import '../constants/app_colors.dart';

/// Menampilkan kartu kursus dengan preview lengkap.
///
/// Widget ini menampilkan informasi kursus dengan desain modern,
/// termasuk progress bar, rating, dan instruktur.
class CourseCard extends StatelessWidget {
  final CourseModel course;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background gradient header
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    course.color.withOpacity(0.8),
                    course.color.withOpacity(0.6),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.icon,
                          style: const TextStyle(fontSize: 28),
                        ),
                        if (course.rating > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 10,
                                  color: Color(0xFFF39C12),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  course.rating.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    Text(
                      course.modules > 0 ? '${course.modules} Module' : 'Mulai',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content section
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      course.instructor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Progress bar
                    if (course.progress > 0) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: LinearProgressIndicator(
                          value: course.progress,
                          minHeight: 3,
                          backgroundColor: AppColors.border,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            course.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${(course.progress * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(
                          fontSize: 10,
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ] else
                      const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
