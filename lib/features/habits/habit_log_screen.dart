import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Habit Log Screen — Track daily routines, manage streaks, and log positive behaviors
class HabitLogScreen extends StatefulWidget {
  const HabitLogScreen({super.key});

  @override
  State<HabitLogScreen> createState() => _HabitLogScreenState();
}

class _HabitLogScreenState extends State<HabitLogScreen> {
  int _selectedDayIndex = 3; // Defaults to "Today" (Thursday)

  final List<Map<String, String>> _weekDays = [
    {'day': 'Mon', 'date': '22'},
    {'day': 'Tue', 'date': '23'},
    {'day': 'Wed', 'date': '24'},
    {'day': 'Thu', 'date': '25'}, // Today
    {'day': 'Fri', 'date': '26'},
    {'day': 'Sat', 'date': '27'},
    {'day': 'Sun', 'date': '28'},
  ];

  String _filter = 'All';

  final List<Map<String, dynamic>> _habits = [
    {
      'title': 'Read 20 Pages',
      'streak': 5,
      'category': 'Mindset',
      'time': '07:30 AM',
      'icon': Icons.menu_book_rounded,
      'isCompleted': true,
    },
    {
      'title': 'Drink 3L Water',
      'streak': 12,
      'category': 'Hydration',
      'time': 'Throughout Day',
      'icon': Icons.water_drop_rounded,
      'isCompleted': true,
    },
    {
      'title': '30 Mins Cardio & Stretching',
      'streak': 4,
      'category': 'Fitness',
      'time': '05:00 PM',
      'icon': Icons.directions_run_rounded,
      'isCompleted': true,
    },
    {
      'title': 'Evening Meditation & Gratitude',
      'streak': 0,
      'category': 'Wellness',
      'time': '09:30 PM',
      'icon': Icons.self_improvement_rounded,
      'isCompleted': false,
    },
    {
      'title': 'No Sugar After 8 PM',
      'streak': 7,
      'category': 'Nutrition',
      'time': '08:00 PM',
      'icon': Icons.no_food_outlined,
      'isCompleted': false,
    },
  ];

  void _toggleHabit(int index) {
    setState(() {
      final current = _habits[index]['isCompleted'] as bool;
      _habits[index]['isCompleted'] = !current;
      if (!current) {
        _habits[index]['streak'] = (_habits[index]['streak'] as int) + 1;
      } else {
        final streak = _habits[index]['streak'] as int;
        if (streak > 0) _habits[index]['streak'] = streak - 1;
      }
    });

    final isDone = _habits[index]['isCompleted'] as bool;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isDone
              ? 'Marked "${_habits[index]['title']}" as completed! 🔥'
              : 'Marked "${_habits[index]['title']}" as pending',
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showAddHabitSheet() {
    final titleController = TextEditingController();
    String selectedCategory = 'Fitness';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Create New Habit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: titleController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'e.g. 10,000 Steps / Day',
                      labelText: 'Habit Name',
                      filled: true,
                      fillColor: AppColors.cardSubtle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children:
                        [
                          'Fitness',
                          'Hydration',
                          'Nutrition',
                          'Mindset',
                          'Wellness',
                        ].map((cat) {
                          final isSelected = selectedCategory == cat;
                          return ChoiceChip(
                            label: Text(cat),
                            selected: isSelected,
                            selectedColor: AppColors.primaryLight,
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textSecondary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            onSelected: (val) {
                              setModalState(() {
                                selectedCategory = cat;
                              });
                            },
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (titleController.text.trim().isNotEmpty) {
                          setState(() {
                            _habits.add({
                              'title': titleController.text.trim(),
                              'streak': 1,
                              'category': selectedCategory,
                              'time': 'Daily Goal',
                              'icon': Icons.star_outline_rounded,
                              'isCompleted': false,
                            });
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'New habit created! Start your streak today 🌟',
                              ),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      child: const Text('SAVE HABIT'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _habits
        .where((h) => h['isCompleted'] == true)
        .length;
    final totalCount = _habits.length;
    final completionRate = totalCount > 0 ? (completedCount / totalCount) : 0.0;

    final filteredHabits = _habits.where((h) {
      if (_filter == 'Pending') return h['isCompleted'] == false;
      if (_filter == 'Completed') return h['isCompleted'] == true;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Monthly habit calendar view'),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddHabitSheet,
        backgroundColor: AppColors.accent,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'New Habit',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Weekly interactive calendar strip
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            color: AppColors.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_weekDays.length, (index) {
                final isSelected = _selectedDayIndex == index;
                final isToday = index == 3;
                final item = _weekDays[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDayIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 46,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : (isToday
                                ? AppColors.primaryLight
                                : AppColors.cardSubtle),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : (isToday
                                  ? AppColors.accent.withValues(alpha: 0.5)
                                  : AppColors.border),
                        width: isToday ? 1.5 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(
                                  alpha: 0.25,
                                ),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item['day']!,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white70
                                : (isToday
                                      ? AppColors.primary
                                      : AppColors.textSecondary),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['date']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : (isToday
                                      ? AppColors.primary
                                      : AppColors.textPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          const Divider(height: 1, color: AppColors.border),

          // Habit completion progress card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Consistency Score',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$completedCount of $totalCount finished',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.energyLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              color: AppColors.energyOrange,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '12d Streak',
                              style: TextStyle(
                                color: AppColors.energyOrange,
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: completionRate,
                      backgroundColor: AppColors.cardSubtle,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        completionRate >= 1.0
                            ? AppColors.success
                            : AppColors.accent,
                      ),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Filter chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: ['All', 'Pending', 'Completed'].map((filterName) {
                final isSelected = _filter == filterName;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(filterName),
                    selected: isSelected,
                    selectedColor: AppColors.primaryLight,
                    checkmarkColor: AppColors.primary,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                      fontSize: 12,
                    ),
                    onSelected: (val) {
                      setState(() {
                        _filter = filterName;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),

          // Habit Checklist
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemCount: filteredHabits.length,
              itemBuilder: (context, index) {
                final habit = filteredHabits[index];
                final originalIndex = _habits.indexOf(habit);
                final isDone = habit['isCompleted'] as bool;

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: isDone ? const Color(0xFFF9FAFB) : AppColors.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDone
                          ? AppColors.success.withValues(alpha: 0.35)
                          : AppColors.border,
                      width: 1,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDone
                            ? AppColors.success.withValues(alpha: 0.12)
                            : AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        habit['icon'] as IconData,
                        color: isDone ? AppColors.success : AppColors.primary,
                        size: 22,
                      ),
                    ),
                    title: Text(
                      habit['title'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                        color: isDone
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${habit['category']} • ${habit['time']}',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textMuted,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if ((habit['streak'] as int) > 0)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.local_fire_department,
                                size: 12,
                                color: AppColors.energyOrange,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '${habit['streak']}d',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.energyOrange,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    trailing: Checkbox(
                      value: isDone,
                      activeColor: AppColors.accent,
                      onChanged: (val) => _toggleHabit(originalIndex),
                    ),
                    onTap: () => _toggleHabit(originalIndex),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
