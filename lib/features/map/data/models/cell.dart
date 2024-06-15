class Cell {
  final String name;
  final String iconAsset;
  final String description;
  const Cell({
    required this.description,
    required this.iconAsset,
    required this.name,
  });
}

const List<Cell> cells = [
  Cell(
    name: 'Билайн',
    description: 'Звонки работают, Интернет пропадает',
    iconAsset: 'assets/icons/beeline.svg',
  ),
  Cell(
    name: 'МТС',
    description: 'Звонки работают, Интернет работает',
    iconAsset: 'assets/icons/mtc.svg',
  ),
  Cell(
    name: 'Мегафон',
    description: 'Звонки не работают, Интернет не работает',
    iconAsset: 'assets/icons/megafon.svg',
  ),
  Cell(
    name: 'Теле2',
    description: 'Звонки не работают, Интернет не работает',
    iconAsset: 'assets/icons/tele2.svg',
  ),
];
