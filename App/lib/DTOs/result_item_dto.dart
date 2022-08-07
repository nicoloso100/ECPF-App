class ResultItemDTO {
  final String label;
  final String? value;

  ResultItemDTO({required this.label, required this.value});

  ResultItemDTO copyWithValue(String? value) {
    var newValue = value;
    return ResultItemDTO(label: label, value: newValue);
  }
}
