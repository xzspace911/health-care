import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_care/presentation/Utils/colors.dart';

class BuildChart extends StatelessWidget {
  const BuildChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: 1,
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(
              border: const Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
              ),
            ),
            groupsSpace: 10,
            barGroups: [
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: 6,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    toY: 4,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: 6,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    toY: 4,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x:5,
                barRods: [
                  BarChartRodData(
                    toY: 1,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    toY: 7,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 7,
                barRods: [
                  BarChartRodData(
                    toY: 10,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
              BarChartGroupData(
                x: 8,
                barRods: [
                  BarChartRodData(
                    toY: 2,
                    width: 10,
                    color: XColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
