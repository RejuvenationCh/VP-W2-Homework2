# Week 02: Widget composition
The main cleaner screen itself is split into 5 small stateless widgets. None of them keep any state of their own. "Reports upward" means the widget doesn't change anything itself. It calls a function the screen gave it, and the screen updates its state and rebuilds.

## SizeBadge
- Trigger : Reuse, the same size label appears in the storage header and on every media tile.
- Owns : Nothing, this only formats the bytes it is given.
- Reports upward : Nothing,  only displays a value and has nothing to click.
IF he number is 1 GB or more, it divides by that and shows one decimal such as 3.8 GB. Otherwise it divides by 1024 × 1024 and rounds to a whole number such as 24 MB

## StorageSummaryHeader
- Trigger : Readability, it moves the "X of Y used" text, the progress bar and the media total out of the screen's build method.
- Owns : Nothing. The used, total and media byte counts all come in as parameters.
- Reports upward : Nothing. It only displays values.

## CategoryFilterChips
- Trigger : Readability, this is the row of buttons at the top to pick which type of media to show. Making one button for every category takes a loop, so it gets its own widget to keep the main screen clean.
- Owns : Nothing, the main screen tells it which button is picked right now.
- Reports upward : onSelected, when a button is tapped it tells the main screen which category was picked.
After that the main screen remembers the chosen category, shows only the media of that type, and highlights the button that was tapped. Picking All shows everything again.

## MediaTile
- Trigger : Reuse, this is one box in the grid with an icon, the file name and the size. The grid uses the same widget for every media item.
- Owns : Nothing, it does not remember if it is selected. The main screen tells it.
- Reports upward : onTap, when the box is tapped it tells the main screen.
The main screen then marks that item as selected, or unselects it if it was already selected. The box then shows or hides the colored border and the check icon.

## SelectionActionBar
- Trigger : Readability, this is the bar at the bottom that only appears when something is selected. It shows how many items are picked, how big they are in total, and three buttons.
- Owns : Nothing, the number of items and the total size come from the main screen.
- Reports upward : onClear, onOffload and onDelete, one for each button.
Clear unselects everything, so the bar goes away. Offload and Delete both remove the selected items from the list and show a short message at the bottom telling how many items were removed.

## Why the screen owns the state
The item list, filter, sort order and selection all live in MediaCleanerScreen, because several children need the same data :
- The grid needs the filtered and sorted list, plus the selection
- The header needs the total media size
- The action bar needs the selected count and size
When a tile is tapped, the tile and the action bar both have to update. If the selection lived inside MediaTile, the action bar would have no way to see it. So the state sits in the common parent. The parent passes values down, and each child reports changes back up through its callbacks.
