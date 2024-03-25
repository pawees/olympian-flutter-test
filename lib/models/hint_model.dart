enum HintState {
  hidden,
  visible,
}

class HintModel {
  HintState state;

  HintModel({
    required this.state,
  });

  void makeVisible() {
    state = HintState.visible;
  }

  void makeHidden() {
    state = HintState.hidden;
  }

  hintStateFromString(String state) {
    switch (state) {
      case 'visible':
        return HintState.visible;
      case 'hidden':
        return HintState.hidden;
    }
  }
}
