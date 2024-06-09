class ReportModel {
  late int? lateTimeMin;
  late int? overTimeHours;
  late int? overTimeMinutes;
  late int? percentageValue;
  late int? avgLeavesCount;
  late int? avgAttendanceCount;
  late int? totalEmployeesCount;
  late int? totalInternship;
  late String? totalProcessedAmount;
  late String? overTimeAmount;

  ReportModel(
      {this.lateTimeMin,
      this.overTimeHours,
      this.overTimeMinutes,
      this.percentageValue,
      this.avgLeavesCount,
      this.avgAttendanceCount,
      this.totalEmployeesCount,
      this.totalInternship,
      this.totalProcessedAmount,
      this.overTimeAmount});
}
