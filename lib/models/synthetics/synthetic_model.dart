
import 'package:deus_mobile/data_source/currency_data.dart';
import 'package:deus_mobile/models/token.dart';

enum SelectionMode { none, long, short }
enum SyntheticState { closedMarket, openMarket, loading, timeRequired }

class SyntheticModel{
  Token from;
  Token to;
  SelectionMode selectionMode;
  SyntheticState syntheticState;
  bool approved;


  SyntheticModel(){
    this.selectionMode = SelectionMode.none;
    this.syntheticState = SyntheticState.loading;
    this.from = CurrencyData.dai;
    this.to = null;
    this.approved = false;
  }

}