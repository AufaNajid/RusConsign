import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/extension.dart';
import 'package:rusconsign/utils/text_style.dart';

class TimerTest extends StatelessWidget {
  final DateTime deadline;

  const TimerTest({
    required this.deadline,
    Key? key,
  }) : super(key: key);

  Stream<Duration> _timerStream() async* {
    while (true) {
      final duration = deadline.difference(DateTime.now());
      if (duration.isNegative) {
        yield Duration.zero;
        break;
      }
      yield duration;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: _timerStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final duration = snapshot.data!;
        final hours = DefaultTextStyle(
          style: AppTextStyle().countdownText(AppColors.hargaStat),
          child: Text(
            duration.inHours.toString().padLeft(2, '0'),
          ),
        );

        final minutes = DefaultTextStyle(
          style: AppTextStyle().countdownText(AppColors.hargaStat),
          child: Text(
            duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
          ),
        );

        final seconds = DefaultTextStyle(
          style: AppTextStyle().countdownText(AppColors.hargaStat),
          child: Text(
            duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
          ),
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardProdukTidakDipilih,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    hours,
                    Text(
                      "Jam",
                      style: AppTextStyle().subHeader(AppColors.description),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardProdukTidakDipilih,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    minutes,
                    Text(
                      "Menit",
                      style: AppTextStyle().subHeader(AppColors.description),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardProdukTidakDipilih,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    seconds,
                    Text(
                      "Detik",
                      style: AppTextStyle().subHeader(AppColors.description),
                    )
                  ],
                ),
              ),
            ),
          ].withSpaceBetween(width: 10),
        );
      },
    );
  }
}
