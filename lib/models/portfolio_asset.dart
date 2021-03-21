class PortfolioAsset {
  final String img;
  final String fullName;
  final String shortName;
  final double absolutePerformance;
  final double relativePerformance;
  final double relative24hReturn;
  final double absolute24hReturn;
  final double avgCost;
  final double fullValueOfPosition;

  PortfolioAsset(
      this.img,
      this.fullName,
      this.shortName,
      this.absolutePerformance,
      this.relativePerformance,
      this.avgCost, this.relative24hReturn, this.absolute24hReturn, this.fullValueOfPosition);
}
